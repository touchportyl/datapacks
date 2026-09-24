# Maintenance Log

Running log for DatapackManager and the packs that depend on it. Newest entry first. Each entry records the git state, what changed, what was verified, and what is still open, so any maintainer can pick up from the last entry without re-deriving the state of the repo.

Companion documents, all at the repo root:

- `MAINTAINER_GUIDE.md`: architecture, conventions, cross-version system, per-pack deep dives, and the update playbook. Read this first.
- `FRAMEWORK_ASSESSMENT.md`: scored critique of the shipped framework, including its dead code.
- `ROADMAP_DATAPACKMANAGER_26X.md`: plan for the next framework generation.
- `datapackmanager-core/README.md` and `datapackmanager-core/LIMITATIONS.md`: the rebuilt generation and every Minecraft version boundary it respects.

Tools:

- `_pythontools/reference_check.py`: resolves every function reference in a pack and exits 1 on any dead reference. Run it after any framework change, namespace rename, or re-vendoring.
- `_pythontools/datapack_manager_tool.py`: the legacy Tkinter tool, being sunset. Its Framework Updater is still the only thing that re-vendors the framework into consumers.

---

## 2026-09-25: handover baseline

The maintainer takes over DatapackManager and all consumer packs from this point. This entry changes no existing file. It adds this log, the reference checker, and a snapshot archive.

### Git state

| Item | Value |
|---|---|
| Branch | `datapackmanager-26x-roadmap` |
| HEAD | `c0e80f8`, 2026-07-07, "workspace updates" |
| main | 11 commits behind HEAD; `staging` has nothing beyond `main` |
| Untracked before this entry | `FRAMEWORK_ASSESSMENT.md`, `MAINTAINER_GUIDE.md`, `ROADMAP_DATAPACKMANAGER_26X.md`, `datapackmanager-core/` |
| Untracked added by this entry | `MAINTENANCE_LOG.md`, `_pythontools/reference_check.py`, the archive below |

### Snapshot archive

- Path: `_archived/datapacks-workspace (backup 25-09-2026).zip`, named after the existing precedent `datapackmanager-1.19 (backup 27-05-2022).zip`.
- Contents: the whole working tree except `.git/`, `__pycache__/`, and the archive itself. `_archived/`, `_dist/`, local settings, and the untracked documents are all inside.
- Integrity: `MANIFEST.sha256` inside the zip lists a SHA-256 per file. The sidecar file next to the zip holds the SHA-256 of the zip, and the same hash is recorded at the end of this entry.
- Restore: extract into an empty folder. Git history is not in the archive; it lives in `.git/` and on origin.

### Framework generations, oldest to newest

| Namespace | Location | State |
|---|---|---|
| `datapackmanager` | `_archived/datapackmanager-mc1.19.00` | tick-tag based, flag-driven alerts, two-digit version oracle |
| `datapackmanager-1.20` | `_archived/datapackmanager-mc1.21` | plural folders, first versioned namespace |
| `datapackmanager-1.21` | `datapackmanager-mc1.21/` template, vendored into six packs | the shipped generation |
| `datapackmanager-1.21.10` | `origin/datapack-manager-rework` | directory rename only; all 82 references still point at `datapackmanager-1.21`; abandoned |
| `datapackmanager-26.1` | `datapackmanager-mc26.1/` | directory rename only; 65 unresolved references; dead on arrival |
| `datapackmanager-2` | `datapackmanager-core/` | rebuilt, statically clean, never loaded in-game |

### Packs and their declared windows

| Pack | Pack version | Minecraft window | Stage tag | Framework |
|---|---|---|---|---|
| `aroundtheworld-v1.02.00` | 10200 | 11404 to 12108 | ready for release | 1.21 |
| `aroundtheworld-v1.03.00` | 10300 | 11404 to 12108 | ready for release | 1.21 |
| `dimensionaldoors-v3.02.01` | 30201 | 11404 to 12110 | ready for release | 1.21 |
| `harvester-v3.03.02` | 30302 | 11404 to 12108 | released | 1.21 |
| `portyltrident-v1.00.05` | 10005 | 11404 to 12108 | ready for release | 1.21 |
| `seaskipper-v1.02.01` | 10201 | 11700 to 12110 | ready for release | 1.21 |
| `racetotheend-v1.00.00` | 10000 | formats 94.1 to 101.1 | requires update | none |
| `swiftghasts-v1.00.00` | 10000 | formats 80 to 94.1 | released | none |
| `swiftghasts-v1.00.01` | 10001 | formats 80 to 101.1 | ready for release | none |
| `endermitescript_ayutthaya-v1.00.00` | 10000 | format 69 | ready for release | none |
| `endreplacement-mc1.21.10` | none | format 81 | ready for release, worldgen | none |

