#!/usr/bin/env python3
"""Build and load-test datapacks on real Minecraft servers, one per installed version.

The static checkers (reference_check.py, format_check.py) cannot tell whether
Minecraft accepts a file. This script can: it builds each pack the way a
release zip is built, starts a headless dedicated server from every locally
installed client jar, and checks what the game actually loaded.

Per Minecraft version it:
  1. builds the packs into a fresh world: data/ copied, pack.mcmeta written
     from pack.mcmeta.disabled, and with --layout dual (the default) a plural
     copy of every renamed folder (functions/, advancements/, ...) next to the
     singular one, which is what the released zips carry so that one zip loads
     on 1.14 to 1.20 and on 1.21+
  2. starts `net.minecraft.server.Main` (or MinecraftServer on 1.14/1.15) from
     the client jar with the Java runtime the launcher installed for it,
     bound to 127.0.0.1 in offline mode, flat world, nothing downloaded
  3. reads every load error the server logs and attributes it to a pack
     resource; each failure must be allowed by the version windows in
     load_test.json, and anything unattributable fails the run
  4. waits for DatapackManager to initialise, then checks the framework state:
     the detected VERSION$minecraft.current against the golden value in
     load_test.json, FLAG$isActive, COUNT$datapacks, and every pack's
     FLAG$isActive and VERSION$datapack.latest
  5. runs the smoke scenarios in load_test_scenarios/ (plain command scripts
     with assertions) and stops the server

Running a server requires accepting the Minecraft EULA
(https://aka.ms/MinecraftEULA). The script writes eula=true only when told to:
pass --accept-eula or set MINECRAFT_ACCEPT_EULA=1.

Usage:
  python load_test.py --list                         # versions, jars and runtimes found; runs nothing
  python load_test.py --accept-eula                  # every version in load_test.json
  python load_test.py --accept-eula --versions 26.2,1.21.1
  python load_test.py --accept-eula --keep           # keep the server folders
  python load_test.py --accept-eula --no-scenarios   # load and state checks only

Environment:
  MINECRAFT_DIR          the .minecraft folder (default %APPDATA%/.minecraft)
  MINECRAFT_RUNTIME_DIR  an extra folder holding launcher Java runtimes
  LOAD_TEST_DIR          where server folders and logs go (default %TEMP%/datapacks-load-test)

Exit code is 1 when anything fails, so it can gate a release.
Pure ASCII on purpose.
"""

import fnmatch
import json
import os
import queue
import re
import shutil
import socket
import subprocess
import sys
import threading
import time
from pathlib import Path

REPO = Path(__file__).resolve().parent.parent
CONFIG = Path(__file__).resolve().parent / "load_test.json"
SCENARIOS = Path(__file__).resolve().parent / "load_test_scenarios"

# data folders renamed in 1.21 (24w21a); the plural copy is what 1.14 to 1.20 read
PLURAL_FOLDERS = {
    "function": "functions",
    "advancement": "advancements",
    "predicate": "predicates",
    "item_modifier": "item_modifiers",
    "loot_table": "loot_tables",
    "recipe": "recipes",
    "structure": "structures",
}
PLURAL_TAG_FOLDERS = {
    "function": "functions",
    "block": "blocks",
    "item": "items",
    "entity_type": "entity_types",
    "fluid": "fluids",
    "game_event": "game_events",
}
JSON_KINDS = ("advancement", "predicate", "item_modifier", "loot_table", "recipe")

STARTUP_TIMEOUT = 300
INIT_TIMEOUT = 30
REPLY_TIMEOUT = 10
STOP_TIMEOUT = 90


# ---------------------------------------------------------------- versions

def encode(version):
    """DatapackManager encoding: 1.21.4 -> 12104, 26.3 -> 12603 (1.<year>.<drop>), hotfixes dropped for year.drop."""
    parts = [int(p) for p in version.split(".")]
    if parts[0] >= 26:
        return 10000 + parts[0] * 100 + (parts[1] if len(parts) > 1 else 0)
    while len(parts) < 3:
        parts.append(0)
    return parts[0] * 10000 + parts[1] * 100 + parts[2]


VERSION_TEXT = re.compile(r"^\d+\.\d+(\.\d+)?$")


