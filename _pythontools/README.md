# Python tools
- Code by [touchportyl](https://github.com/touchportyl/)

Plain Python 3 scripts, no dependencies, pure ASCII. Run them from anywhere; paths are resolved against the repo root.

| Script | Purpose |
|---|---|
| `verify_build.py` | The build verification: runs the format, reference and derivation checks over the framework trees, `_pythontools` and the release packs, and with `--load --accept-eula` the load test below. Exits 1 if any step fails. Run it before every commit that touches a pack and before every export. |
| `load_test.py` | Builds the release packs the way the released zips are laid out and loads them on a headless dedicated server started from every client jar in `%APPDATA%/.minecraft/versions` that `load_test.json` lists (1.14.4 to 26.2 today), with the launcher's own Java runtimes; nothing is downloaded. Per version it checks every load error against the version windows in `load_test.json`, the detected Minecraft version against a golden value, the framework and pack state, and runs the smoke scenarios. `--list` shows what would run; `--quick` runs five boundary versions; `--versions` picks a subset; `--keep` keeps the server folders. Starting a server accepts the [Minecraft EULA](https://aka.ms/MinecraftEULA), so it needs `--accept-eula` or `MINECRAFT_ACCEPT_EULA=1`. Logs and per-version JSON reports go to `%TEMP%/datapacks-load-test/<timestamp>/logs`. |
| `load_test.json` | The load test's configuration: the release packs, the build layout, the versions with their golden `VERSION$minecraft.current` values, and the version window of every resource that is meant to load on some versions only. Update it when a pack gains a version-isolated file, when a pack folder is renamed, and when a new Minecraft version is installed. |
| `load_test_scenarios/` | Smoke scenarios, one text file per pack: `run`, `assert`, `refute` and `wait` steps, optionally limited to a version window with a `[A..B]` prefix. `assert` and `refute` send `execute <condition>` and read the console's verdict. |
| `reference_check.py` | Resolves every function reference in a pack (functions, function tags, advancement rewards) and exits 1 on any dead reference. `--orphans` also lists functions nothing references. Run it after any framework change, namespace rename, or re-vendoring. |
| `format_check.py` | Checks source files for one line-ending style, no trailing whitespace, exactly one final line break, no runs of blank lines, and two-space JSON layout. `--fix` rewrites in place. |
| `derive_generation.py` | Derives a renamed framework generation (`datapackmanager-mc26.3`) from the canonical template (`datapackmanager-mc1.21`), rewriting the namespace and label everywhere. `--check` reports drift and exits 1. |
| `generate_positions.py` | Generates `execute positioned` fan-out lines for a spherical shell around the player. |
| `datapack_manager_tool.py` | The legacy Tkinter GUI: Datapack Explorer, Tag Analyzer, Project Creator, Framework Updater, Logs, Settings. Its Framework Updater is still the only tool that re-vendors the framework into consumer packs. |

## Sunsetting notice
The Datapack Manager Tool is being sunset and replaced by MCFunction++.
> Learn more about MCFunction++ [here](https://github.com/Portyl-Studios/MCFunctionPlusPlus).
