# Maintenance Log

Running log for DatapackManager and the packs that depend on it. Newest entry first. Each entry records the git state, what changed, what was verified, and what is still open, so any maintainer can pick up from the last entry without re-deriving the state of the repo.

Companion documents, all at the repo root:

- `MAINTAINER_GUIDE.md`: architecture, conventions, cross-version system, per-pack deep dives, and the update playbook. Read this first.
- `FRAMEWORK_ASSESSMENT.md`: scored critique of the shipped framework, including its dead code.
- `ROADMAP_DATAPACKMANAGER_26X.md`: plan for the next framework generation.
- `datapackmanager-core/README.md` and `datapackmanager-core/LIMITATIONS.md`: the rebuilt generation and every Minecraft version boundary it respects.

Tools:

- `_pythontools/reference_check.py`: resolves every function reference in a pack and exits 1 on any dead reference. Run it after any framework change, namespace rename, or re-vendoring.
- `_pythontools/format_check.py`: checks, or with `--fix` rewrites, every source file for one line-ending style, no trailing whitespace, one final line break, no runs of blank lines, and two-space JSON.
- `_pythontools/derive_generation.py`: derives `datapackmanager-mc26.3` from the canonical template `datapackmanager-mc1.21`; `--check` proves the derived copy has not drifted.
- `_pythontools/datapack_manager_tool.py`: the legacy Tkinter tool, being sunset. Its Framework Updater is still the only thing that re-vendors the framework into consumers.

---

## 2026-09-25: route cleanup and the 26.3 update

Second entry of the day. Every dead reference inside the DatapackManager trees is gone, every file in them is in one formatting style, and the framework detects Minecraft 26.1, 26.2 and 26.3. The six consumer packs were deliberately not touched; they still vendor the framework as it was at the handover baseline (see "Not done" below).

### Git state

| Item | Value |
|---|---|
| Branch | `main` at `5321573`, the pushed handover baseline |
| This entry | Commit `edcd279` on `staging`, followed by this log update as its own commit; both pushed to origin the same day. `main` stays at `5321573` until the next release merge, per the README's branch model. |
| Retired | `datapackmanager-mc26.1/` (108 tracked files deleted) |
| New | `datapackmanager-mc26.3/` (111 files, derived), four version leaves in the template, `datapackmanager-core/data/datapackmanager-2/advancement/enable_command.json`, `_pythontools/format_check.py`, `_pythontools/derive_generation.py` |

### Decisions made in this entry

1. **Encoding for the year.drop releases.** The maintainer's instruction: keep the five-digit `major*10000 + minor*100 + patch` value and encode 26.3 as `12603`. So 26.x is stored as 1.<year>.<drop>: `VERSION$minecraft.current.major` stays 1, `.minor` carries the year (26), `.patch` the drop. This is the only encoding under which the consumer packs keep working: they gate on `.minor matches 16..`, `17..`, `19..` and `21..` (Harvester's sneak detection, Dimensional Doors' door closer, every config trigger), all of which stay true with `.minor = 26` and would all fail with the `260100` scheme the roadmap draft proposed (`.minor` would have been 1). Hotfixes (26.1.1, 26.1.2) add no parseable id and report as their drop.
2. **In-game display.** For `current matches 12600..` the version prints as `26.3` (minor.patch); below that as before (`1.21.9`). Both the load-time admin banner and the `dm_version` trigger carry the two variants, in the template and in the core.
3. **Generation naming.** The author's own fork `datapackmanager-mc26.1` was the declared "prep for datapack manager update" (commit `e343167`), so the 26.x generation stays a separate namespace rather than an in-place revision of `datapackmanager-1.21`. It is now `datapackmanager-mc26.3` / `datapackmanager-26.3` / alert label `mc26.3`, named after the release it was brought up to, and it is **derived, never hand-edited**: `python _pythontools/derive_generation.py datapackmanager-mc1.21 datapackmanager-mc26.3` regenerates it and `--check` proves zero drift. The canonical source stays `datapackmanager-mc1.21`, because that is what the consumers vendor. Whether the long-term label should be a plain generation number instead of a Minecraft version remains open (below).
4. **No sentinel leaf yet.** 26.4 Snapshot 1 (2026-09-22, data pack format 122.0) added no new block, item, particle or entity id, so nothing can probe for it. `forward` is therefore 12603 and the "unknown version" alert is unreachable until a 26.4 snapshot exposes a durable block; `pack.mcmeta` `max_format` is the only guard for the core.
5. **The 1.21 leaf gap stays.** 1.21 and 1.21.1 report as 1.20.5 (`12005`), and every 1.19.x and 1.20.0/1.20.1 client reports the 1.19.4 and 1.20.2 leaves, because the author's leaves probe ids introduced at the start of each minor. That is the existing "one leaf per minor" design and was left alone.