def in_range(value, spec, name_version):
    """spec is 'A..B', 'A..', '..B', 'A', 'always' or 'never'; {name} is replaced by the version in the resource name."""
    if spec == "always":
        return True
    if spec == "never":
        return False
    if "{name}" in spec:
        if name_version is None:
            raise ValueError("range %r uses {name} but the resource name carries no version" % spec)
        spec = spec.replace("{name}", name_version)
    if ".." in spec:
        low, high = spec.split("..", 1)
    else:
        low = high = spec
    if low and value < encode(low):
        return False
    if high and value > encode(high):
        return False
    return True


def version_in_name(resource_path):
    """The version a resource is named after: a path segment like 1.21.4 or 26.3, or a -X.Y suffix."""
    segments = resource_path.split("/")
    last = segments[-1]
    if VERSION_TEXT.match(last):
        return last
    m = re.search(r"-(\d+\.\d+(?:\.\d+)?)$", last)
    if m:
        return m.group(1)
    for segment in segments[:-1]:
        if VERSION_TEXT.match(segment):
            return segment
    return None


# ---------------------------------------------------------------- environment

def minecraft_dir():
    return Path(os.environ.get("MINECRAFT_DIR") or Path(os.environ.get("APPDATA", Path.home())) / ".minecraft")


def runtime_roots():
    roots = []
    if os.environ.get("MINECRAFT_RUNTIME_DIR"):
        roots.append(Path(os.environ["MINECRAFT_RUNTIME_DIR"]))
    local = os.environ.get("LOCALAPPDATA")
    if local:
        roots.append(Path(local) / "Packages" / "Microsoft.4297127D64EC6_8wekyb3d8bbwe" / "LocalCache" / "Local" / "runtime")
    roots.append(minecraft_dir() / "runtime")
    for pf in (os.environ.get("ProgramFiles(x86)"), os.environ.get("ProgramFiles")):
        if pf:
            roots.append(Path(pf) / "Minecraft Launcher" / "runtime")
    return [r for r in roots if r.is_dir()]


def installed_runtimes():
    """{component: (java path, major version)} for every launcher runtime found."""
    found = {}
    exe = "java.exe" if os.name == "nt" else "java"
    for root in runtime_roots():
        for component in sorted(p.name for p in root.iterdir() if p.is_dir()):
            if component in found:
                continue
            for java in root.joinpath(component).rglob(exe):
                if java.parent.name != "bin":
                    continue
                home = java.parent.parent
                major = None
                release = home / "release"
                if release.is_file():
                    m = re.search(r'JAVA_VERSION="(\d+)(?:\.(\d+))?', release.read_text(errors="replace"))
                    if m:
                        major = int(m.group(2)) if m.group(1) == "1" else int(m.group(1))
                found[component] = (java, major)
                break
    return found


def pick_java(component, required_major, runtimes):
    if component in runtimes:
        return runtimes[component]
    # a missing component (java-runtime-beta for 1.18) falls back to the lowest installed runtime that is new enough;
    # only for Java 17+, because Java 8 era servers do not run on 17+
    if required_major and required_major >= 17:
        candidates = sorted((major, str(path)) for path, major in runtimes.values() if major and major >= required_major)
        if candidates:
            major, path = candidates[0]
            return Path(path), major
    return None


def library_allowed(lib):
    allowed = True
    rules = lib.get("rules")
    if rules:
        allowed = False
        current = "windows" if os.name == "nt" else ("osx" if sys.platform == "darwin" else "linux")
        for rule in rules:
            name = rule.get("os", {}).get("name")
            if name is None or name == current:
                allowed = rule.get("action") == "allow"
    return allowed