Windows for framework packs come from each pack's `packages/preinstaller/check.mcfunction`. Every consumer sets `ignorecompatibility.forward` to true, so the forward bound only affects reporting, never activation.

### Verified at baseline

- Vendored framework: all six consumer copies of `data/datapackmanager-1.21` and `data/datapackmanager` are byte-identical to the template. `datapackmanager-mc26.1` is byte-identical to the template apart from its directory name; nothing inside was rewritten.
- Reference check with `reference_check.py` over every root pack. Findings not in the guide or the assessment:
  1. `portyltrident-v1.00.05`: `packages/preinstaller/initialize.mcfunction` starts and stops `aroundtheworld:root/loops/configtriggers` instead of its own loop, so the config-trigger loop never runs. The released zip in `_dist` has the same lines. The pack was most likely cloned from Around The World.
  2. `datapackmanager-core`: `root/command/enable.mcfunction` is written as the reward of an `enable_command` advancement that does not exist in the tree, so players who join after load never get `dm_command` enabled. `LIMITATIONS.md` section 4.1 describes that advancement as present. Also `data/datapackmanager/tags/function/command.json` is empty although `root/command/router.mcfunction` says it is listed there.
  3. `racetotheend-v1.00.00`: `load.mcfunction` calls a missing `ranking/setup`; `stats/all.mcfunction` calls a missing `stats/all_`; `stoploops` clears `countdown/death/ticker` and `locator/stronghold/cleanup` clears `locator/stronghold/precise/probe`, neither of which exists. All are work-in-progress leftovers that postdate the May export.
  4. `endermitescript_ayutthaya-v1.00.00`: both vehicle `spawn.mcfunction` files call `scripts/drivablevehicles/alerts/vehiclelimitsreached`, but the file is named `vehicle_limits_reached`, so the vehicle-limit alert never shows.
  Orphan scan of the template and the core (`--orphans`): in the template, `packages/alerts/configurationloaded` is never called and the two `command/*/handle` files plus `updates/v1.01.00` are unreferenced; in the core, `root/command/enable` and `root/command/router` are unreferenced, which is finding 2 seen from the other side.
  Findings already documented and still present: `ui_jingle` calls in every consumer `updates/vX` file, `root/commands/config-` and `uninstall-` in the framework uninstall, the orphaned `packages/events/command/*/handle` files, and the `patch.mcfunction` clobber of 1.21.9.
- Export artifacts: every zip in `_dist` ships a `pack.mcmeta` byte-identical to the source `pack.mcmeta.disabled`, not a file generated from `.mpp-datapack`. Harvester declares formats 15 to 94.1 in its manifest but ships `pack_format` 15 alone. The older zips for Harvester, Dimensional Doors, Portyl Trident, Seaskipper, and Around The World contain both `function/` and `functions/` trees; that duplication is what made one zip load on 1.14 through 1.21. The plural trees were never in git, so a fresh export from today's source will not load below 1.21 until a plural copy is produced again.

### Open decisions carried forward

1. Confirm the generation label for the rebuild; `datapackmanager-2` is a placeholder per the roadmap.
2. Decide whether sub-1.21 support keeps shipping. If yes, define how the plural tree is produced at export time.
3. Load `datapackmanager-core` in-game on 1.21, 26.1, 26.2, and a 26.3 snapshot before adopting it (roadmap phase 0).
4. Fix Portyl Trident's loop start before its next release.
5. Delete `datapackmanager-mc26.1/` once the rebuild is adopted (roadmap phase 2).
6. The three root documents and the core's docs use em dashes and en dashes throughout, which house style forbids. Clean them up when they are next edited.

### Archive hash

Built and verified on 2026-09-25 after every other line of this entry was written, so the copy of this log inside the zip lacks only this section.

| Item | Value |
|---|---|
| Files archived | 3346 |
| Zip entries | 3347, the files plus `MANIFEST.sha256` |
| Uncompressed size | 5023802 bytes |
| Zip size | 2622094 bytes |
| SHA-256 of the zip | `af8b30ef8e04d7c223b29f8202e22dd9137ce9224d7f8cf7df7bff03db25249a` |
| Verification | `testzip` clean, 12 sampled entries re-hashed against the manifest, all key documents present |
