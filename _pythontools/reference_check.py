#!/usr/bin/env python3
"""Static reference checker for datapacks in this workspace.

Resolves every function reference a datapack makes and reports the ones that
point at nothing. Minecraft does not fail loudly on a missing function: the
command simply errors at runtime and the rest of the file keeps going, so dead
references survive for years. Run this after any framework change, namespace
rename, or re-vendoring.

What is checked, per datapack directory:
  - `function <ns>:<path>` and `function #<ns>:<tag>` in every .mcfunction
  - `schedule function <ns>:<path>` and `schedule clear <ns>:<path>`
  - entries of function tags under data/<ns>/tags/function/**.json
  - `rewards.function` in advancement JSON
  - every JSON file parses

Macro lines (starting with `$`) are scanned too, but a reference that ends in
`$(` is dynamic and is skipped rather than reported.

Usage:
  python reference_check.py                 # every pack directory next to _pythontools
  python reference_check.py harvester-v3.03.02 datapackmanager-core
  python reference_check.py --orphans PACK  # also list functions nothing references

Exit code is 1 when any reference is unresolved, so it can gate a release.
Pure ASCII on purpose.
"""

import json
import re
import sys
from pathlib import Path

FUNCTION_REF = re.compile(r"(?<![\w#])function\s+(#?)([a-z0-9_.\-]+):([a-z0-9_./\-]+)")
SCHEDULE_CLEAR_REF = re.compile(r"schedule\s+clear\s+([a-z0-9_.\-]+):([a-z0-9_./\-]+)")
LOAD_TICK_TAGS = ("minecraft:load", "minecraft:tick")


def collect(pack_root):
    """Return (functions, tags) as sets of 'ns:path' ids present on disk."""
    data = pack_root / "data"
    functions = set()
    tags = set()
    if not data.is_dir():
        return functions, tags
    for path in data.rglob("*.mcfunction"):
        rel = path.relative_to(data).as_posix().split("/")
        if len(rel) < 3 or rel[1] not in ("function", "functions"):
            continue
        functions.add(rel[0] + ":" + "/".join(rel[2:])[: -len(".mcfunction")])
    for path in data.rglob("*.json"):
        rel = path.relative_to(data).as_posix().split("/")
        if len(rel) >= 4 and rel[1] == "tags" and rel[2] in ("function", "functions"):
            tags.add(rel[0] + ":" + "/".join(rel[3:])[: -len(".json")])
    return functions, tags


def scan(pack_root, functions, tags):
    """Return (unresolved, referenced, ref_count).

    unresolved: dict id -> sorted list of referring files
    referenced: set of function ids that something points at
    """
    data = pack_root / "data"
    unresolved = {}
    referenced = set()
    ref_count = 0

    def miss(ref_id, source):
        unresolved.setdefault(ref_id, set()).add(source)

    for path in list(data.rglob("*.mcfunction")):
        source = path.relative_to(pack_root).as_posix()
        text = path.read_text(encoding="utf-8", errors="replace")
        for line in text.splitlines():
            stripped = line.lstrip()
            if stripped.startswith("#"):
                continue
            for match in FUNCTION_REF.finditer(line):
                if line[match.end():match.end() + 2] == "$(":
                    continue
                ref_count += 1
                ref_id = match.group(2) + ":" + match.group(3)
                if match.group(1) == "#":
                    if ref_id not in tags:
                        miss("#" + ref_id, source)
                else:
                    referenced.add(ref_id)
                    if ref_id not in functions:
                        miss(ref_id, source)
            for match in SCHEDULE_CLEAR_REF.finditer(line):
                if line[match.end():match.end() + 2] == "$(":
                    continue
                ref_count += 1
                ref_id = match.group(1) + ":" + match.group(2)
                referenced.add(ref_id)
                if ref_id not in functions:
                    miss(ref_id, source)

    for path in list(data.rglob("*.json")):
        source = path.relative_to(pack_root).as_posix()
        rel = path.relative_to(data).as_posix().split("/")
        try:
            doc = json.loads(path.read_text(encoding="utf-8-sig"))
        except Exception as error:  # noqa: BLE001 - report every parse failure
            miss("JSON parse error: " + str(error), source)
            continue
        is_function_tag = len(rel) >= 4 and rel[1] == "tags" and rel[2] in ("function", "functions")
        if is_function_tag and isinstance(doc, dict):
            for value in doc.get("values") or []:
                ref_id = value if isinstance(value, str) else (value or {}).get("id")
                if not ref_id:
                    continue
                ref_count += 1
                if ref_id.startswith("#"):
                    if ref_id[1:] not in tags:
                        miss(ref_id, source)
                else:
                    referenced.add(ref_id)
                    if ref_id not in functions:
                        miss(ref_id, source)
        if isinstance(doc, dict):
            reward = (doc.get("rewards") or {}).get("function") if isinstance(doc.get("rewards"), dict) else None
            if reward:
                ref_count += 1
                referenced.add(reward)
                if reward not in functions:
                    miss(reward, source)

    return {k: sorted(v) for k, v in unresolved.items()}, referenced, ref_count


def check(pack_root, show_orphans):
    functions, tags = collect(pack_root)
    unresolved, referenced, ref_count = scan(pack_root, functions, tags)
    print("== %s: %d functions, %d tags, %d references, %d unresolved" % (
        pack_root.name, len(functions), len(tags), ref_count, len(unresolved)))
    for ref_id in sorted(unresolved):
        referrers = unresolved[ref_id]
        extra = "" if len(referrers) <= 3 else " (+%d more)" % (len(referrers) - 3)
        print("   MISSING %s  <- %s%s" % (ref_id, ", ".join(referrers[:3]), extra))
    if show_orphans:
        orphans = sorted(f for f in functions if f not in referenced)
        print("   orphans (never referenced): %d" % len(orphans))
        for f in orphans:
            print("     %s" % f)
    return len(unresolved) == 0


def default_packs(repo_root):
    packs = []
    for entry in sorted(repo_root.iterdir()):
        if entry.is_dir() and (entry / "data").is_dir() and entry.name != "_archived":
            packs.append(entry)
    return packs


def main(argv):
    show_orphans = "--orphans" in argv
    args = [a for a in argv if a != "--orphans"]
    repo_root = Path(__file__).resolve().parent.parent
    targets = [Path(a) if Path(a).is_absolute() else repo_root / a for a in args] or default_packs(repo_root)
    ok = True
    for target in targets:
        if not (target / "data").is_dir():
            print("== %s: no data/ directory, skipped" % target)
            continue
        ok = check(target, show_orphans) and ok
    return 0 if ok else 1


if __name__ == "__main__":
    sys.exit(main(sys.argv[1:]))