def resolve_version(version, runtimes):
    """Return a dict describing how to run this version, or {'error': ...}."""
    mc = minecraft_dir()
    folder = mc / "versions" / version
    jar = folder / (version + ".jar")
    manifest = folder / (version + ".json")
    if not jar.is_file() or not manifest.is_file():
        return {"error": "no client jar at %s" % jar}
    info = json.loads(manifest.read_text(encoding="utf-8"))
    if info.get("inheritsFrom"):
        return {"error": "modded profile (inheritsFrom %s)" % info["inheritsFrom"]}
    classpath = [str(jar)]
    missing = []
    for lib in info.get("libraries", []):
        artifact = lib.get("downloads", {}).get("artifact")
        if not artifact or not library_allowed(lib) or ":natives-" in lib.get("name", ""):
            continue
        path = mc / "libraries" / artifact["path"]
        if path.is_file():
            classpath.append(str(path))
        else:
            missing.append(artifact["path"])
    java_info = info.get("javaVersion", {})
    picked = pick_java(java_info.get("component"), java_info.get("majorVersion"), runtimes)
    if picked is None:
        return {"error": "no Java runtime for component %s (Java %s)" % (java_info.get("component"), java_info.get("majorVersion"))}
    import zipfile
    with zipfile.ZipFile(jar) as z:
        names = set(z.namelist())
    main = "net.minecraft.server.Main" if "net/minecraft/server/Main.class" in names else "net.minecraft.server.MinecraftServer"
    return {
        "jar": jar,
        "classpath": os.pathsep.join(classpath),
        "missing": missing,
        "java": picked[0],
        "java_major": picked[1],
        "component": java_info.get("component"),
        "main": main,
    }


# ---------------------------------------------------------------- packs

def resolve_pack(pattern):
    matches = sorted(p for p in REPO.glob(pattern) if p.is_dir() and (p / "data").is_dir())
    if not matches:
        raise SystemExit("no pack directory matches %r" % pattern)
    return matches[-1]


def pack_facts(pack):
    """Holder objective and current version from the pack's preinstaller, if it uses DatapackManager."""
    for check in pack.glob("data/*/function/packages/preinstaller/check.mcfunction"):
        text = check.read_text(encoding="utf-8")
        objective = re.search(r"^scoreboard objectives add (\S+) dummy", text, re.M)
        current = re.search(r"^scoreboard players set VERSION\$datapack\.current (\S+) (\d+)", text, re.M)
        if objective and current:
            return {"namespace": check.parts[-5], "objective": objective.group(1), "current": int(current.group(2))}
    return None


def resources(pack):
    """Every loadable resource of a pack as 'kind ns:path'."""
    found = set()
    data = pack / "data"
    for path in data.rglob("*"):
        if not path.is_file():
            continue
        rel = path.relative_to(data).parts
        if len(rel) < 3:
            continue
        ns, kind = rel[0], rel[1]
        if kind == "function" and path.suffix == ".mcfunction":
            found.add("function %s:%s" % (ns, "/".join(rel[2:])[: -len(".mcfunction")]))
        elif kind in JSON_KINDS and path.suffix == ".json":
            found.add("%s %s:%s" % (kind, ns, "/".join(rel[2:])[: -len(".json")]))
        elif kind == "tags" and len(rel) >= 4 and path.suffix == ".json":
            found.add("tag/%s %s:%s" % (rel[2], ns, "/".join(rel[3:])[: -len(".json")]))
    return found


def build_pack(pack, destination, layout):
    shutil.copytree(pack / "data", destination / "data")
    shutil.copyfile(pack / "pack.mcmeta.disabled", destination / "pack.mcmeta")
    if layout == "dual":
        for ns in (destination / "data").iterdir():
            for singular, plural in PLURAL_FOLDERS.items():
                if (ns / singular).is_dir():
                    shutil.copytree(ns / singular, ns / plural)
            for singular, plural in PLURAL_TAG_FOLDERS.items():
                if (ns / "tags" / singular).is_dir():
                    shutil.copytree(ns / "tags" / singular, ns / "tags" / plural)


# ---------------------------------------------------------------- server

