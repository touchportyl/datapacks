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

## 2026-09-25: load test in the build verification

Fourth entry of the day. The packs are now checked on real Minecraft servers: `_pythontools/verify_build.py --load --accept-eula` builds Harvester and Dimensional Doors and loads them on a headless server for each of 20 installed Minecraft versions from 1.14.4 to 26.2. The first runs found two more Dimensional Doors defects, both fixed below, and confirmed most of the third entry's fixes in game.

### Git state

| Item | Value |
|---|---|
| Branch | `staging` at `53bc701`; this and the previous entry are uncommitted working-tree changes, nothing pushed |
| New | `_pythontools/load_test.py`, `load_test.json`, `load_test_scenarios/harvester.txt`, `load_test_scenarios/dimensionaldoors.txt`, `verify_build.py`, `dimensionaldoors-v3.02.01/data/dimensionaldoors/function/compatibility/debug/samplepoint.mcfunction` |
| Changed | `dimensionaldoors-v3.02.01/.../root/detection/portal.mcfunction`, `.../root/closermechanism/main.mcfunction`, `_pythontools/README.md`, `MAINTAINER_GUIDE.md` (sections 6.6, 8.4, 8.5, 10 step 9, 12, gotchas 4 and 16), this log |

### Decisions made in this entry

1. **The user accepted the Minecraft EULA for local test servers** and asked for the load test to be part of the build verification. The harness still writes `eula=true` only when a run passes `--accept-eula` or sets `MINECRAFT_ACCEPT_EULA=1`, so nobody else accepts it by cloning the repo.
2. **Servers come from the installed client jars, not downloaded server jars.** A client jar contains the dedicated server (`net.minecraft.server.Main`, `MinecraftServer` on 1.14 and 1.15), the version JSON lists its libraries, and the launcher's own runtimes provide Java 8, 16, 17, 21 and 25. Nothing is downloaded. 1.18.2 asks for `java-runtime-beta`, which is not installed; the harness falls back to the lowest installed Java that is new enough (17), only for Java 17+ versions.
3. **The build is the dual layout** by default: singular folders plus a plural copy (`functions/`, `advancements/`, ...), which is what every released zip of these packs contains. A plain MPP export today is singular-only (open decision 2); `--layout singular` tests that.
4. **Version windows live in `load_test.json`**, not in the packs. Every resource without a rule must load on every tested version; rules give windows like `1.20.5..` or `{name}..` (the version in the file's own name), and the framework probes must also fail to load before their window. The table doubles as the specification of which file is meant for which versions.
5. **Golden `VERSION$minecraft.current` values were recorded from real servers**, which closes the "capture golden values" half of open decision 3 of the route-cleanup entry: 1.14.4 11404, 1.15.2 11502, 1.16.5 11605, 1.17.1 11701, 1.18.2 11802, 1.19.4 11904, 1.20.1 12002, 1.20.2 12002, 1.20.4 12003, 1.20.6 12005, 1.21.1 12005, 1.21.3 12102, 1.21.4 12104, 1.21.5 12105, 1.21.6 12106, 1.21.8 12107, 1.21.10 12109, 1.21.11 12111, 26.1.2 12601, 26.2 12602. 1.20.1 reporting 12002 and 1.21.1 reporting 12005 are the leaf gaps described in decision 5 of that entry, now measured.

### What the harness does

Per version: fresh flat world with the built packs; server bound to 127.0.0.1, offline, peaceful; every load error before "Done" attributed to a pack resource (function, advancement, predicate, item modifier, loot table; seven log formats between 1.14 and 26.2) and checked against its window, with any unattributable error mentioning a pack namespace failing the run; then the framework state (the golden value and its major/minor/patch, `FLAG$isActive`, `COUNT$datapacks` = 2, each pack's `FLAG$isActive` and `VERSION$datapack.latest`); then the smoke scenarios with random ticks frozen:

- Harvester: an armor stand carrying the tags of a stone hoe and wheat seeds drives `root/positioner/filter` over a ripe 7x7 field; the five plots of the 3x3 star must be replanted, the corners left ripe, drops and XP present; then an iron hoe goes through `root/damagetool2` twice and must end at damage 1, then 2 (on 1.19.4+, through that version's item-modifier set).
- Dimensional Doors: a conduit makes an entrance (north, left hinge), the entangled conduit makes an exit (east, right hinge), both must close in their own orientation, an armor stand on a sample point of the reopened entrance must arrive in front of the exit, a second pair (spruce and birch) is linked, and breaking both entrances in one command must remove all four portals.

Each server runs in a Windows job object with kill-on-close, so killing the harness kills its server (tested by killing the Python process of a running test). A full run of 20 versions took 22 minutes on this machine; `--quick` runs five boundary versions in about 3.

### Defects found by the load test and fixed

- **Dimensional Doors never teleported anything on 1.14 to 1.16.** `root/detection/portal` drew its debug visualiser with `particle minecraft:small_flame`, a particle added in 1.17; the unknown id dropped the whole function on older versions, and that function is what tags an entity in the doorway. The particle now lives in `compatibility/debug/samplepoint`. Teleport now passes on 1.14.4, 1.15.2 and 1.16.5.
- **Dimensional Doors never closed doors on 1.21.2 and 1.21.3.** Those versions report `.minor` 21, which routed them to the v1 closer, but until 1.21.4 `setblock` rebuilds the placed lower half from the still-open upper half, so v1's `replace` comes back open ("Could not set the block"; reproduced by hand on 1.21.3, works on 1.21.4). `closermechanism/main` now sends 12100..12103 to v2 and uses v1 from 12104.

### Fixes from the third entry that the load test confirmed

- The v2 closer keeps each door's orientation on 1.16.5 to 1.21.3 (it used to turn every door to face west with a right hinge).
- Pale oak in its own `1.21.4` files: the copper door files now load on 1.21.1 and 1.21.3.
- Conduit linking on 1.20.4 (tag data) and 1.20.6+ (components), teleport through the linked pair, and the same-tick destruction of two pairs, on every tested version.
- Harvester's item-modifier sets: the durability write ends at 1 then 2 on 1.19.4 to 26.2 through the legacy, 1.20.5 (both `enchantment` keys) and 1.21.2 sets, which exercises the half-step margin.
- Every version-isolated file loads exactly where its window says, and the framework probes fail below their windows.
- The final gate: `verify_build.py --load --accept-eula` passed every step, format (674 files), references (the three framework trees and both packs, 0 unresolved), derivation (111 files, 0 drift) and the load test (20 of 20 versions, 0 problems).

### Found out along the way

- From 1.20.5 (seen on 1.20.6; 1.20.4 still resolves at run time), `item modify` and `execute if predicate` resolve their ids when the function loads, so a function that names a missing modifier or predicate does not load at all. That is why each item-modifier set needs its own `compatibility/setdamage-<version>` caller.
- 1.21.11 renamed the game rules (`randomTickSpeed` became `random_tick_speed`; the old name is rejected). Neither pack nor the framework uses a game rule; Race to the End already uses the new names.
- Before 1.21.4, `setblock` cannot open or close one half of a door by itself, so the scenario opens the entrance with a redstone block.

### Not verified

- 26.3: no 26.3 client is installed, so `load_test.json` carries no 26.3 entry and the 26.3 item modifiers, the 26.3 sneak predicate and the poplar door files have never been loaded. Installing 26.3 in the launcher and adding `"26.3": {"minecraft_current": 12603}` to `load_test.json` closes this.
- Anything that needs a real player: sneak detection, `damagetool` reading `SelectedItem`, the config and uninstall menus, admin alerts, and particles.

### Open decisions carried forward

The list of the previous entry stands, with decision 3 narrowed to: install 26.3 and run the load test on it, then look at the player-only paths in game once.

---

## 2026-09-25: Harvester and Dimensional Doors re-vendored and fixed

Third entry of the day. Both packs now vendor the current `datapackmanager-1.21` template byte for byte, and every defect found in their own code by a full read-through, the reference checker, the minecraft.wiki changelogs and the vanilla data in the locally installed client jars is fixed. Nothing was loaded in game.

### Git state

| Item | Value |
|---|---|
| Branch | `staging` at `53bc701` |
| This entry | Uncommitted working-tree changes on `staging`; nothing committed or pushed |
| Touched | `harvester-v3.03.02/`, `dimensionaldoors-v3.02.01/`, `MAINTAINER_GUIDE.md`, this log |
| Not touched | the template, `datapackmanager-mc26.3`, `datapackmanager-core`, the other consumer packs |

### Decisions made in this entry

1. **No version bump, no folder rename.** The fixes live in the existing `harvester-v3.03.02/` and `dimensionaldoors-v3.02.01/` folders. Both versions already have zips in `_dist`, so the next export of either pack must bump the version first: `.mpp-datapack` `packVersion`, `VERSION$datapack.current` in `preinstaller/check`, the final clamp line in `versioning/check`, both `datapack disable` names in `root/core/disable`, the title of the pack's root advancement, and the folder name. No save-data layout changed, so no `updates/vX` migration is needed. Harvester's `changelog.md` has an "unreleased" section ready.
2. **`forward` 12603** in both packs, `.mpp-datapack` `15..121` and `minecraftVersion` 26.3 in both (Dimensional Doors was `48..48`). `pack.mcmeta.disabled` is unchanged (still 15 and 48), because the export question is open decision 2 below.
3. **The poplar door uses window class D** (no particles through a closed door). The wiki does not describe the texture and no 26.3 client jar is installed; check it in game and move the tag in `summon/door/26.3` if the door has a window.
4. **Dimensional Doors' 404 displacement is unchanged.** `spreadplayers ~ ~ 0 1 false @s` puts an entity on the highest block at the chosen column, so walking into an unlinked entrance indoors lands the player on the roof, and in the Nether on the bedrock ceiling. Keeping the entity at its own height needs `under <absolute y>`, which only a macro can supply, so this is a design decision for the author rather than a mechanical fix.
5. **Migration jingles stay silent.** The `updates/vX` calls now reach the real `ui/jingle`, but that plays to `@s` and the migrations run from the scheduled listener with no executing entity. The template's example update behaves the same way; changing it belongs in the template.

### Facts verified (2026-09-25)

| Fact | Source |
|---|---|
| Item stacks moved from `tag` to `components`, and `Count` to `count`, in 1.20.5 (24w09a); 1.20.3 and 1.20.4 still use `tag` | minecraft.wiki: Java Edition 1.20.5, Item format/Before 1.20.5 |
| `custom_name` and `lore` became SNBT text components in 1.21.5 (25w02a); JSON strings before | minecraft.wiki: Java Edition 25w02a, Text component format |
| Particle options became SNBT in 1.20.5 (Pre-Release 1); `flash` needs `color` since 1.21.9 (25w36a); no /particle change in 26.x | minecraft.wiki: Commands/particle, Java Edition 1.20.5, 1.21.9 |
| Item predicate enchantment checks moved to `predicates.minecraft:enchantments` in 1.20.5 (24w11a); the field is `enchantment` in 1.20.5/1.20.6 and `enchantments` from 1.21 | minecraft.wiki: Java Edition 1.20.5, 1.21; vanilla `silk_touch_nest.json` in the local 1.20.6, 1.21.1 and 26.2 jars |
| Inventory-changed item predicates take an `items` list before 1.20.5 (`"items": ["minecraft:dragon_breath"]`) and accept a list or a string after | vanilla `end/dragon_breath.json` in the local 1.19.4, 1.20.4 and 26.2 jars |
| 26.2 (Snapshot 3) turned entity predicates into a component-style map: existing field names stay valid as ids, `type` became `minecraft:entity_type`, unknown keys are rejected; vanilla writes `minecraft:flags`, `minecraft:equipment` | minecraft.wiki: Java Edition 26.2 Snapshot 3; vanilla advancements in the local 26.2 jar |
| 26.3 (Snapshot 4) renamed the predicate type key `condition` to `type`, the loot-function key `function` to `type`, and `conditions` (list) to `condition` (one inline value or id) | minecraft.wiki: Java Edition 26.3 Snapshot 4, Item modifier (history) |
| 26.3 (Pre-Release 1) split number providers into int and float registries; `minecraft:score` is int-only with `score`, `target`, `fallback` (no `scale`); float `from_int` takes `input`, float `div` takes `left` and `right`; `set_damage.damage` and `random_chance.chance` take float providers | minecraft.wiki: Java Edition 26.3 Pre-Release 1, Number provider |
| `SelectedItem` still exists for /data and nbt selectors in 26.3; experience orb `Age`/`Health`/`Value`, fireball `ExplosionPower`/`Motion`/`Invulnerable`, armor stand `Marker`/`Invisible` unchanged | minecraft.wiki: Player, Experience, Fireball, Armor Stand |
| `minecraft:copper_hoe` is vanilla since 1.21.9 (durability 190); Java iron tools have 250 durability, not 251 | minecraft.wiki: Hoe, Java Edition 1.21.9 |
| `minecraft:pale_oak_door` is gameplay-normal from 1.21.4; 26.3 added `minecraft:poplar_door` (in `#wooden_doors`); 26.1 and 26.2 added no doors; door block states unchanged | minecraft.wiki: Door, Java Edition 1.21.4, 26.3, Block tag |
| Crop ids and maximum ages, all sound events and particles the packs use, and the `spreadplayers`, `forceload`, `datapack`, `item`, `trigger` syntax are unchanged in 26.3 (26.3's /item takes slot sources, plain slot names still work) | minecraft.wiki: the respective pages |

### Re-vendor

Same procedure as the Framework Updater: `data/datapackmanager-1.21`, `data/datapackmanager` and `data/minecraft` were deleted in each pack, copied from `datapackmanager-mc1.21`, and `mydatapack:` rewritten to the pack's namespace. `diff -r` against the template is empty for both framework folders in both packs; `load.json` differs only in the namespace. That removed `versions/patch.mcfunction`, added the 1.21.11, 26.1, 26.2 and 26.3 leaves, and brought the uninstall, banner and `dm_version` fixes of the previous entry.

A formatting pass (`format_check.py --fix`) ran on both packs before any logic edit: `git diff -w --ignore-blank-lines` on that pass showed only the four Harvester item modifiers, whose `0.000001` the JSON writer re-serialises as `1e-06` (valid JSON, same value).

### Fixes, Harvester (`harvester-v3.03.02`)

- **Own event tags.** The config and uninstall handlers used the framework's `DM_command_config`/`DM_command_uninstall` tags directly (the "copy" added the tag to itself) and removed them after answering, so if Harvester's handler ran before another pack's listener, that pack never showed its menu. Harvester now copies to `HV_command_*` like the template and Dimensional Doors.
- **`handle` files wired in**, writing `EVENT$command.*.handled` on the `Harvester` objective with `BOOL$true` (they wrote a literal 1 on `DatapackManager` and were never called).
- **Throws run once.** `versioning/check` ran the throws `as @a at @s`, and `throw/datapacknotcompatible` calls `root/core/disable`, which decrements `COUNT$datapacks`: with several players online one incompatible pack could zero the counter and uninstall the manager under the other packs.
- **Legacy port moved.** The installer copied `$h.version TP_version` into `VERSION$datapack.latest` after the updates had already run and reset it; in any world where the `TP_version` objective exists, the read created the score as 0, `latest` became 0, and the next load re-ran every update, whose v3.03.01 step resets the config (tool breaking off). The port now happens in `versioning/check` before the default, and only for a real value (`matches 10000..`).
- **Dead jingle references** in the three updates now call `ui/jingle`; the installer calls the `configurationloaded` alert like the template.
- **Hoe detection per player.** `root/inventory/hoe` and `range` tagged `@a` and re-ran `hoe2` for every player already tagged that tick; they now work on `@s` only.
- **1.20.5 boundary.** `damagetool` read the removed `tag.Damage` on 1.20.5 to 1.21.1 (all reported as 12005, inside `..12005`); a failed `data get` stores 0, so the write set the hoe to 1 damage and harvesting repaired hoes. `toolbreak` switched to SNBT particles at 12000, so 1.20.2 to 1.20.4 had no break particles. Both now split at `..12004` / `12005..`.
- **Tool damage modifiers, four sets** (table in guide §7.5). The single legacy set ignored Unbreaking on 1.20.5+ (unknown top-level `enchantments` field, so every hoe lost durability on about 3 of 4 harvests) and does not load on 26.3. New sets for 1.20.5 to 1.21.1 (both `enchantment` and `enchantments`, because 1.21 and 1.21.1 report 12005), 1.21.2 to 26.2, and 26.3 (`type` keys, one `condition` via `all_of`, damage `div(from_int(score), 1000000.0)`), each called from its own `compatibility/setdamage-<version>`.
- **Iron durability 250**, not 251: with 251 the floored write never advanced an iron hoe's damage (simulated: 250 of 250 steps skipped). **Half-step margin:** `damagetool2` subtracts 500000 before dividing, because `set_damage` floors a float32 product; without it a float32 simulation of every tier and damage value skipped the damage on 2 copper, 44 iron, 2 diamond and 6 netherite steps (2, 51, 3 and 6 with the 26.3 division), with it none, in both arithmetic forms.
- **26.3 sneak predicate.** `predicate/26.3/player_checkers/is_sneaking.json` (`type`, `minecraft:flags`) and `compatibility/is_sneaking-26.3`; the main loop uses it on `12603..`. Without it Harvester does nothing on 26.3.

### Fixes, Dimensional Doors (`dimensionaldoors-v3.02.01`)

- **v2 door closer rotated doors.** Each of the 21 v2 per-wood files ran all eight upper-half `setblock` lines unconditionally; the lower half copies the upper half on the shape update, so every door closed facing west with a right hinge. The upper-half line is now conditional on the matching closed lower half. v2 runs on 1.16 to 1.20 and on 1.21/1.21.1 (reported `.minor` 20), so this hit 1.21.1 servers too.
- **v2 item cleanup:** `waxedcopper` killed a "Copper Door" item instead of "Waxed Copper Door"; `paleoak` had no kill line.
- **Pale oak split out** of the `1.21` files into `1.21.4` files (summon, v1, v2): the unknown `pale_oak_door` id dropped the whole file on 1.21 to 1.21.3, so copper doors never became portals or closed there.
- **Poplar door (26.3)** added in all places the playbook lists: `summon/door/26.3`, `closermechanism/v1/26.3` + `v1/poplar`, `v2/26.3` + `v2/poplar`.
- **Conduit data at 1.20.5.** Detection, linking, the "blow up the entrance" check and the uninstaller split at 1.20.3, so on 1.20.3 and 1.20.4 linked conduits were never recognised (and could spawn a second entrance). `createlinkedconduit` used the SNBT-text summon on 1.21.2 to 1.21.4, where names and lore must still be JSON strings. Splits are now `..12004` (tag), `12005..12104` (components, JSON-string text), `12105..` (SNBT text); the component-era summons use `count`.
- **Same-tick destruction.** `destroy/filter` matched partners against only the single furthest queued door, so when two linked pairs broke in the same tick (a creeper or TNT at a door hub) one partner was left as an orphan portal. `destroy/partners` now tags partners for every queued door, still without `distance` or `sort`, so it stays cross-dimensional.
- **"Quantum Conduits" advancement** used `"item"`, which item predicates have not had since 1.17, so it matched any item and was granted on the first pickup; that also made the background loop's conduit gate always true. It now uses `"items": ["minecraft:conduit"]`, the form the 1.19.4, 1.20.4 and 26.2 vanilla data all accept.
- **Event plumbing, throws, jingle, installer:** the same fixes as Harvester (handle files wired to the `DimensionalDoors` objective, throws once, `ui/jingle`, `configurationloaded`, redundant `execute as @s run` removed in `configtriggers/reset`).

### Verified

- `reference_check.py --orphans`: Harvester 140 functions, 254 references, 0 unresolved, 0 orphans; Dimensional Doors 211 functions, 277 references, 0 unresolved, 0 orphans; the template unchanged (1 intentional orphan).
- A scratch resolver for the references `reference_check.py` does not cover (item modifiers, predicates, advancement grants, `advancements=` selectors, advancement parents): 26 in Harvester and 9 in Dimensional Doors, 0 missing (the `tinkererscraft:` parent of `a_better_harvester` is external by design).
- `diff -r` template vs both vendored framework folders: empty. `derive_generation.py --check`: 111 files, 0 drifted. `format_check.py`: 0 findings over 392 files in the two packs, and on `MAINTAINER_GUIDE.md`.
- Every version gate in both packs was listed and checked against the verified boundaries: 1.20.5 for components and particle syntax, 1.21.5 for SNBT text, 1.21.9 for `flash`, 26.3 for the predicate and loot-function format.
- The 21 v2 per-wood files were checked structurally before the rewrite (eight matching lower/upper pairs each, block ids consistent).
- **Not verified:** nothing was loaded in game. The 26.3 item modifiers and predicate are written from the changelog text, since no 26.3 jar is installed (only the `26.3-snapshot-5` and `-10` manifests, without jars). The v2 closer fix follows from how door halves copy each other and was not watched on a 1.16 to 1.21.1 client.

### Not done, and why

- The four other framework consumers (both Around The World versions, Portyl Trident, Seaskipper) still vendor the baseline framework.
- No version bump or export (decision 1).
- The 404 displacement (decision 4).
- `predicate/player_checkers/is_sneaking_.json` is still dead code and now also logs a load error on 26.3; left for the author, like the other documented dead code.

### Open decisions carried forward

1. Confirm the long-term generation label (unchanged from the previous entry).
2. Sub-1.21 shipping, the plural-folder export, and the `pack_format` values in `pack.mcmeta.disabled` (15 for Harvester, 48 for Dimensional Doors).
3. Load both packs in game on 1.20.4, 1.20.5, 1.21.1, 1.21.4, 1.21.11, 26.2 and 26.3: harvest with each hoe tier including Unbreaking III and an iron hoe, open `dm_config` with both packs installed, close a portal door on 1.21.1, link doors with a conduit on 1.20.4 and 26.3, check the poplar door's window.
4. Bump versions and export Harvester (next after 3.03.02) and Dimensional Doors (next after 3.02.01).
5. The 404 displacement behaviour (decision 4).
6. Re-vendor the remaining consumers and fix Portyl Trident's loop start.

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
