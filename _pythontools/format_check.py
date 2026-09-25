#!/usr/bin/env python3
"""Formatting checker for the source files in this workspace.

Keeps every code file in one predictable shape so that diffs show real changes
and nothing else. Checked, per file:
  - no UTF-8 byte order mark
  - no tab characters (in .mcfunction, .json, .mcmeta and .mpp-datapack files)
  - no trailing spaces or tabs at the end of a line
  - one line-ending style per file (all CRLF or all LF, never mixed)
  - exactly one line break at the end of the file
  - no run of two or more blank lines
  - every .json, .mcmeta and .mpp-datapack file parses as JSON and is laid
    out with two-space indentation

File types covered: .mcfunction, .json, .mcmeta, .mcmeta.disabled,
.mpp-datapack, .md, .py.

Usage:
  python format_check.py                       # the datapackmanager-* directories and _pythontools
  python format_check.py harvester-v3.03.02    # any directory or file, relative to the repo root
  python format_check.py --fix PATH ...        # rewrite offending files in place

--fix keeps whichever line-ending style the file already uses (CRLF wins when
a file is mixed), because git normalises endings on commit and the working
tree on Windows is checked out with CRLF.

Exit code is 1 when any finding remains, so it can gate a release.
Pure ASCII on purpose.
"""

import json
import os
import re
import sys
from pathlib import Path

TEXT_SUFFIXES = (".mcfunction", ".json", ".mcmeta", ".disabled", ".mpp-datapack", ".md", ".py")
JSON_SUFFIXES = (".json", ".mcmeta", ".disabled", ".mpp-datapack")
NO_TABS_SUFFIXES = (".mcfunction", ".json", ".mcmeta", ".disabled", ".mpp-datapack")
SKIP_DIRS = {".git", "__pycache__", "_archived", "_dist"}


def wanted(path):
    name = path.name
    if name == ".mpp-datapack":
        return True
    return name.endswith(TEXT_SUFFIXES)


def iter_files(target):
    if target.is_file():
        if wanted(target):
            yield target
        return
    for path in sorted(target.rglob("*")):
        if any(part in SKIP_DIRS for part in path.relative_to(target).parts):
            continue
        if path.is_file() and wanted(path):
            yield path


def suffix_of(path):
    name = path.name
    if name == ".mpp-datapack":
        return ".mpp-datapack"
    for suffix in TEXT_SUFFIXES:
        if name.endswith(suffix):
            return suffix
    return path.suffix


def normalise(raw, suffix):
    """Return (fixed_bytes, findings) for one file's raw bytes."""
    findings = []
    if raw.startswith(b"\xef\xbb\xbf"):
        findings.append("byte order mark")
        raw = raw[3:]
    crlf = raw.count(b"\r\n")
    lf = raw.count(b"\n") - crlf
    if crlf and lf:
        findings.append("mixed line endings (%d CRLF, %d LF)" % (crlf, lf))
    # A file with no line break yet takes the platform default, which is what git autocrlf
    # produces on checkout here, so a new one-line file matches its neighbours.
    ending = "\r\n" if crlf else ("\n" if lf else os.linesep)
    text = raw.decode("utf-8").replace("\r\n", "\n")

    if suffix in JSON_SUFFIXES:
        try:
            doc = json.loads(text)
        except ValueError as error:
            findings.append("JSON does not parse: %s" % error)
            return None, findings
        pretty = json.dumps(doc, indent=2, ensure_ascii=False) + "\n"
        if pretty != text:
            findings.append("JSON not in two-space layout")
        fixed = pretty
    else:
        lines = text.split("\n")
        if suffix in NO_TABS_SUFFIXES and any("\t" in line for line in lines):
            findings.append("tab characters")
            lines = [line.replace("\t", "    ") for line in lines]
        if any(re.search(r"[ \t]+$", line) for line in lines):
            findings.append("trailing whitespace")
            lines = [re.sub(r"[ \t]+$", "", line) for line in lines]
        fixed = "\n".join(lines)
        # PEP 8 separates top-level definitions with two blank lines, so .py files may keep two.
        allowed = 2 if suffix == ".py" else 1
        run = r"\n{%d,}" % (allowed + 2)
        if re.search(run, fixed):
            findings.append("run of blank lines")
            fixed = re.sub(run, "\n" * (allowed + 1), fixed)
        stripped = fixed.rstrip("\n")
        if fixed != stripped + "\n":
            findings.append("missing or repeated final line break")
        fixed = stripped + "\n"
        if fixed.startswith("\n"):
            findings.append("leading blank line")
            fixed = fixed.lstrip("\n")

    return fixed.replace("\n", ending).encode("utf-8"), findings


def default_targets(repo_root):
    targets = [p for p in sorted(repo_root.iterdir()) if p.is_dir() and p.name.startswith("datapackmanager-")]
    tools = repo_root / "_pythontools"
    if tools.is_dir():
        targets.append(tools)
    return targets


def main(argv):
    fix = "--fix" in argv
    args = [a for a in argv if a != "--fix"]
    repo_root = Path(__file__).resolve().parent.parent
    targets = [Path(a) if Path(a).is_absolute() else repo_root / a for a in args] or default_targets(repo_root)
    files = 0
    bad = 0
    for target in targets:
        if not target.exists():
            print("== %s: not found, skipped" % target)
            continue
        for path in iter_files(target):
            files += 1
            raw = path.read_bytes()
            fixed, findings = normalise(raw, suffix_of(path))
            if not findings:
                continue
            bad += 1
            rel = path.relative_to(repo_root).as_posix() if repo_root in path.parents else str(path)
            if fix and fixed is not None:
                path.write_bytes(fixed)
                print("FIXED   %s: %s" % (rel, "; ".join(findings)))
            else:
                print("FINDING %s: %s" % (rel, "; ".join(findings)))
    verb = "fixed" if fix else "with findings"
    print("== %d files checked, %d %s" % (files, bad, verb))
    return 0 if (bad == 0 or fix) else 1


if __name__ == "__main__":
    sys.exit(main(sys.argv[1:]))