class Server:
    def __init__(self, spec, folder, log_path):
        self.spec = spec
        self.folder = folder
        self.log_path = log_path
        self.lines = []
        self.queue = queue.Queue()
        self.proc = None

    def start(self):
        cmd = [str(self.spec["java"]), "-Xms512M", "-Xmx2G", "-Dlog4j2.formatMsgNoLookups=true",
               "-cp", self.spec["classpath"], self.spec["main"], "--nogui"]
        self.proc = subprocess.Popen(cmd, cwd=self.folder, stdin=subprocess.PIPE, stdout=subprocess.PIPE,
                                     stderr=subprocess.STDOUT, text=True, encoding="utf-8", errors="replace")
        self.job = kill_with_parent(self.proc)
        threading.Thread(target=self._read, daemon=True).start()

    def _read(self):
        for line in self.proc.stdout:
            line = line.rstrip("\r\n")
            self.lines.append(line)
            self.queue.put(line)
        self.queue.put(None)

    def wait_for(self, predicate, timeout):
        """Return the first new line satisfying predicate, or None on timeout or exit."""
        end = time.time() + timeout
        while time.time() < end:
            try:
                line = self.queue.get(timeout=0.25)
            except queue.Empty:
                continue
            if line is None:
                return None
            if predicate(line):
                return line
        return None

    def drain(self, seconds):
        """Collect lines for a while."""
        got = []
        end = time.time() + seconds
        while time.time() < end:
            try:
                line = self.queue.get(timeout=0.05)
            except queue.Empty:
                continue
            if line is None:
                break
            got.append(line)
        return got

    def send(self, command):
        self.proc.stdin.write(command + "\n")
        self.proc.stdin.flush()

    def command(self, command, accept, timeout=REPLY_TIMEOUT):
        """Send a console command and return the first server-thread reply that accept() takes."""
        self.drain(0.05)
        self.send(command)
        return self.wait_for(lambda l: "Server thread" in l and accept(l), timeout)

    def stop(self):
        if self.proc is None:
            return
        try:
            if self.proc.poll() is None:
                self.send("stop")
                self.proc.wait(timeout=STOP_TIMEOUT)
        except Exception:
            pass
        finally:
            if self.proc.poll() is None:
                self.proc.kill()
                self.proc.wait(timeout=30)
            self.log_path.write_text("\n".join(self.lines) + "\n", encoding="utf-8")


def kill_with_parent(proc):
    """On Windows, put the server in a job object that the OS kills when this script's handle closes,
    so a killed or crashed test run cannot leave a Java server running. Returns the handle to keep alive."""
    if os.name != "nt":
        return None
    try:
        import ctypes
        from ctypes import wintypes

        class BasicLimits(ctypes.Structure):
            _fields_ = [("PerProcessUserTimeLimit", ctypes.c_int64), ("PerJobUserTimeLimit", ctypes.c_int64),
                        ("LimitFlags", wintypes.DWORD), ("MinimumWorkingSetSize", ctypes.c_size_t),
                        ("MaximumWorkingSetSize", ctypes.c_size_t), ("ActiveProcessLimit", wintypes.DWORD),
                        ("Affinity", ctypes.c_size_t), ("PriorityClass", wintypes.DWORD), ("SchedulingClass", wintypes.DWORD)]

        class IoCounters(ctypes.Structure):
            _fields_ = [(name, ctypes.c_ulonglong) for name in ("ReadOperationCount", "WriteOperationCount", "OtherOperationCount",
                                                                "ReadTransferCount", "WriteTransferCount", "OtherTransferCount")]

        class ExtendedLimits(ctypes.Structure):
            _fields_ = [("BasicLimitInformation", BasicLimits), ("IoInfo", IoCounters), ("ProcessMemoryLimit", ctypes.c_size_t),
                        ("JobMemoryLimit", ctypes.c_size_t), ("PeakProcessMemoryUsed", ctypes.c_size_t), ("PeakJobMemoryUsed", ctypes.c_size_t)]

        kernel32 = ctypes.WinDLL("kernel32", use_last_error=True)
        kernel32.CreateJobObjectW.restype = wintypes.HANDLE
        kernel32.CreateJobObjectW.argtypes = [ctypes.c_void_p, wintypes.LPCWSTR]
        kernel32.SetInformationJobObject.argtypes = [wintypes.HANDLE, ctypes.c_int, ctypes.c_void_p, wintypes.DWORD]
        kernel32.AssignProcessToJobObject.argtypes = [wintypes.HANDLE, wintypes.HANDLE]
        job = kernel32.CreateJobObjectW(None, None)
        limits = ExtendedLimits()
        limits.BasicLimitInformation.LimitFlags = 0x2000  # JOB_OBJECT_LIMIT_KILL_ON_JOB_CLOSE
        if not job or not kernel32.SetInformationJobObject(job, 9, ctypes.byref(limits), ctypes.sizeof(limits)):
            return None
        if not kernel32.AssignProcessToJobObject(job, wintypes.HANDLE(int(proc._handle))):
            return None
        return job
    except Exception:
        return None


def free_port():
    with socket.socket() as s:
        s.bind(("127.0.0.1", 0))
        return s.getsockname()[1]