### Facts verified on minecraft.wiki (2026-09-25)

| Fact | Source page |
|---|---|
| 1.21.10 (2025-10-07, format 88.0) is a fixes-only release with no new ids | Java Edition 1.21.10 |
| 1.21.11 (2025-12-09, format 94.1) added the spears, so `minecraft:wooden_spear` is an item | Java Edition 1.21.11 |
| 26.1 (2026-03-24, format 101.1) is the first year.drop release and added the `minecraft:golden_dandelion` block; 26.1.1 and 26.1.2 (format 101.1) added nothing detectable | Java Edition 26.1, 26.1.2 |
| 26.2 (2026-06-16, format 107.1) added the `minecraft:sulfur` block | Java Edition 26.2 |
| 26.3 (2026-09-15, format 121.0) added the poplar wood set, so `minecraft:poplar_log` is a block; `minecraft:red_shrub` also survived to release | Java Edition 26.3 |
| 26.4 Snapshot 1 (2026-09-22, format 122.0) added no new ids | Java Edition 26.4 |
| `time query gametime` still parses after the 26.1 `/time` rewrite (the core's epoch trick depends on it) | Commands/time |
| `player` is still a valid `playsound` source; `ui` was added in 1.21.6 | Commands/playsound |
| 25w18a made JSON parsing strict about syntax (trailing commas and the like); no statement that unknown keys are rejected, so the dual `item`/`id` icon and dual `hoverEvent`/`hover_event` hedges stay | Java Edition 25w18a |
| `hover_event.show_text` uses `value`, `click_event.run_command` uses `command` (1.21.5), which is what the hedged components already emit | Text component format |

### Changes, canonical template `datapackmanager-mc1.21`

- `packages/versioning/check.mcfunction`: four new dispatch lines (1.21.11 `12111`, 26.1 `12601`, 26.2 `12602`, 26.3 `12603`); the `patch` block is gone. `versions/patch.mcfunction` deleted: it overwrote every 1.21.9+ result with `12110`, so 1.21.9 now reports `12109` and 1.21.10 shares that value.
- New leaves `versions/1.21.11`, `26.1`, `26.2`, `26.3` with probes `give a minecraft:wooden_spear`, `execute if block ~ ~ ~ minecraft:golden_dandelion`, `minecraft:sulfur`, `minecraft:poplar_log`.
- `root/core/initialize.mcfunction`: `forward` 12110 to 12603; the version banner is called once instead of `as @a at @s`. The old call ran the alert once per online player while the alert itself targets `@a[tag=DM_admin]`, so every admin got N copies and N jingles.
- `packages/alerts/minecraftversion.mcfunction` and `root/events/command/version.mcfunction`: two-format display. `dm_version` used to call the admin alert, so a non-admin who typed `/trigger dm_version set 1` saw nothing and every admin saw the answer; it now prints to `@s`.
- `root/core/uninstall.mcfunction`: the dead calls to `root/commands/config-` and `root/commands/uninstall-` are replaced by the three existing cleanup functions (`event/initialize/cleanup`, `command/config/cleanup`, `command/uninstall/cleanup`), which strip the `DM_command_*` tags and event scores before the objective is removed.
- Template namespace `mydatapack`: the orphaned `command/config/handle` and `command/uninstall/handle` files are wired in (the inline `.handled` write moved into them) and now write to the `MyDatapack` objective with `BOOL$true` instead of a literal `1` on the wrong objective. `versioning/check` throws once instead of once per online player (with no players online the old form never threw at all). `root/core/installer` calls `alerts/configurationloaded` after loading the default config, so that alert is no longer an orphan. Redundant `execute as @s run` wrappers removed in `configtriggers/reset` and `command/config`. `preinstaller/check`: `forward` 12110 to 12603.
- `.mpp-datapack`: `minecraftVersion` 26.3, `packFormatVersionMax` 121. `pack.mcmeta.disabled` content unchanged (still `pack_format` 15; export pipeline question, open decision 2 of the baseline entry).
- The orphan `mydatapack:packages/versioning/updates/v1.01.00` stays: it is the worked example behind the commented-out line in `versioning/check`.

### Changes, derived generation `datapackmanager-mc26.3`

Produced from the template by `derive_generation.py`: `data/datapackmanager-1.21` becomes `data/datapackmanager-26.3`, every `datapackmanager-1.21:` reference becomes `datapackmanager-26.3:`, every `mc1.21` label becomes `mc26.3` (seven alert prefixes and the `.mpp-datapack` name). `datapackmanager-mc26.1` is deleted; it had 65 unresolved references. `datapacks.mpp-workspace` lists the new directory and its expanded paths were remapped; the stale entry for a `datapackmanager-1.21` folder inside the fork was dropped.

### Changes, rebuilt core `datapackmanager-core`

- Leaves 26.1, 26.2, 26.3 re-encoded to `12601`, `12602`, `12603` with `.major` 1, `.minor` 26, `.patch` = drop; 26.3 is a supported leaf probing `minecraft:poplar_log` instead of a `red_shrub` sentinel. `forward` 260299 to 12603. `check.mcfunction` header rewritten around the new encoding and the missing sentinel.
- `minecraft_version` alert and `verb/version`: two-format display.
- New `advancement/enable_command.json` (criterion `minecraft:tick`, no display, reward `root/command/enable`), the file `LIMITATIONS.md` section 4.1 described but that did not exist; `root/command/enable` is no longer an orphan and players who join after load get `dm_command` enabled.
- `tags/function/command.json` now lists `root/command/router`, as the router's own comment claimed; the tag is never empty and the router is no longer an orphan.
- `pack.mcmeta`: `supported_formats.max_inclusive` 121, `max_format` `[121, 0]`.
- `README.md` and `LIMITATIONS.md` updated for the encoding, the probe table, the verification list and the pack formats; new `LIMITATIONS.md` section 8 records the encoding decision.

### Documentation

`MAINTAINER_GUIDE.md` (namespace table, section 5a encoding, section 6.1 catalogue, 6.2 ratchet and drop granularity, 6.3 bounds, 6.8 formats, the section 10 playbook now walks through 26.4 = `12604`, section 11 rewritten around the derivation script, section 12 tools, gotchas 12 and 15), `ROADMAP_DATAPACKMANAGER_26X.md` (encoding decision, probe table, too-new section, Q3, Q5 resolved, phases 2 and 4), `FRAMEWORK_ASSESSMENT.md` (status note at the top), root `README.md` (supported range), `_pythontools/README.md` (script table). The em and en dashes, ellipses and comparison glyphs in these documents were replaced with ASCII per house style, closing open decision 6 of the baseline entry; arrows and section signs were left.

### Verified

- `reference_check.py`: `datapackmanager-mc1.21` 106 functions, 137 references, 0 unresolved, 1 intentional orphan; `datapackmanager-mc26.3` identical; `datapackmanager-core` 40 functions, 5 tags, 45 references, 0 unresolved, 0 orphans. Consumer packs report exactly the baseline counts, confirming they were not touched.
- `derive_generation.py --check`: 111 files match, 0 drifted.
- `format_check.py`: 0 findings across the three trees; 272 files, all CRLF in the working tree (git stores LF, `core.autocrlf` is true), one final line break each, no blank-line runs, all JSON in two-space layout.
- Ratchet simulation (scratch script, probe introduction versions from the wiki): 27 client versions from 1.14.4 to a 26.4 snapshot, all three trees report the expected value and display string, thresholds equal their leaf values and ascend strictly.
- Command vocabulary of the template is unchanged (`scoreboard`, `function`, `tellraw`, `tag`, `schedule`, `particle`, `give`, `playsound`, `execute as/at/if/unless`, `datapack`, `kill`); the new leaves use only `give` and `execute if block`, which parse on 1.14.
- **Not verified:** no in-game load. The working tree still ships `pack.mcmeta.disabled` only, so an MPP export is needed before any test; the checks above are static.

### Not done, and why

- The six consumer packs still vendor the baseline framework (dead `root/commands/*` calls, `patch` clobber, `forward` 12110). Re-vendoring is per-pack release work: copy `datapackmanager-mc1.21/data/datapackmanager-1.21` and `data/datapackmanager` over each pack's copies (the `load.json` entry is already identical), bump each pack's `VERSION$minecraft.forward` and `.mpp-datapack` range, run `reference_check.py`, then `diff -r` against the template. Moving a pack to the 26.3 generation instead is the section 11 procedure in the guide.
- Nothing else in `_pythontools` was left out: the sunset GUI `datapack_manager_tool.py` was reformatted as well (343 lines of trailing whitespace, none inside a string literal per a tokenizer check, plus the missing final line break); every script still compiles and `git diff -w` shows no non-whitespace change to it.
- The 1.19.x and 1.20.0/1.20.1 over-reporting described in decision 5.

### Open decisions carried forward

1. Confirm the long-term generation label: `datapackmanager-26.3` follows the author's Minecraft-version convention, `datapackmanager-2` in the core follows the roadmap's generation-number argument. Pick one before consumers migrate.
2. Sub-1.21 shipping and the plural-folder export (baseline decision 2), and the `pack_format` 15 in `pack.mcmeta.disabled` that the zips inherit.
3. Load `datapackmanager-mc1.21` (exported) and `datapackmanager-core` in-game on 1.21.11, 26.1, 26.2 and 26.3 and confirm `26.3` prints; capture the golden `VERSION$minecraft.*` values before touching any leaf again.
4. Add a 26.4 sentinel leaf as soon as a snapshot exposes a durable block id, and re-verify it at 26.4 GA.
5. Re-vendor the consumers (above) and fix Portyl Trident's loop start (baseline finding 1) before its next release.

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

### Follow-up, same day: merged to main and tagged

- The two untracked groups above were committed on `datapackmanager-26x-roadmap`, and `main` was fast-forwarded to that tip. `main` had no commits of its own since `598a613` (2026-01-27).
- Tag `handover-baseline-2026-09-25` marks the resulting `main` commit. Tag `archive/datapack-manager-rework` keeps the abandoned rework commit `6fdc34c` reachable so its remote branch can be deleted later.
- Local branches `datapackmanager-26x-roadmap` and `transition-to-mpp` were deleted as fully merged. The annotated tag `transition-to-mpp` at `df993d5` is untouched. `staging` was fast-forwarded to `main` so the two branches the README documents stay level.
- Nothing was pushed. On origin, `main` and `staging` are still at `598a613`, and `origin/transition-to-mpp` and `origin/datapack-manager-rework` still exist.
- Pushed later the same day: `main`, `staging`, and both new tags are on origin, and the remote branches `transition-to-mpp` and `datapack-manager-rework` were deleted. The tag `archive/datapack-manager-rework` is now the only reference to `6fdc34c`.
