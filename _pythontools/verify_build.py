#!/usr/bin/env python3
"""Build verification for this workspace: every check a release has to pass, in one command.

Steps, in order (each runs even if an earlier one failed, so one run shows everything):
  1. format     format_check.py over the framework trees, _pythontools and the release packs
  2. refs       reference_check.py over the same packs and framework trees
  3. derive     derive_generation.py --check (datapackmanager-mc26.3 matches the template)
  4. load       load_test.py: build the release packs and load them on a real server for
                every installed Minecraft version in load_test.json, with state checks and
                smoke scenarios (only with --load, because it starts servers)

The release packs are the ones listed in load_test.json.

Usage:
  python verify_build.py                          # static checks only
  python verify_build.py --load --accept-eula     # static checks and the full load test
  python verify_build.py --load --accept-eula --quick
  python verify_build.py --load --accept-eula --versions 26.2,1.21.1

--accept-eula (or MINECRAFT_ACCEPT_EULA=1) accepts https://aka.ms/MinecraftEULA for the
test servers; load_test.py refuses to start a server without it.

Exit code is 1 when any step fails.
Pure ASCII on purpose.
"""

import json
import subprocess
import sys
import time
from pathlib import Path

TOOLS = Path(__file__).resolve().parent
REPO = TOOLS.parent
FRAMEWORK_TREES = ["datapackmanager-mc1.21", "datapackmanager-mc26.3", "datapackmanager-core"]


def release_packs():
    config = json.loads((TOOLS / "load_test.json").read_text(encoding="utf-8"))
    packs = []
    for pattern in config["packs"]:
        matches = sorted(p for p in REPO.glob(pattern) if p.is_dir() and (p / "data").is_dir())
        if matches:
            packs.append(matches[-1].name)
    return packs


def run(label, args):
    started = time.time()
    print("\n######## %s: %s" % (label, " ".join(args)), flush=True)
    code = subprocess.call([sys.executable] + args, cwd=REPO)
    return label, code, round(time.time() - started, 1)


def main(argv):
    load = "--load" in argv
    passthrough = [a for a in argv if a != "--load"]
    packs = release_packs()
    trees = [t for t in FRAMEWORK_TREES if (REPO / t).is_dir()]
    results = [
        run("format", [str(TOOLS / "format_check.py")] + trees + ["_pythontools"] + packs),
        run("refs", [str(TOOLS / "reference_check.py")] + trees + packs),
        run("derive", [str(TOOLS / "derive_generation.py"), "datapackmanager-mc1.21", "datapackmanager-mc26.3", "--check"]),
    ]
    if load:
        results.append(run("load", [str(TOOLS / "load_test.py")] + passthrough))
    print("\n######## summary")
    for label, code, seconds in results:
        print("   %-7s %s  (%ss)" % (label, "ok" if code == 0 else "FAILED (exit %d)" % code, seconds))
    if not load:
        print("   load    not run (add --load --accept-eula to start the test servers)")
    return 0 if all(code == 0 for _, code, _ in results) else 1


if __name__ == "__main__":
    sys.exit(main(sys.argv[1:]))