def write_server_files(folder):
    (folder / "eula.txt").write_text("# accepted through load_test.py --accept-eula\neula=true\n", encoding="ascii")
    properties = {
        "level-name": "world",
        "level-type": "flat",
        "generate-structures": "false",
        "online-mode": "false",
        "server-ip": "127.0.0.1",
        "server-port": str(free_port()),
        "enable-query": "false",
        "enable-rcon": "false",
        "enable-status": "false",
        "difficulty": "peaceful",
        "spawn-monsters": "false",
        "spawn-animals": "false",
        "spawn-npcs": "false",
        "spawn-protection": "0",
        "max-players": "1",
        "view-distance": "3",
        "simulation-distance": "3",
        "sync-chunk-writes": "false",
        "pause-when-empty-seconds": "3600",
    }
    (folder / "server.properties").write_text("".join("%s=%s\n" % kv for kv in properties.items()), encoding="ascii")


# ---------------------------------------------------------------- log analysis

RID = r"([a-z0-9_.\-]+:[a-z0-9_./\-]+)"
PLURAL_KIND = {"predicates": "predicate", "item_modifiers": "item_modifier", "loot_tables": "loot_table",
               "advancements": "advancement", "recipes": "recipe", "functions": "function"}


def kind_of(name):
    return PLURAL_KIND.get(name, name)


# Each pattern yields one list of candidate resources per failure; the first candidate present in the build wins.
LOAD_ERROR_PATTERNS = [
    # function files, 1.16 and later
    (re.compile(r"Failed to load function " + RID), lambda m: [["function " + m.group(1)]]),
    # function files, 1.14 and 1.15: Couldn't load function at ns:functions/path.mcfunction
    (re.compile(r"Couldn't load function at ([a-z0-9_.\-]+):functions?/([a-z0-9_./\-]+)\.mcfunction"),
     lambda m: [["function %s:%s" % (m.group(1), m.group(2))]]),
    # JSON registries, 26.x: Couldn't parse data file 'ns:path' from 'ns:kind/path.json'
    (re.compile(r"Couldn't parse data file '" + RID + r"' from '[a-z0-9_.\-]+:([a-z_]+)/"),
     lambda m: [["%s %s" % (kind_of(m.group(2)), m.group(1))]]),
    # JSON registries, 1.20.2 to 1.21.x: Couldn't parse element predicates:ns:path or minecraft:predicate/ns:path
    (re.compile(r"Couldn't parse element (?:minecraft:)?([a-z_]+)[:/]" + RID),
     lambda m: [["%s %s" % (kind_of(m.group(1)), m.group(2))]]),
    # 1.16 to 1.20.1 log predicates with the loot table message
    (re.compile(r"Couldn't parse loot table " + RID), lambda m: [["loot_table " + m.group(1), "predicate " + m.group(1)]]),
    (re.compile(r"Couldn't parse item modifier " + RID), lambda m: [["item_modifier " + m.group(1)]]),
    # advancements, 1.20.2 and later: Couldn't load advancements: [a, b]
    (re.compile(r"Couldn't load advancements: \[([^\]]*)\]"),
     lambda m: [["advancement " + a.strip()] for a in m.group(1).split(",") if a.strip()]),
    # advancements, older versions
    (re.compile(r"Couldn't load advancement " + RID), lambda m: [["advancement " + m.group(1)]]),
    (re.compile(r"Parsing error loading custom advancement " + RID), lambda m: [["advancement " + m.group(1)]]),
]


def analyse_load(lines, namespaces, all_resources):
    """Return (failed resources {id: first message}, unattributed error lines) for everything logged before 'Done'."""
    failed = {}
    unattributed = []
    ns_pattern = re.compile(r"(?<![\w\-])(%s):" % "|".join(re.escape(n) for n in sorted(namespaces)))
    for i, line in enumerate(lines):
        if "Done (" in line:
            break
        if "/ERROR]" not in line and "/WARN]" not in line:
            continue
        hit = False
        for pattern, extract in LOAD_ERROR_PATTERNS:
            m = pattern.search(line)
            if not m:
                continue
            hit = True
            for candidates in extract(m):
                rid = next((c for c in candidates if c in all_resources), candidates[0])
                if not ns_pattern.search(rid):
                    continue
                detail = line.split("]: ", 1)[-1]
                for follow in lines[i + 1: i + 12]:
                    if "Whilst parsing" in follow:
                        detail = follow.strip()
                        break
                failed.setdefault(rid, detail[:300])
            break
        if not hit and ns_pattern.search(line):
            unattributed.append(line)
    return failed, unattributed


