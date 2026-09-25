# Python tools
- Code by [touchportyl](https://github.com/touchportyl/)

Plain Python 3 scripts, no dependencies, pure ASCII. Run them from anywhere; paths are resolved against the repo root.

| Script | Purpose |
|---|---|
| `reference_check.py` | Resolves every function reference in a pack (functions, function tags, advancement rewards) and exits 1 on any dead reference. `--orphans` also lists functions nothing references. Run it after any framework change, namespace rename, or re-vendoring. |
| `format_check.py` | Checks source files for one line-ending style, no trailing whitespace, exactly one final line break, no runs of blank lines, and two-space JSON layout. `--fix` rewrites in place. |
| `derive_generation.py` | Derives a renamed framework generation (`datapackmanager-mc26.3`) from the canonical template (`datapackmanager-mc1.21`), rewriting the namespace and label everywhere. `--check` reports drift and exits 1. |
| `generate_positions.py` | Generates `execute positioned` fan-out lines for a spherical shell around the player. |
| `datapack_manager_tool.py` | The legacy Tkinter GUI: Datapack Explorer, Tag Analyzer, Project Creator, Framework Updater, Logs, Settings. Its Framework Updater is still the only tool that re-vendors the framework into consumer packs. |

## Sunsetting notice
The Datapack Manager Tool is being sunset and replaced by MCFunction++.
> Learn more about MCFunction++ [here](https://github.com/Portyl-Studios/MCFunctionPlusPlus).
