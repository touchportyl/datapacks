#!/usr/bin/env python3
"""Derive a renamed generation of the DatapackManager template.

The framework namespace carries a generation label (datapackmanager-1.21,
datapackmanager-26.3, ...). Producing a new generation used to mean copying the
template directory, renaming one folder, and then rewriting every reference by
hand; twice that last step was skipped, which left a template whose functions
all called a namespace it no longer contained. This script does the whole
derivation mechanically, so the derived generation is the template with the
namespace and label substituted and nothing else.

Substitutions, applied to every text file and to the framework directory name:
  - the source namespace becomes the target namespace
    (datapackmanager-1.21 -> datapackmanager-26.3)
  - the source label becomes the target label wherever it appears as a word
    (mc1.21 -> mc26.3), which covers the alert prefix and the .mpp-datapack name

Both labels are read from the directory names (datapackmanager-mcX -> label
mcX, namespace datapackmanager-X) unless overridden.

Usage:
  python derive_generation.py datapackmanager-mc1.21 datapackmanager-mc26.3
  python derive_generation.py SOURCE TARGET --namespace datapackmanager-26.3 --label mc26.3
  python derive_generation.py SOURCE TARGET --check     # report drift, exit 1 if any

Without --check the target directory is created or brought up to date; files
in the target that the derivation does not produce are removed, so the target
never accumulates stale copies.
Pure ASCII on purpose.
"""

import re
import shutil
import sys
from pathlib import Path

TEXT_SUFFIXES = (".mcfunction", ".json", ".mcmeta", ".disabled", ".mpp-datapack", ".md")
SKIP_DIRS = {".git", "__pycache__"}


def is_text(path):
    return path.name == ".mpp-datapack" or path.name.endswith(TEXT_SUFFIXES)


def label_of(directory):
    """datapackmanager-mc1.21 -> mc1.21"""
    match = re.match(r"^datapackmanager-(mc[0-9.]+)$", directory.name)
    if not match:
        raise SystemExit("cannot read a label from directory name %r; pass --label" % directory.name)
    return match.group(1)


def framework_namespace(directory):
    """The one data/datapackmanager-<version> folder inside a template."""
    candidates = [p.name for p in (directory / "data").iterdir()
                  if p.is_dir() and re.match(r"^datapackmanager-[0-9.]+$", p.name)]
    if len(candidates) != 1:
        raise SystemExit("expected exactly one data/datapackmanager-<version> folder in %s, found %r"
                         % (directory, candidates))
    return candidates[0]


def derive(source, source_ns, target_ns, source_label, target_label):
    """Return {relative_target_path: bytes} for the derived generation."""
    out = {}
    label_pattern = re.compile(r"(?<![A-Za-z0-9.])%s(?![A-Za-z0-9.])" % re.escape(source_label))
    for path in sorted(source.rglob("*")):
        rel = path.relative_to(source)
        if any(part in SKIP_DIRS for part in rel.parts) or not path.is_file():
            continue
        parts = [target_ns if part == source_ns else part for part in rel.parts]
        target_rel = Path(*parts)
        data = path.read_bytes()
        if is_text(path):
            text = data.decode("utf-8")
            text = text.replace(source_ns, target_ns)
            text = label_pattern.sub(target_label, text)
            data = text.encode("utf-8")
        out[target_rel] = data
    return out


def main(argv):
    check = "--check" in argv
    args = [a for a in argv if a != "--check"]
    namespace = None
    label = None
    positional = []
    i = 0
    while i < len(args):
        if args[i] == "--namespace":
            namespace = args[i + 1]
            i += 2
        elif args[i] == "--label":
            label = args[i + 1]
            i += 2
        else:
            positional.append(args[i])
            i += 1
    if len(positional) != 2:
        print(__doc__)
        return 2
    repo_root = Path(__file__).resolve().parent.parent
    source = Path(positional[0]) if Path(positional[0]).is_absolute() else repo_root / positional[0]
    target = Path(positional[1]) if Path(positional[1]).is_absolute() else repo_root / positional[1]
    if not (source / "data").is_dir():
        raise SystemExit("source %s has no data/ directory" % source)

    source_label = label_of(source)
    target_label = label or label_of(target)
    source_ns = framework_namespace(source)
    target_ns = namespace or ("datapackmanager-" + target_label[2:])

    derived = derive(source, source_ns, target_ns, source_label, target_label)
    print("== %s -> %s: namespace %s -> %s, label %s -> %s, %d files"
          % (source.name, target.name, source_ns, target_ns, source_label, target_label, len(derived)))

    existing = {}
    if target.is_dir():
        for path in sorted(target.rglob("*")):
            rel = path.relative_to(target)
            if any(part in SKIP_DIRS for part in rel.parts) or not path.is_file():
                continue
            existing[rel] = path.read_bytes()

    missing = sorted(set(derived) - set(existing))
    extra = sorted(set(existing) - set(derived))
    changed = sorted(rel for rel in derived if rel in existing and existing[rel] != derived[rel])

    if check:
        for rel in missing:
            print("   MISSING  %s" % rel.as_posix())
        for rel in extra:
            print("   EXTRA    %s" % rel.as_posix())
        for rel in changed:
            print("   DIFFERS  %s" % rel.as_posix())
        drift = len(missing) + len(extra) + len(changed)
        print("   %d files match, %d drifted" % (len(derived) - len(missing) - len(changed), drift))
        return 1 if drift else 0

    for rel in missing + changed:
        dest = target / rel
        dest.parent.mkdir(parents=True, exist_ok=True)
        dest.write_bytes(derived[rel])
        print("   %s %s" % ("WROTE   " if rel in missing else "UPDATED ", rel.as_posix()))
    for rel in extra:
        (target / rel).unlink()
        print("   REMOVED  %s" % rel.as_posix())
    for directory in sorted((p for p in target.rglob("*") if p.is_dir()), reverse=True):
        if not any(directory.iterdir()):
            directory.rmdir()
    print("   %d written, %d updated, %d removed" % (len(missing), len(changed), len(extra)))
    return 0


if __name__ == "__main__":
    sys.exit(main(sys.argv[1:]))