# ---------------------------------------------------------------- expectations

class Expectations:
    def __init__(self, rules):
        self.rules = rules

    def window(self, resource):
        """(range spec, rule) for a resource; the default window is 'always'."""
        for rule in self.rules:
            if fnmatch.fnmatchcase(resource, rule["match"]):
                spec = rule["loads"]
                if "{name}" in spec and version_in_name(resource.split(":", 1)[1]) is None:
                    continue
                return spec, rule
        return "always", None

    def check(self, value, all_resources, failed):
        """Return a list of problems for one version."""
        problems = []
        for resource in sorted(all_resources):
            spec, rule = self.window(resource)
            expected = in_range(value, spec, version_in_name(resource.split(":", 1)[1]))
            if resource in failed and expected:
                problems.append("expected to load, failed: %s (%s)" % (resource, failed[resource]))
            elif resource not in failed and not expected and rule and rule.get("must_fail_outside"):
                problems.append("expected to fail to load here, loaded: %s" % resource)
        for resource in sorted(set(failed) - set(all_resources)):
            problems.append("failure for a resource that is not in the build: %s" % resource)
        return problems

    def unused(self, all_resources):
        return [r["match"] for r in self.rules if not any(fnmatch.fnmatchcase(x, r["match"]) for x in all_resources)]


# ---------------------------------------------------------------- scenarios

LINE_RANGE = re.compile(r"^\[([^\]]*)\]\s*(.*)$")


def load_scenarios(active_namespaces):
    scenarios = []
    if not SCENARIOS.is_dir():
        return scenarios
    for path in sorted(SCENARIOS.glob("*.txt")):
        header = {"packs": [], "versions": "always"}
        steps = []
        for number, raw in enumerate(path.read_text(encoding="utf-8").splitlines(), 1):
            line = raw.strip()
            if not line or line.startswith("#"):
                continue
            if line.startswith("@packs "):
                header["packs"] = line.split()[1:]
                continue
            if line.startswith("@versions "):
                header["versions"] = line.split(None, 1)[1].strip()
                continue
            spec = "always"
            m = LINE_RANGE.match(line)
            if m:
                spec, line = m.group(1).strip(), m.group(2)
            verb, _, rest = line.partition(" ")
            if verb not in ("run", "assert", "refute", "wait"):
                raise SystemExit("%s:%d: unknown step %r" % (path.name, number, verb))
            steps.append((number, spec, verb, rest.strip()))
        if all(p in active_namespaces for p in header["packs"]):
            scenarios.append((path.name, header, steps))
    return scenarios


def run_scenario(server, value, name, steps):
    problems = []
    for number, spec, verb, arg in steps:
        if not in_range(value, spec, None):
            continue
        where = "%s:%d" % (name, number)
        if verb == "wait":
            m = re.match(r"^(\d+(?:\.\d+)?)s$", arg)
            if not m:
                problems.append("%s: wait takes seconds, like 1.5s" % where)
                continue
            server.drain(float(m.group(1)))
        elif verb == "run":
            server.drain(0.05)
            server.send(arg)
            replies = server.drain(0.3)
            bad = [l for l in replies if "<--[HERE]" in l or "Unknown or incomplete command" in l or "Incorrect argument" in l]
            if bad:
                problems.append("%s: command rejected: %s | %s" % (where, arg, bad[0].split("]: ", 1)[-1]))
        else:
            reply = server.command("execute " + arg, lambda l: "Test passed" in l or "Test failed" in l or "<--[HERE]" in l)
            passed = reply is not None and "Test passed" in reply
            if reply is None or "<--[HERE]" in reply:
                problems.append("%s: no verdict for: execute %s | %s" % (where, arg, reply and reply.split("]: ", 1)[-1]))
            elif passed != (verb == "assert"):
                problems.append("%s: %s failed: execute %s" % (where, verb, arg))
    return problems


# ---------------------------------------------------------------- one version

def score_reply(server, holder, objective):
    reply = server.command("scoreboard players get %s %s" % (holder, objective),
                           lambda l: holder in l or "Unknown scoreboard objective" in l or "No score" in l or "none is set" in l)
    if reply is None:
        return None
    m = re.search(re.escape(holder) + r" has (-?\d+) ", reply)
    return int(m.group(1)) if m else None


def test_version(version, spec, packs, facts, expectations, all_resources, namespaces, golden, args, root):
    report = {"version": version, "problems": [], "notes": []}
    value = encode(version)
    folder = root / version
    log_path = root / "logs" / ("%s.log" % version)
    if folder.exists():
        shutil.rmtree(folder)
    datapacks = folder / "world" / "datapacks"
    datapacks.mkdir(parents=True)
    for pack in packs:
        build_pack(pack, datapacks / pack.name, args.layout)
    write_server_files(folder)

    server = Server(spec, folder, log_path)
    started = time.time()
    try:
        server.start()
        done = server.wait_for(lambda l: "Done (" in l, STARTUP_TIMEOUT)
        if done is None:
            report["problems"].append("server did not finish starting (see %s)" % log_path)
            return report
        report["startup_seconds"] = round(time.time() - started, 1)

        failed, unattributed = analyse_load(server.lines, namespaces, all_resources)
        report["failed_resources"] = sorted(failed)
        report["problems"] += expectations.check(value, all_resources, failed)
        report["problems"] += ["unattributed load error: " + l for l in unattributed]

        # packs enabled
        reply = server.command("datapack list enabled", lambda l: "enabled" in l)
        for pack in packs:
            if reply is None or ("file/" + pack.name) not in reply:
                report["problems"].append("pack not enabled: %s" % pack.name)

        # framework state
        framework_packs = [f for f in facts.values() if f]
        if framework_packs:
            deadline = time.time() + INIT_TIMEOUT
            active = None
            while time.time() < deadline:
                active = score_reply(server, "FLAG$isActive", "DatapackManager")
                if active == 1 and all(score_reply(server, "FLAG$isActive", f["objective"]) is not None for f in framework_packs):
                    break
                server.drain(1.0)
            current = score_reply(server, "VERSION$minecraft.current", "DatapackManager")
            report["minecraft_current"] = current
            want = golden.get(version)
            if want is None:
                report["notes"].append("no golden value for %s; detected %s" % (version, current))
            elif current != want:
                report["problems"].append("VERSION$minecraft.current is %s, golden value %s" % (current, want))
            if current is not None:
                major, minor, patch = current // 10000, current // 100 % 100, current % 100
                for holder, expect in (("major", major), ("minor", minor), ("patch", patch)):
                    got = score_reply(server, "VERSION$minecraft.current." + holder, "DatapackManager")
                    if got != expect:
                        report["problems"].append("VERSION$minecraft.current.%s is %s, expected %s" % (holder, got, expect))
            if active != 1:
                report["problems"].append("DatapackManager FLAG$isActive is %s, expected 1" % active)
            count = score_reply(server, "COUNT$datapacks", "DatapackManager")
            if count != len(framework_packs):
                report["problems"].append("COUNT$datapacks is %s, expected %d" % (count, len(framework_packs)))
            for f in framework_packs:
                got = score_reply(server, "FLAG$isActive", f["objective"])
                if got != 1:
                    report["problems"].append("%s FLAG$isActive is %s, expected 1" % (f["objective"], got))
                latest = score_reply(server, "VERSION$datapack.latest", f["objective"])
                if latest != f["current"]:
                    report["problems"].append("%s VERSION$datapack.latest is %s, expected %d" % (f["objective"], latest, f["current"]))

        # smoke scenarios
        if not args.no_scenarios:
            for name, header, steps in load_scenarios(namespaces):
                if not in_range(value, header["versions"], None):
                    continue
                problems = run_scenario(server, value, name, steps)
                report["problems"] += problems
                report.setdefault("scenarios", []).append("%s: %s" % (name, "ok" if not problems else "%d problem(s)" % len(problems)))

        if server.proc.poll() is not None:
            report["problems"].append("server exited early with code %s" % server.proc.returncode)
        return report
    finally:
        server.stop()
        if not args.keep:
            shutil.rmtree(folder, ignore_errors=True)


# ---------------------------------------------------------------- main

def parse_args(argv):
    import argparse
    parser = argparse.ArgumentParser(description=__doc__.split("\n\n")[0])
    parser.add_argument("--accept-eula", action="store_true", help="accept the Minecraft EULA for the test servers")
    parser.add_argument("--versions", help="comma-separated subset of the versions in load_test.json")
    parser.add_argument("--quick", action="store_true", help="only the 'quick' versions from load_test.json")
    parser.add_argument("--layout", choices=("dual", "singular"), help="override the build layout from load_test.json")
    parser.add_argument("--keep", action="store_true", help="keep each server folder after its run")
    parser.add_argument("--no-scenarios", action="store_true", help="skip the smoke scenarios")
    parser.add_argument("--list", action="store_true", help="show what would run and exit")
    return parser.parse_args(argv)


def main(argv):
    args = parse_args(argv)
    config = json.loads(CONFIG.read_text(encoding="utf-8"))
    args.layout = args.layout or config.get("layout", "dual")
    packs = [resolve_pack(p) for p in config["packs"]]
    facts = {p.name: pack_facts(p) for p in packs}
    all_resources = set()
    for pack in packs:
        all_resources |= resources(pack)
    namespaces = {r.split(" ", 1)[1].split(":", 1)[0] for r in all_resources}
    expectations = Expectations(config.get("resources", []))
    golden = {v: c["minecraft_current"] for v, c in config["versions"].items()}

    versions = list(config["versions"])
    if args.versions or args.quick:
        wanted = [v.strip() for v in args.versions.split(",") if v.strip()] if args.versions else config.get("quick", [])
        unknown = [v for v in wanted if v not in config["versions"]]
        if unknown:
            raise SystemExit("not in load_test.json: %s" % ", ".join(unknown))
        versions = wanted

    runtimes = installed_runtimes()
    specs = {v: resolve_version(v, runtimes) for v in versions}
    print("== packs: %s (layout %s)" % (", ".join(p.name for p in packs), args.layout))
    for v in versions:
        s = specs[v]
        if "error" in s:
            print("   %-9s SKIP %s" % (v, s["error"]))
        else:
            extra = " (fallback for %s)" % s["component"] if s["component"] not in runtimes else ""
            print("   %-9s Java %s%s, %s, %d libraries missing" % (v, s["java_major"], extra, s["main"].rsplit(".", 1)[1], len(s["missing"])))
    for match in expectations.unused(all_resources):
        print("   WARNING: expectation matches no resource: %s" % match)
    if args.list:
        return 0
    if not (args.accept_eula or os.environ.get("MINECRAFT_ACCEPT_EULA") == "1"):
        print("Refusing to start servers: pass --accept-eula or set MINECRAFT_ACCEPT_EULA=1 to accept https://aka.ms/MinecraftEULA")
        return 2

    root = Path(os.environ.get("LOAD_TEST_DIR") or Path(os.environ.get("TEMP", "/tmp")) / "datapacks-load-test")
    root = root / time.strftime("%Y%m%d-%H%M%S")
    (root / "logs").mkdir(parents=True)
    print("== server folders and logs: %s" % root)

    failures = 0
    skipped = 0
    for v in versions:
        s = specs[v]
        if "error" in s:
            skipped += 1
            continue
        report = test_version(v, s, packs, facts, expectations, all_resources, namespaces, golden, args, root)
        status = "FAIL" if report["problems"] else "ok"
        detail = "detected %s" % report.get("minecraft_current")
        if "startup_seconds" in report:
            detail += ", started in %ss" % report["startup_seconds"]
        detail += ", %d resources failed to load as expected" % len(report.get("failed_resources", []))
        print("== %-9s %s  %s" % (v, status, detail))
        for note in report["notes"]:
            print("   note: %s" % note)
        for scenario in report.get("scenarios", []):
            print("   scenario %s" % scenario)
        for problem in report["problems"]:
            print("   PROBLEM %s" % problem)
        if report["problems"]:
            failures += 1
        (root / "logs" / ("%s.json" % v)).write_text(json.dumps(report, indent=2) + "\n", encoding="utf-8")
    print("== %d versions tested, %d failed, %d skipped" % (len(versions) - skipped, failures, skipped))
    return 1 if failures else 0


if __name__ == "__main__":
    sys.exit(main(sys.argv[1:]))
