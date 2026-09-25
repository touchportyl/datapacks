# Maintainer's Guide: Harvester & Dimensional Doors

*Two Minecraft datapacks by touchportyl / Portyl Studios, built on a shared "DatapackManager" framework.*

This document is the authoritative handover reference for a future engineer (human or AI) taking over maintenance of these two datapacks and updating them to new Minecraft versions. It assumes you know Minecraft datapacks in general but nothing about this codebase. Read sections 1 to 6 to build the mental model, then jump to section 10 (the update playbook) when you actually need to do work.

---

## 1. Overview & mental model

**Harvester** is a farming convenience pack: sneak while holding a hoe and looking at the ground, and it harvests + replants an area of mature crops around you (area size scales with hoe tier), grants XP, and damages the tool. **Dimensional Doors** turns paired doors into teleporters: throw a conduit onto an open door to make a portal, link two doors via an "entangled conduit," and walking through one door teleports you to its partner - across any distance or dimension.

**The single most important insight:** neither pack is standalone gameplay code sitting on vanilla. Both embed an identical copy of a shared framework library, the **DatapackManager**, under the namespace `datapackmanager-1.21`. This framework provides:

- **Version detection** - a runtime oracle that figures out which Minecraft version is actually running and publishes it as scoreboard values every pack reads.
- **Lifecycle management** - install-once/init-every-load bootstrapping, self-rescheduling loops, clean `/reload` handling.
- **An async event bus** - decoupled cross-pack command dispatch (config menus, uninstall).
- **A player-facing command surface** - `/trigger dm_help`, `dm_info`, `dm_config`, etc.
- **Multi-pack coordination** - a reference counter so the shared library self-uninstalls only when the last managed pack is removed.

Both packs are consumers of this framework, following an identical contract. **Learn the framework once (sections 3 to 6) and 80% of both packs becomes legible.** The gameplay code (sections 7 to 8) is comparatively small and sits on top.

```
+---------------------------------------------+
|  Minecraft #load tag                         |
|    1. datapackmanager-1.21:root/core/load    | <- framework boots first
|    2. <pack>:packages/preinstaller/load      | <- consumer waits, then registers
+---------------------------------------------+
        | publishes VERSION$*, FLAG$isActive, BOOL$* on objective "DatapackManager"
        v
   Harvester   +   Dimensional Doors   (read those scores, branch on version)
```

---

## 2. Repository & project structure

### Top-level layout

Pack directories are named `<namespace>-v<MM.mm.pp>`, e.g. `harvester-v3.03.02/`, `dimensionaldoors-v3.02.01/`. Framework *templates* use `<name>-mc<version>` instead: `datapackmanager-mc1.21/`, `datapackmanager-mc26.3/`, `endreplacement-mc1.21.10/`. Multiple versions of a pack coexist as sibling folders; superseded ones move to `_archived/`.

**Underscore-prefixed folders** sort to the top of the file explorer and hold non-shipping material:

| Folder | Purpose |
|---|---|
| `_archived/` | Dead/old code kept for reference. Still uses the old plural `functions/` path and the legacy `$h.version TP_version` scheme - useful as a "before" snapshot for migrations. |
| `_dist/` | Published `.zip` release artifacts, one per version. |
| `_packages/` | Trimmed, reusable modules importable into other packs (authored in the `mydatapack:` template namespace). |
| `_standards/` | Canonical/full reference implementations of shared modules. `_standards` = full reference; `_packages` = trimmed importable copy. |
| `_pythontools/` | Dev automation (see §12). |

Note on the framework template specifically: the canonical, full **DatapackManager** template lives at the repo root as `datapackmanager-mc1.21/` (a top-level sibling to the packs, not under `_standards/`). That directory is the single source of truth you edit for framework changes - see §10 step 8 and §12.

### Inside a pack directory

```
harvester-v3.03.02/
+-- pack.mcmeta.disabled          # real pack.mcmeta, renamed so MC ignores the source
+-- .mpp-datapack                 # MCFunction++ project manifest (metadata source of truth)
+-- data/
    +-- harvester/                # the pack's own namespace
    +-- datapackmanager-1.21/     # VENDORED full copy of the framework engine
    +-- datapackmanager/          # framework branding-only namespace (advancement/root.json)
    +-- minecraft/tags/function/load.json
```

**Namespaces you will see:**

| Namespace | Role |
|---|---|
| `harvester` / `dimensionaldoors` | The pack's own gameplay + lifecycle code. |
| `datapackmanager-1.21` | The vendored framework engine. **The `-1.21` suffix is a deliberate hard-pin of the *library* version** so two incompatible library generations can coexist in one world. Every internal call is fully qualified: `function datapackmanager-1.21:root/core/load`. |
| `datapackmanager` | Unversioned, branding only - one hidden root advancement anchoring a "Datapack Manager" advancement tab. Intentionally *not* version-suffixed (stable public identity). |
| `datapackmanager-26.3` | The 26.x generation (in `datapackmanager-mc26.3/`), derived mechanically from the canonical template; see §11. |
| `TP_version` (objective, not namespace) | Legacy pre-framework "TouchPortyl" versioning scheme, only bridged forward now. |

**Critical consequence of vendoring:** the framework is *duplicated into every pack*, not shared at runtime. All copies must stay byte-identical and be updated in lockstep. A framework change must be propagated to every pack (the Python "Framework Updater" automates this - see §10 step 8 for the canonical workflow).

### MCFunction++ (MPP) tooling

This repo is on branch `transition-to-mpp`. Packs are now **MCFunction++ (M++) workspaces**:

- The real `pack.mcmeta` is renamed `pack.mcmeta.disabled` so the game doesn't read the in-development source; **there is currently no active `pack.mcmeta` in either pack** (verified: both `harvester-v3.03.02` and `dimensionaldoors-v3.02.01` ship only `pack.mcmeta.disabled`). M++ regenerates it on export. **A pack with no `pack.mcmeta` will not load at all - the working tree is not directly loadable; you must export first (see §10 step 9).**
- `.mpp-datapack` is the metadata source of truth (JSON): `id` (2-letter tag, HV/DD), `packVersion`, `packFormatVersionMin/Max` (floats; `.1` suffix = snapshot format), `minecraftVersion`, `tags` (workflow stage), `unknownTagsLintMode`.
- `datapacks.mpp-workspace` is the top-level workspace file. Its inspector sections (`context:holders`, `context:variables`, `context:scoreboards`, `context:tags`) confirm M++ has first-class UI that parses the `PREFIX$`/holder conventions below.

---

## 3. The DatapackManager framework

Everything in this section lives under `data/datapackmanager-1.21/function/`. This is shared infra - explained once here, applies to both packs.

### 3.1 The one-objective state model

**All engine state lives on a single scoreboard objective, `DatapackManager`.** It is created first, before anything else:

```mcfunction
# root/core/load.mcfunction - WARNING: THIS COMMAND MUST RUN BEFORE ANYTHING ELSE
scoreboard objectives add DatapackManager dummy [{"text":"Datapack Manager","color":"white"}]
scoreboard players set BOOL$false DatapackManager 0
scoreboard players set BOOL$true  DatapackManager 1
```

State is held as **fake players named `PREFIX$dotted.path`** on that objective (the naming system is detailed in §4). Removing the `DatapackManager` objective is a full engine reset - that's exactly how uninstall works.

### 3.2 Load-time lifecycle

`#minecraft:load` runs `root/core/load` on every world load and `/reload`:

1. Create the `DatapackManager` objective (must be first).
2. Set constants `BOOL$false=0`, `BOOL$true=1`.
3. `root/datapackcounter/reset` → `COUNT$datapacks = 0` (reset every load; packs re-register afterward).
4. **Send** (not run) the `initialize` event - deferred so all packs finish loading first.
5. Idempotently stop-then-start the three engine loops (`main`, `eventlisteners`, `eventhandlers`).

`load` does **not** do version detection. That happens in `root/core/initialize`, run ~1 to 2 s later via the deferred event.

### 3.3 The deferred `initialize` event - why init is delayed

The manager must not run version checks or set `FLAG$isActive` until *every* pack has finished its `#load` and registered. So `load` only *sends* an `initialize` event; the real `core/initialize` runs later via the event bus. `core/initialize` then:

1. Sets `FLAG$secret = 259240` (install-detection magic number).
2. Runs `root/core/cleanup` (purges retired vars from older library generations - this is the in-place migration hook).
3. Sets MC version bounds: `VERSION$minecraft.backward = 11404`, `VERSION$minecraft.forward = 12603`.
4. Runs `packages/versioning/check` (detects the running MC version, sets `FLAG$isActive`).
5. Creates + arms the `dm_*` trigger commands.
6. If active: broadcasts the "Playing on Minecraft X.Y.Z" banner. If not: stops the main loop.

### 3.4 Loops - self-rescheduling, idempotent

The engine avoids `#minecraft:tick` entirely; it uses `schedule` chains for version-consistent timing. Three loops, each a trio `loops/<name>.mcfunction` + `<name>/start` + `<name>/stop`:

| Loop | Cadence | Body |
|---|---|---|
| `main` | `1s` | `eventmanager` + `commandmanager` |
| `eventhandlers` | `1s` | `packages/events/handlers` (does the work) |
| `eventlisteners` | `7t` | `packages/events/listeners` (latches/copies events fast, before slow loops drop them) |

**Loop body tail** (self-terminating): `execute if score LOOP$main.isActive DatapackManager = BOOL$true DatapackManager run schedule function datapackmanager-1.21:root/loops/main 1s`.

**Start pattern (the idempotency guard)** - prevents a second parallel schedule chain on the same tick:

```mcfunction
scoreboard players operation LOOP$main.alreadyactive DatapackManager = LOOP$main.isActive DatapackManager
scoreboard players operation LOOP$main.isActive DatapackManager = BOOL$true DatapackManager
execute if score LOOP$main.alreadyactive DatapackManager = BOOL$false DatapackManager run function datapackmanager-1.21:root/loops/main
scoreboard players reset LOOP$main.alreadyactive DatapackManager
```

**Stop** just sets `isActive = false`; the next scheduled iteration sees it and doesn't reschedule (lazy self-termination). Every `/reload` does stop-all-then-start-all, which the guard makes safe.

### 3.5 The async event bus (tri-state handshake)

`dm_info` describes it as *"an asynchronous event-based system, manages data like an ECS, works across all Minecraft versions."* Each event uses three scores so it survives the gap between the fast (7t) listener loop and slow (1s) handler loop and is handled **exactly once**:

- `EVENT$x` - raw flag; producer sets it; `eventmanager` expires it after ~2 s.
- `EVENT$x.copy` (or `EVENT$x <ConsumerObjective>`) - latched copy so slow loops don't miss the short-lived raw flag.
- `EVENT$x.handled` - tri-state: absent = idle, `0` = seen/copied but not handled, `1` = handled.

**Key architectural point:** the framework *produces* `command.config` and `command.uninstall` events but does **not** handle them - consuming packs subscribe and render their own config/uninstall UI. This decoupled cross-pack dispatch is the entire point of the "manager." The framework only *consumes* its own `initialize` event.

### 3.6 Command surface & managers

`root/events/managers/commandmanager.mcfunction` polls trigger scores each main-loop tick and dispatches:

```mcfunction
execute as @a[scores={dm_help=1..}]    at @s run function datapackmanager-1.21:root/events/command/help
execute as @a[scores={dm_config=1..}]  at @s unless score EVENT$command.config DatapackManager = BOOL$true DatapackManager run function datapackmanager-1.21:root/events/command/config
```

Triggers (`dm_help/info/version/config/uninstall`, all type `trigger`) are created by `initializecommands` and re-armed each poll by `resetcommands`, which enables `help/info/version` for everyone but `config/uninstall` only for `@a[tag=DM_admin]`. `eventmanager` increments each live event's `.timer` and expires it at `matches 2..`.

### 3.7 Datapack counter - multi-pack coordination

`COUNT$datapacks` is a reference count. `core/load` resets it every load; each consumer re-registers by calling `root/datapackcounter/increment`. On disable, a consumer calls `decrement` and, **if the count hits 0, calls `root/core/uninstall`** - the shared library self-uninstalls only when the last managed pack is gone.

**Load-order safety:** consumers do *not* increment during `#load` (order vs the framework's load isn't guaranteed). Instead their preinstaller polls `FLAG$isActive DatapackManager` every 2t until set, then registers. Because `core/load` resets the counter during the load phase and `isActive` is only set later via the deferred event, consumer increments always land after the reset → the count converges correctly regardless of load order.

### 3.8 Alerts & effects

All alerts are `tellraw @a[tag=DM_admin]` with a branded header, and end by playing a UI effect `as @a[tag=DM_admin] at @s`:

- `effects/ui/bong.mcfunction` - `note_block.pling` (errors/warnings).
- `effects/ui/jingle.mcfunction` - `player.levelup` at pitch 2 (info/success).

Every `tellraw` **that uses a hover or click event** carries **both** `hoverEvent`+`hover_event` (and `clickEvent`+`click_event`) keys - a deliberate hedge across the 1.21.5 text-component snake_case migration (§4, §5). This is *not* universal: most tellraws in the packs (the install/branding notifications, the alert banners, `harvester:packages/preinstaller/initialize`) carry **no** hover/click events at all and therefore neither key. The dual-key hedge is real but localized to components that actually use hover/click - verified present as 6 occurrences in `harvester packages/events/command/config.mcfunction` (and in the sibling `uninstall.mcfunction`). Read "every tellraw" as "every tellraw that uses a hover/click event."

---

## 4. Coding conventions & naming

### 4.1 The `PREFIX$name` fake-player "variable" system

The framework fakes typed global variables in a language that has none. A fake player is named `PREFIX$identifier`, stored on a **holder objective** that acts as its namespace. The `$` separates a semantic *type prefix* from a dotted *variable path*.

**Holder objectives (the namespaces):**
- `DatapackManager` - global holder; all framework constants + MC-version state.
- `Harvester` / `DimensionalDoors` - per-pack holders (named exactly = display name); the pack's own config + version state.
- `TP_version` - legacy pre-framework holder; only the migration-bridge value `$h.version`/`$dd.version` survives.

**Prefix quick-reference:**

| Prefix | Meaning | Examples | Holder |
|---|---|---|---|
| `BOOL$` | The only two constants (0/1); everything compares/copies against these, never literals | `BOOL$true`, `BOOL$false` | `DatapackManager` |
| `VERSION$` | Packed-integer versions | `VERSION$minecraft.current[.major/.minor/.patch]`, `.backward`, `.forward`, `VERSION$datapack.current`, `.latest`, `VERSION$ignorecompatibility.forward/.backward` | both |
| `CONFIG$` | User-facing config booleans | `CONFIG$harvestxp`, `CONFIG$toolbreaking`, `CONFIG$disableparticles` | pack holder |
| `LOOP$` | Loop lifecycle flags | `LOOP$main.isActive`, `LOOP$main.alreadyactive` | either |
| `FLAG$` | Internal state | `FLAG$isActive`, `FLAG$secret` (magic `259240`) | pack or manager |
| `EVENT$` | Event-bus state | `EVENT$command.config[.handled/.timer]`, `EVENT$initialize.*` | both |
| `COUNT$` | Counters | `COUNT$datapacks` | `DatapackManager` |
| `RAND$` | Pseudo-random cycle counter (name = modulus) | `RAND$4` cycles 1→2→3→1 | pack holder |
| `DD$` | Per-pack allocator (older style) | `DD$doorID.current` | `DimensionalDoors` / `DD_doorID` |
| `$h.version` (legacy) | Pre-v3 TouchPortyl scheme | `$h.version`, `$api.tc.h` | `TP_version` |

**Convention:** treat `PREFIX$` as the type/scope tag, the holder as the namespace, the dotted suffix as the path. Assign booleans by copying the constant (`scoreboard players operation X = BOOL$true DatapackManager`), never by setting a literal `1`.

### 4.2 Objective naming - 16-char limit, 2-letter prefix

Objectives that store *per-entity* data are prefixed with the 2-letter pack ID + `_`. Self-documented in `installer.mcfunction`: `# 16 letter limit for objective names / XX_XXXXXXXXXXXXX`.

- Harvester: `HV_damagetool`, `HV_sneak_time` (vanilla criterion `minecraft.custom:minecraft.sneak_time`, only on MC 1.14 to 1.15).
- Dimensional Doors: `DD_doorID` ("Door ID", light_purple), `DD_warpcooldown`.
- Framework triggers: lowercase `dm_*`.
- Config triggers: `z_<pack>_NNN_{t,f}` (§4.5).
- Brand colors: Harvester `gold`, Dimensional Doors `light_purple`, DatapackManager `white`.

### 4.3 Tag naming & the "semi-persistent" lifetime class

Tags use the same 2-letter prefix. Two lifetime classes:

- **Semi-persistent** - added during a tick, explicitly stripped at end of each loop by a dedicated garbage-collection file. Harvester's `root/garbage_collection.mcfunction` is just `tag @s remove ...` for every transient tag (tier tags, area tags, crop tags, `HV_success`, `HV_isHoldingHoe`) plus `scoreboard players reset @s HV_sneak_time`. **No gameplay state survives a tick** except tool-item NBT and the global `RAND$`/`LOOP$`/`CONFIG$` scores. Everything is rebuilt from inventory each tick.
- **Persistent** - DD portal markers carry long-lived `DD_portal`, `DD_entrance`, `DD_exit`, `DD_<wood>`, `DD_particle_X`, `DD_doorID`.
- **Framework routing tags:** `DM_admin` (gates admin output + config/uninstall triggers), `DM_command_config`/`DM_command_uninstall` (marks who fired a command). These belong to the framework: a consumer copies them onto its own `<ID>_command_config`/`<ID>_command_uninstall` tags in its listener and only ever removes its own copy. Harvester used the `DM_` tags directly until 2026-09-25, so whichever pack's handler ran first could strip the tag before another pack's listener had copied it.
- **Debug tags:** `hv_debug`, `dd_debug`, `DD_debug` gate developer visualizers/trace tellraws.

### 4.4 File granularity, comments, tellraw format

- **One tiny file per concern.** Many files are 1 to 5 lines. Each crop, hoe tier, door material, and MC version is its own file; dispatch is via stacked `execute ... run function`. The `harvester` gameplay namespace itself is **68 `.mcfunction` files** (`find data/harvester -name '*.mcfunction'`). (The whole `harvester-v3.03.02/` folder is 132, but 64 of those are the vendored `datapackmanager-1.21` framework - do **not** count the shared framework as a measure of gameplay-code granularity: 64 + 68 = 132.)
- **Comments:** `#` = ordinary comment/rationale (chatty, explains *why*); `#>` = labeled section header inside a file (e.g. `#> wheat`).
- **tellraw prefix format:** a JSON array - gray spacer → colored ` + `/` > ` glyph → brand-colored pack name → white ` >` → message. Example: `tellraw @a [{"text":"","color":"gray"},{"text":" + ","color":"green"},{"text":"Harvester","color":"gold"},{"text":" >","color":"white"},{"text":" Installed."}]`.

### 4.5 Config-trigger objectives

Player config uses `/trigger` objectives `z_<pack>_NNN_{t,f}`: `z_` sorts them to the bottom of tab-complete, `NNN` is a zero-padded setting id, `_t`=set-true/`_f`=set-false. One objective per (setting x direction). A poll loop reads them into `CONFIG$` fake-players and re-arms. See §8-adjacent detail in the Harvester dive (§7.7).

---

## 5. Language quirks & idioms

**(a) Version-integer encoding.** Versions are packed to sortable ints: `major*10000 + minor*100 + patch`. 1.21.9 → `12109`, 1.19.4 → `11904`. From 26.1 Minecraft numbers releases year.drop; those are stored as 1.<year>.<drop>, so 26.3 → `12603`, `.current.minor` holds the year (26) and `.current.patch` the drop (3). That keeps the value five digits and every `minor matches N..` gate true on 26.x; in-game the framework prints these as `26.3`. Datapacks use the same packing: v3.03.02 → `30302`. `minor` is *also* stored separately as a small int (`.current.minor = 21`) for range gates like `matches 14..15`. Comparisons: `matches 11904..` (>=1.19.4), `matches ..12005` (<=1.20.5), `matches 11904..12000`.

**(b) `execute if score ... = BOOL$... run` gating.** Nearly every conditional gates on a fake-player boolean or version range, stacking config + version + selector:

```mcfunction
execute if score VERSION$minecraft.current DatapackManager matches 11904.. \
  if score CONFIG$toolbreaking Harvester = BOOL$true DatapackManager \
  as @a[gamemode=survival,tag=HV_success] at @s run function harvester:root/damagetool
```

**(c) `align xz` + `positioned ~0.5`.** Snaps execution to block-grid center so detection is deterministic: `... at @s align xz positioned ~0.5 ~ ~0.5 run function harvester:root/inventory/hoe`. `align xz` floors X/Z to the grid; `~0.5` re-centers so integer offsets land on block centers.

**(d) `positioned ~N` fan-out for area patterns.** Grids are hand-unrolled - one `execute positioned` per cell, no marker entities, with an ASCII-art comment map:

```mcfunction
#   2
# 5 1 3
#   4
execute positioned ~ ~ ~  run function harvester:root/crops/filter
execute positioned ~1 ~ ~ run function harvester:root/crops/filter
```

`_pythontools/generate_positions.py` code-generates larger fan-outs (spherical shells) when too big to write by hand.

**(e) Marker/positioner entities (DD).** Dimensional Doors uses `armor_stand {Marker:1b, Invisible:1b}` at door-block center as portal markers holding tags + a `DD_doorID` score. Two markers sharing a `DD_doorID` *are* the teleport link. Markers can sit force-loaded in another dimension, which is what makes cross-dimension TP work. (Harvester, by contrast, uses *no* marker entities - pure `positioned` math.)

**(f) Schedule loops with isActive guards.** See §3.4 - same triple pattern (`body`/`start`/`stop`) in both packs, at varied cadences (Harvester main `2t`, configtriggers `4t`, eventlisteners `7t`; DD main `1t`, background `1s`).

**(g) The "not so random-iser."** `RAND$4` is a single global counter cycling 1→2→3→1, incremented at loop end and read during the same tick. It is deterministic and **per-tick-global** - every plot of every player in one tick sees the same value. Consequences: seed consumption (`if RAND$4 == 2`) and bonus XP (`if RAND$4 == 1`) are batchy and synchronized, not per-plot random. Named as a joke; don't mistake it for RNG.

**(h) Predicate-vs-fallback.** Where a whole feature is missing below a version, gate the modern path and provide an older fallback. Sneak detection: `matches 16..` uses `if predicate harvester:player_checkers/is_sneaking` (predicates arrived in 1.16); `matches 14..15` falls back to the `HV_sneak_time` cumulative-stat trick (the stat is a lifetime counter, reset every tick by GC, so `scores={HV_sneak_time=1..}` becomes a "sneaked last tick" test).

---

## 6. Cross-version compatibility system - **the most important section**

Both packs run on Minecraft 1.14 through 26.3 from a single codebase. This is achieved by a runtime version oracle plus a small set of dispatch idioms. Master this before touching anything.

### 6.1 The version oracle (`packages/versioning/`)

**Numeric encoding:** `major*10000 + minor*100 + patch`, zero-padded into 2-digit fields. `matches 12100..` = "1.21.0+", `matches ..12002` = "1.20.2 or earlier". The engine publishes four scores on `DatapackManager`: `VERSION$minecraft.current`, `.current.major`, `.current.minor`, `.current.patch`.

**The detection trick - canary + assignment.** Each `versions/<v>.mcfunction` is one version's detector. Line 1 is a **canary**: a command using a resource ID or syntax that only exists from that version onward. The remaining lines set the four scores.

```mcfunction
# versions/1.19.4.mcfunction
particle minecraft:sonic_boom ~ 0 ~ 0 0 0 1 1     # canary: only parses on MC >= 1.19
scoreboard players set VERSION$minecraft.current       DatapackManager 11904
scoreboard players set VERSION$minecraft.current.major DatapackManager 1
scoreboard players set VERSION$minecraft.current.minor DatapackManager 19
scoreboard players set VERSION$minecraft.current.patch DatapackManager 4
```

**Why it works:** Minecraft parses every line of a `.mcfunction` at load. If *any* line references an unknown resource / unparseable syntax, **the entire function is rejected and becomes a silent no-op** - so on MC < 1.19 the `sonic_boom` line fails to parse, the whole file drops, and the score is never set. The canary is the gate; the assignment is the payload. `give a ...` targets a nonexistent selector `a` on purpose (it only needs to parse); block canaries use `execute if block ~ ~ ~ ...` so nothing is placed.

**Fragility of a canary.** A canary is only reliable if its resource ID parses on its own version *and every newer version*. If Mojang later removes or renames a resource used as an existing canary, that detector line silently stops firing on the versions that relied on it - with no error and no log - and that version's score is never set. So canary choice is a long-lived maintenance commitment, not a one-off; see §10 step 1 for how to choose durable canaries and when to re-test.

**Canary catalogue** (first command of each `versions/*.mcfunction`; comment lines may precede it):

| File | Canary | Type |
|---|---|---|
| 1.14.4 | `particle minecraft:campfire_cosy_smoke ...` | particle |
| 1.15.2 | `particle minecraft:landing_honey ...` | particle |
| 1.16.5 | `particle minecraft:soul ...` | particle |
| 1.17.1 | `particle minecraft:glow_squid_ink ...` | particle |
| 1.18.2 | `give a minecraft:music_disc_otherside` | item |
| 1.19.4 | `particle minecraft:sonic_boom ...` | particle |
| 1.20.2 | `particle minecraft:cherry_leaves ...` | particle |
| 1.20.3 | `particle minecraft:white_smoke ...` | particle |
| 1.20.5 | `give a minecraft:armadillo_spawn_egg` | item |
| 1.21.2 | `give a minecraft:field_masoned_banner_pattern` | item |
| 1.21.4 | `execute if block ~ ~ ~ minecraft:pale_oak_log` | block |
| 1.21.5 | `particle minecraft:firefly ...` | particle |
| 1.21.6 | `execute if block ~ ~ ~ minecraft:dried_ghast` | block |
| 1.21.7 | `give a minecraft:music_disc_lava_chicken` | item |
| 1.21.9 | `particle minecraft:copper_fire_flame ...` | particle |
| 1.21.11 | `give a minecraft:wooden_spear` | item |
| 26.1 | `execute if block ~ ~ ~ minecraft:golden_dandelion` | block |
| 26.2 | `execute if block ~ ~ ~ minecraft:sulfur` | block |
| 26.3 | `execute if block ~ ~ ~ minecraft:poplar_log` | block |

Most of these canaries are particles - inherently more churn-prone than blocks/items. When you add new detectors, prefer durable resources (see §10 step 1).

### 6.2 The ascending "ratchet" dispatcher (`check.mcfunction`)

> **Same-name warning (read this before editing "versioning/check").** There are **two different files** both named `packages/versioning/check.mcfunction`, with identical basenames in different namespaces:
> - `data/datapackmanager-1.21/function/packages/versioning/check.mcfunction` - **this** file, the framework's **MC-version oracle** (detects which Minecraft you're on).
> - `data/<pack>/function/packages/versioning/check.mcfunction` (e.g. `harvester:packages/versioning/check`) - a completely unrelated file, the pack's **save-data migration ratchet** (§9).
>
> They do different jobs on different version axes. During a MC-version bump you want the `datapackmanager-1.21` copy; during a save-data migration you want the pack copy. Confirm the namespace of the file you opened before editing so you don't accidentally touch the wrong ratchet.

```mcfunction
scoreboard players operation VERSION$minecraft.current DatapackManager = VERSION$minecraft.backward DatapackManager
scoreboard players remove VERSION$minecraft.current DatapackManager 1     # prime to 11403 (below lowest)
execute unless score VERSION$minecraft.current DatapackManager matches 11404.. run function datapackmanager-1.21:packages/versioning/versions/1.14.4
execute unless score VERSION$minecraft.current DatapackManager matches 11502.. run function datapackmanager-1.21:packages/versioning/versions/1.15.2
...
execute unless score VERSION$minecraft.current DatapackManager matches 12109.. run function datapackmanager-1.21:packages/versioning/versions/1.21.9
execute unless score VERSION$minecraft.current DatapackManager matches 12111.. run function datapackmanager-1.21:packages/versioning/versions/1.21.11
execute unless score VERSION$minecraft.current DatapackManager matches 12601.. run function datapackmanager-1.21:packages/versioning/versions/26.1
execute unless score VERSION$minecraft.current DatapackManager matches 12602.. run function datapackmanager-1.21:packages/versioning/versions/26.2
execute unless score VERSION$minecraft.current DatapackManager matches 12603.. run function datapackmanager-1.21:packages/versioning/versions/26.3
```

Algorithm: seed `current = backward - 1`, then walk the table **ascending**. Each detector runs `unless current >= thisThreshold` - only while we haven't yet climbed to/past it. Each detector that *parses* bumps `current` to its own value; detectors for versions newer than the running game fail to parse and leave `current` unchanged. Net result: `current` ratchets up to the highest version whose canary parses = the running MC version.

**Drop granularity.** A release that adds no new parseable id cannot have its own leaf, so it reports as the newest leaf below it: 1.21.10 reports `12109`, 1.21.3 reports `12102`, and the 26.1.1 and 26.1.2 hotfixes report `12601`. The former `patch.mcfunction`, which overwrote every 1.21.9+ result with `12110`, was removed on 2026-09-25. Never gate on a hotfix level.

### 6.3 Bounds & activation

`initialize` sets `VERSION$minecraft.backward = 11404` (oldest supported) and `VERSION$minecraft.forward = 12603` (26.3, the newest leaf). Then `check` emits alerts and sets activation:

- `current < backward` → `alerts/minecraftnotcompatible` (red, hard-disable).
- `current > forward` → `alerts/minecraftunknownversion` (gold warning, still runs). Unreachable today, because `forward` equals the newest leaf and a newer client saturates there; it fires again once a sentinel leaf for the first unsupported version exists.
- `FLAG$isActive = true` **iff** `current >= backward`. On inactive, `initialize` stops the main loop.

### 6.4 Per-pack compatibility gate

Each pack declares its own window against the engine's detected `current`, with an override flag. From `harvester/packages/preinstaller/check.mcfunction`:

```mcfunction
scoreboard players set VERSION$minecraft.backward Harvester 11404
scoreboard players set VERSION$minecraft.forward  Harvester 12108
scoreboard players operation VERSION$ignorecompatibility.backward Harvester = BOOL$false DatapackManager
scoreboard players operation VERSION$ignorecompatibility.forward  Harvester = BOOL$true  DatapackManager   # tolerate newer MC
```

`ignorecompatibility.forward = true` is the knob that lets Harvester run on MC newer than its declared `forward` without throwing - relying on forward-compatible syntax. `harvester/packages/versioning/check.mcfunction` then throws `datapacknotcompatible`/`datapackunknownversion` only when out of window *and* the matching ignore flag is false.

### 6.5 The four runtime dispatch patterns

| Pattern | When to use | Example |
|---|---|---|
| **A - inline `execute if score ... matches` branches** | Two versions need different inline command text, same action | `damagetool.mcfunction`: `matches ..12004` reads `SelectedItem.tag.Damage`, else (`unless ..12004`, i.e. 1.20.5+) reads `components.minecraft:damage` (§6.9) |
| **B - per-version file variants + score dispatcher** | Divergent code too large to inline | `toolbreak.mcfunction` dispatches to `toolbreak-1.19` (old particle syntax) vs `toolbreak-1.20` (SNBT); `createlinkedconduit` splits 3 ways across the NBT→components evolution |
| **C - parse-failure isolation (call unconditionally)** | A resource ID simply doesn't exist below a version | DD `closermechanism/v1.mcfunction` calls `v1/1.16`, `v1/1.19`, `v1/1.20`, `v1/1.21` with **no guard**; older MC drops only the file whose block IDs it can't parse. The version-family filename is a comment-in-the-path, not read by any score. |
| **D - predicate-vs-command fallback** | A whole feature is missing below a version | sneak detection (predicate 1.16+ vs stat fallback); `sonic_boom` (1.19+) vs `explosion` fallback |

### 6.6 Behavioral (non-resource) version forks can be non-monotonic

The DD door closer (`closermechanism/main.mcfunction`) dispatches like this:

```mcfunction
execute if score VERSION$minecraft.current.minor DatapackManager matches 14..15 ... run function dimensionaldoors:root/closermechanism/v1
execute if score VERSION$minecraft.current.minor DatapackManager matches 16..20 ... run function dimensionaldoors:root/closermechanism/v2
execute if score VERSION$minecraft.current DatapackManager matches 12100..12103 ... run function dimensionaldoors:root/closermechanism/v2
execute if score VERSION$minecraft.current DatapackManager matches 12104..      ... run function dimensionaldoors:root/closermechanism/v1
```

From 1.16 to 1.21.3, `setblock` first rebuilds the placed door half from the other half's shape, so replacing the open lower half with a closed one comes back open and the command reports "Could not set the block"; those versions need the v2 destroy-and-rebuild. 1.14 to 1.15 and **1.21.4+** place the given state and use the simple v1 `replace`. Until 2026-09-25 the last line read `.minor matches 21..`, which sent 1.21.2 and 1.21.3 to v1, where doors never closed; the load test found it (1.21 and 1.21.1 report `.minor` 20 and were always on v2). **Key lesson: version behavior can regress and later be restored - `12104..` deliberately reuses the *older* v1 codepath. Never assume forks are monotonic, and let the load test tell you where a boundary really is.**

### 6.7 Cross-version text components

Text-component keys changed at 1.21.5 (`hoverEvent`→`hover_event`, `clickEvent`→`click_event`, `contents`→`value`, run_command `value`→`command`). The packs emit **both old and new keys in the same component object** (MC ignores unknown siblings) so one file renders on all versions:

```json
"clickEvent":{"action":"run_command","value":"/trigger z_hv_003_t"},
"click_event":{"action":"run_command","command":"/trigger z_hv_003_t"}
```

### 6.8 `pack_format` / MPP build metadata - a separate, load-time gate

`pack_format` decides "will MC agree to *load* this pack at all"; the canary engine (§6.1) decides "what version am I running." Two independent mechanisms.

- Active `pack.mcmeta` is renamed `pack.mcmeta.disabled`; MPP regenerates `pack.mcmeta` with a `supported_formats` range at export from `.mpp-datapack`. **With no active `pack.mcmeta`, MC will not load the pack at all** (see §10 step 9).
- `.mpp-datapack` holds `packFormatVersionMin/Max` (floats; `.1` = snapshot format). Harvester, Dimensional Doors and the templates `datapackmanager-mc1.21` and `datapackmanager-mc26.3`: `15..121` (26.3). Dimensional Doors was pinned at `48..48` until 2026-09-25. The `pack.mcmeta.disabled` files still say `pack_format` 15 (Harvester) and 48 (Dimensional Doors); see open decision 2 in `MAINTENANCE_LOG.md`.

### 6.9 Threshold inconsistencies to watch (real, in-code)

- **The tag→components cutoff is 1.20.5, everywhere.** Item components replaced the `tag` field in 1.20.5 (24w09a), and particle options became SNBT in 1.20.5 (Pre-Release 1). Until 2026-09-25 the packs disagreed: Harvester's `damagetool` read the old tag on `..12005` (so 1.20.5, and 1.21/1.21.1, which report 12005, read nothing), `toolbreak` switched particle syntax at `12000` (so 1.20.2 to 1.20.4 got the SNBT form and no particles), and DD switched its conduit data at `12003` (so 1.20.3 and 1.20.4 looked for components that did not exist). All of them now use `..12004` / `12005..`. There is still no global constant, so check every call site when a new format change lands.
- **Remember that 1.21 and 1.21.1 report `12005`** (decision 5 of the 2026-09-25 route-cleanup entry). Any branch that must tell 1.20.5/1.20.6 from 1.21/1.21.1 cannot use the score and has to carry both formats (Harvester's `item_modifier/1.20.5/*` carry both `enchantment` and `enchantments`), and `.minor` is 20 on those clients, so DD closes doors with the v2 closer there.
- `createlinkedconduit.mcfunction` splits at `..12004`, `12005..12104` (components, names and lore as JSON strings) and `12105..` (text components as SNBT, 1.21.5).
- `doortagger.mcfunction` even carries a `minor matches 13` branch below the official `backward=11404` (dead-ish legacy; shows the author's habit of keeping old branches).

---

## 7. Harvester deep dive

Root: `harvester-v3.03.02/data/harvester/function/`.

### 7.1 Runtime flow - `root/loops/main.mcfunction` (every 2 ticks)

One iteration, in order:
1. **Sneak detection** (version-gated): `matches 16..` → `compatibility/is_sneaking` (predicate); `matches 14..15` → `HV_sneak_time` stat fallback. Both end `align xz positioned ~0.5 ~ ~0.5 run function harvester:root/inventory/hoe`.
2. **Sweep feedback** - `as @a[tag=HV_success] at @s run function harvester:effects/sweep`.
3. **Tool damage** (1.19.4+ & `CONFIG$toolbreaking`) - two commands (survival, adventure; a selector holds only one `gamemode=`), `tag=HV_success`.
4. **Garbage collection** for all players.
5. **Randomiser** - `RAND$4` +1, wrap at 4→1.
6. **Self-reschedule** if `LOOP$main.isActive`.

### 7.2 Hoe detection & tiering

`root/inventory/hoe.mcfunction` tags `@s` by `SelectedItem.id` (one line per tier: `HV_wood/stone/copper/gold/iron/diamond/netherite`), collapses to `HV_isHoldingHoe`, then `hoe2` classifies range + seeds and gates on `x_rotation=0..90` (must be aiming at the ground). **`minecraft:copper_hoe` has been a vanilla item since 1.21.9 (durability 190); the branches predate that for the tinkererscraft copper hoe. Treat it as a first-class tier throughout - preserve its branches.**

`root/inventory/range.mcfunction` maps tier → area:

| Hoe | Area tag | Plots |
|---|---|---|
| wood | HV_1x1 | 1 |
| stone | HV_3x3_star | 5 |
| copper/gold/iron | HV_3x3 | 9 |
| diamond | HV_5x5_star | 21 |
| netherite | HV_5x5 | 25 |

Only diamond/netherite also get `HV_nether` (nether-wart capability).

### 7.3 Positioner grid - `root/positioner/*`

Pure nested `execute positioned` fan-out; **no marker entities.** `filter.mcfunction` picks the grid by area tag and handles a farmland-height quirk: farmland is 15/16-block tall, so a player on an adjacent full block stands one layer too high - `unless block ~ ~ ~ minecraft:farmland` drops the origin `~-1`. Each grid file fans out to `root/crops/filter`.

### 7.4 Crop harvest+replant - `root/crops/filter.mcfunction` + one file per crop

`filter` checks one block up (`~ ~1 ~`) for a fully-grown crop (`wheat[age=7]`, `beetroots[age=3]`, `nether_wart[age=3]` requires `HV_nether`). Each crop file is structurally identical:

```mcfunction
execute if entity @s[tag=HV_wheat]  run setblock ~ ~1 ~ minecraft:wheat[age=0] destroy   # harvest+replant
execute if entity @s[tag=!HV_wheat] run setblock ~ ~1 ~ minecraft:air destroy            # no seed → just break
execute if entity @s[tag=HV_wheat]  run function harvester:effects/xporb
execute if entity @s[tag=HV_wheat] if score CONFIG$harvestxpbonus ... if score RAND$4 ... matches 1 run function harvester:effects/xporb
execute if entity @s[tag=HV_wheat] if score RAND$4 ... matches 2 run clear @s minecraft:wheat_seeds 1
tag @s[tag=HV_wheat] add HV_success
```

Key primitive: `setblock ... age=0 destroy` drops the crop's loot (yield) *then* places age-0 (instant replant). Seed possession (tag set by `inventory/seeds` scanning full `Inventory`) decides replant vs bare break. Seed cost and bonus XP are `RAND$4`-gated (batchy/global - §5g).

### 7.5 Tool damage - hand-rolled durability + Unbreaking

`root/damagetool.mcfunction` reads current damage (version-split at 1.20.5: `tag.Damage` on `..12004`, `components.minecraft:damage` after), subtracts hardcoded max durability by tier (wood 59, gold 32, stone 131, **copper 190**, iron 250, diamond 1561, netherite 2031; iron was 251 until 2026-09-25, which made iron hoes unbreakable), decrements 1. `damagetool2` writes it back as a x1e6 fixed-point fraction, aimed half a durability point low because `set_damage` floors a float and an exact fraction could round back to the old damage (a float32 simulation of every tier and damage value found skipped damage on copper, iron, diamond and netherite without the offset, none with it). Four modifiers `unbreaking{0..3}` replicate vanilla Unbreaking probability `1/(level+1)`: all four run, at most one matches, and on a failed chance the `item modify` no-ops. The modifier format changed three times, so there are four sets, each called from its own `compatibility/setdamage-<version>` function:

| Set | Minecraft | Enchantment check | Loot function format |
|---|---|---|---|
| `item_modifier/unbreaking*` | 1.19.4 to 1.20.4 | top-level `enchantments: [{enchantment, levels}]` | `function`, `conditions` list, score `scale` |
| `item_modifier/1.20.5/*` | 1.20.5 to 1.21.1 | `predicates.minecraft:enchantments`, with both `enchantment` (1.20.5) and `enchantments` (1.21) | same |
| `item_modifier/1.21.2/*` | 1.21.2 to 26.2 | `predicates.minecraft:enchantments` with `enchantments` | same |
| `item_modifier/26.3/*` | 26.3 and later | same, under the entity predicate key `minecraft:equipment` | `type`, one `condition` (`all_of` for two), `div(from_int(score), 1000000.0)` |

Before 2026-09-25 only the first set existed. On 1.20.5 and later the top-level `enchantments` field is unknown, so Unbreaking was ignored and every hoe lost durability on about three harvests in four; on 26.3 the files do not load at all.

`effects/toolbreak.mcfunction` version-splits particle syntax at 1.20.5 (`11904..12004` old `particle minecraft:item minecraft:wooden_hoe`, `12005..` SNBT `particle minecraft:item{"item":...}`); the 1.20 branch peels copper into `toolbreak-copper.mcfunction`.

### 7.6 `HV_success` semi-persistent tag

Set on a real harvest; consumed once by sweep and once by tool damage (so **damage is per-tick, not per-plot** - 25 plots cost the same 1 durability as 1); cleared by GC. Lives only within a single loop tick.

### 7.7 Config-trigger system (5 places to touch per setting)

`z_hv_NNN_{t,f}` (`001` and `CONFIG$harvestxp`, `002` and `harvestxpbonus`, `003` and `toolbreaking`). The `configtriggers` loop (4t) reads fired triggers into `CONFIG$` fake-players (per-pack, server-wide - last writer wins) then calls `reset` to re-render + re-arm. **Adding a setting touches:** `defaultconfig`, `configtriggers/{create,destroy,enable,disable,reset}`, the `configtriggers` loop, `events/command/config` (menu row, both JSON dialects), plus an `updates/vX` migration to seed it for existing installs.

### 7.8 Version seams to watch (Harvester)

predicate availability (16), `/item` (11904), Damage NBT vs components (`..12004`/`12005..`), item modifier format (`..12004`, `12005..12101`, `12102..12602`, `12603..`), toolbreak particle syntax (`11904..12004`/`12005..`), sweep particle (`..15`/`16+`), sneak method (14 to 15 stat, 16 to 26.2 predicate `player_checkers/is_sneaking`, 26.3+ predicate `26.3/player_checkers/is_sneaking` because 26.3 renamed the predicate type key `condition` to `type`).

### 7.9 Dead code / gotchas

- `predicate/player_checkers/is_sneaking_.json` (trailing underscore, `is_sneaking:false`) is referenced nowhere. On 26.3 it, the 1.16 sneak predicate and the older item modifiers fail to load and log an error; that is the same parse-isolation trade-off as a version probe, not a defect.
- Copper hoe branches thread through tiering, range, durability (190), toolbreak particles - don't drop them when refactoring.
- `root/inventory/hoe` runs once per sneaking player. It tags and continues only `@s`; until 2026-09-25 it tagged `@a` and re-ran `hoe2` for every player already tagged that tick.
- `RAND$4` is deterministic per-tick-global, not per-plot.

---

## 8. Dimensional Doors deep dive

Root: `dimensionaldoors-v3.02.01/data/dimensionaldoors/function/`.

### 8.1 State model

No custom dimensions or storage. **Portal markers** = `armor_stand {Marker:1b, Invisible:1b}` at door-block center, tagged `["DimensionalDoors","DD_portal","DD_<wood>","DD_particle_X","DD_new","DD_close"]`. **Link key** = `DD_doorID` score; entrance and exit sharing a `DD_doorID` are linked. Global allocator `DD$doorID.current` on objective `DD_doorID`. Cooldown objective `DD_warpcooldown`. Role tags `DD_entrance`/`DD_exit`, orientation `DD_NS`/`DD_EW` + hinge `DD_left`/`DD_right`, particle-window class `DD_particle_A/B/C/D`.

### 8.2 Two loops

- **Main (`root/loops/main.mcfunction`, 1t):** ambient particles; broken-door detection; **warp detection** (heavily pre-filtered: only `DD_portal` on an open door with a non-portal entity within 3 blocks → `detection/positioner`); close flagged doors; reset closed-door timers.
- **Background (`root/loops/background.mcfunction`, 1s):** conduit→door creation **gated on `advancements={dimensionaldoors:adventure/find_conduit=true}`** (no conduit scanning until someone has ever held a conduit); auto-close scan; cooldown decrement.

### 8.3 Door creation & linking

`root/create/conduitdetection.mcfunction` (background) - **ordering is load-bearing** (linked-conduit check must precede new-door check, per its comment). Linked conduit (custom-data `DD_Linked:1b`) on an open door → `createlinkeddoor`; plain conduit → `createnewdoor`. Version-split on NBT container (`Item.tag` `..12004` vs `Item.components.custom_data` `12005..`; the split sat at 1.20.3 until 2026-09-25, which broke linking on 1.20.3 and 1.20.4).

`createnewdoor` summons the marker, allocates a new global ID, runs `setupentrance`, spawns the entangled conduit item stamped with the ID, consumes the source. `createlinkeddoor` runs `setupexit`, copying the ID off the thrown entangled conduit. `setupentrance`/`setupexit` also `forceload add ~ ~` (keeps the exit chunk loaded for cross-dimension TP) and grant advancements.

### 8.4 Why per-wood + per-version files exist

**Per-wood:** `setblock` requires a *literal* block id + full blockstate - you cannot parameterize the wood. So each wood needs its own file enumerating all 8 facingxhinge combos. `summon/door.mcfunction` also assigns each wood a hardcoded `DD_particle_X` window class. **Adding a new wood door means editing >=3 places:** `summon/door/<ver>.mcfunction` (portal + particle class), `closermechanism/v1/<wood>` + `v1/<ver>` dispatch, and `closermechanism/v2/<wood>` + `v2/<ver>` dispatch. Miss any and the door won't portal or won't close.

**Per-version (`1.16/1.19/1.20/1.21/1.21.4/26.3` subfiles):** each lists only the doors that MC version introduced, called *unconditionally* (Pattern C) - older MC drops the files whose block IDs it can't parse. `door/1.16` = crimson/warped, `door/1.19` = mangrove, `door/1.20` = cherry/bamboo, `door/1.21` = copper family, `door/1.21.4` = pale_oak, `door/26.3` = poplar. **One release's ids per file:** a single unknown id drops the whole file, so when pale oak shared `door/1.21` with the copper doors, copper doors could not become portals or close on 1.21 to 1.21.3. Poplar uses window class D until someone checks its texture in game.

**Why v1 vs v2 closer:** see §6.6 - v2 (1.16 to 1.21.3) destroys the lower half and rebuilds the upper (plus `kill @e[...name="Oak Door"...Age:0s]` to remove the popped item); v1 (1.14 to 1.15, 1.21.4+) does a clean `setblock replace`. In v2 the upper-half `setblock` must stay conditional on the lower half it belongs to: a door's lower half copies its upper half on the shape update, so the eight unconditional upper-half lines that shipped until 2026-09-25 turned every closed door to face west with a right hinge. The item names in the v2 `kill` lines must match the dropped item exactly (`Waxed Copper Door` was `Copper Door`, and pale oak had no `kill` line, until 2026-09-25).

**Naming trap:** v1 copper files use underscores (`exposed_copper.mcfunction`); v2 uses concatenation (`exposedcopper.mcfunction`). The dispatchers must match their tree's literal exactly.

### 8.5 Teleport flow

`detection/positioner` probes 10 sample points across the door plane (offset by hinge) → `portal.mcfunction` tags nearby non-cooldown entities `DD_enter` → `activation/main`. The debug visualiser in `portal` calls `compatibility/debug/samplepoint` rather than drawing `small_flame` itself: that particle only exists from 1.17, and inline it made `portal` fail to load on 1.14 to 1.16, so no door ever teleported there (fixed 2026-09-25). `activation/main` tags the portal `DD_close`, determines direction by the portal's own role (entrance tags `DD_enter+`, exit tags `DD_enter-`), dispatches `entrance_to_exit`/`exit_to_entrance`, applies cooldown, clears transient tags. The actual TP matches entrance and exit by equal `DD_doorID` and `tp`s the player to the paired marker (works cross-dimension because markers are force-loaded). **404 handling:** no matching exit → `DD_door404` → `portaldisplacement` (`spreadplayers` scatter) instead of teleport. A thrown linked conduit into a live entrance tags the portal `DD_destroy` (self-destructs).

### 8.6 Destroy path

`destroy/filter` tags portals whose block is no longer a door `DD_destroy`, propagates to all doors sharing the `DD_doorID` (using `sort=furthest` - **not `distance=`, which would filter to same dimension**), runs `handler` (explode via `effects/destructiveexplosion` or `nondestructiveexplosion` per `CONFIG$destroyexplosively`, `forceload remove`, kill marker). Fireball summon NBT is version-split (`{direction,Fire}` 1.14 to 15 vs `{Motion,Invulnerable}` 1.16+).

### 8.7 Effects & version splits

`flash` particle gained a mandatory `color` field at 1.21.9 → `12109` split everywhere (`compatibility/flash` vs `flash-1.21.9`). `sonic_boom` only >=1.19 (else `explosion` fallback). Ambience particle volume increases on 1.14 to 15 (underwater particles vanish instantly there).

### 8.8 Config

`z_dd_001` (destroy explosively), `z_dd_002` (performance), `z_dd_003` (disable particles) → `CONFIG$destroyexplosively/performance/disableparticles`.

---

## 9. Self-update / migration system (per-pack save-data upgrades)

This is a **second version axis**, independent of MC-version compat. It migrates a player's world across *pack* versions.

> **Same-name warning:** the file that drives this - `data/<pack>/function/packages/versioning/check.mcfunction` (e.g. `harvester:packages/versioning/check`) - has an **identical basename** to the framework's MC-version oracle at `data/datapackmanager-1.21/function/packages/versioning/check.mcfunction` (§6.2). Same name, different namespace, completely different job. Editing the version-detection ratchet? Open the `datapackmanager-1.21` copy. Editing this save-data migration ratchet? Open the pack copy. Confirm the namespace before you type.

- `VERSION$datapack.current` = version of the currently loaded pack files (hardcoded in `preinstaller/check`, e.g. `30302`).
- `VERSION$datapack.latest` = version last *installed/migrated to* (persists in the world).

`packages/versioning/check.mcfunction` (the **pack** copy) is a **ratchet of `unless matches N..` guards** run ascending; each `updates/vN` runs only if `latest < N` and its last act sets `VERSION$datapack.latest N`, so the chain walks forward exactly once through every intermediate version, then clamps to `current`:

```mcfunction
execute unless score VERSION$datapack.latest Harvester matches 20000.. run function harvester:packages/versioning/updates/v2.00.00
execute unless score VERSION$datapack.latest Harvester matches 30100.. run function harvester:packages/versioning/updates/v3.01.00
execute unless score VERSION$datapack.latest Harvester matches 30301.. run function harvester:packages/versioning/updates/v3.03.01
execute unless score VERSION$datapack.latest Harvester matches 30302.. run scoreboard players set VERSION$datapack.latest Harvester 30302
```

Each `updates/vX` is idempotent, logs a `@a[tag=hv_debug]` trace, sets `.latest`, purges the previous version's leftover objectives/tags, and seeds any new config. Notable history: a v3 rename from single-letter `H_` tag prefix to `HV_` (migrations purge the stale `H_` names); v3.01.00 kills the legacy `$h.version`/`$api.tc.h TP_version` scheme after bridging it; v3.03.01 is the canonical "I added a config option, seed it for existing installs" pattern (`CONFIG$... = BOOL$...` + `configtriggers/create`). A **downgrade** (`current < latest`, world touched by a newer pack than the files now loaded) throws `datapackunknownversion` and deactivates.

First-time install detection uses the shared magic number: `execute unless score FLAG$secret <Pack> = FLAG$secret DatapackManager run <install>` then latch the number in - distinguishes fresh install from `/reload`.

**Known bug in migrations:** the `updates/vX` files of the consumer packs called `datapackmanager-1.21:packages/effects/ui_jingle`, but the real function is `packages/effects/ui/jingle` (slash, not underscore), a silent dead reference. Fixed in Harvester and Dimensional Doors on 2026-09-25; the other consumers still carry it. Note that the migrations run from the scheduled listener with no executing entity, so `ui/jingle` (which plays to `@s`) is silent there too, exactly as in the template's example update.

**Testing note:** because the working tree ships no active `pack.mcmeta`, you cannot test any migration in-game until you MPP-export first (see §10 step 9). No `pack.mcmeta` = the pack never loads = the migration ratchet never runs.

---

## 10. Playbook: updating to a new Minecraft version

Concrete ordered checklist. Say the new version is **26.4 = `12604`** (year.drop releases are stored as 1.<year>.<drop>, see §5a). Do every framework step in the **canonical template**, then propagate to **every embedded copy** of `datapackmanager-1.21` (Harvester + DD + any other pack) so they stay byte-identical (see step 8).

**1. Pick and verify a canary.** Find a resource ID or syntax that exists in 1.22.0 but *not* 1.21.x. **Prefer a durable resource** - a newly added **solid block or item** is ideal; **avoid particles and anything easily renamed/removed**, because the whole detector depends on that ID continuing to parse on 1.22.0 *and every newer version* (§6.1). Confirm it genuinely fails to parse on the older version (its own line drops the whole file). **Maintenance risk to record:** if Mojang later removes or renames a resource used as an *existing* canary, that version's detector line silently stops setting its score and detection for that version breaks with no error - so whenever a canary's underlying resource changes, re-test old-version detection for every affected line.

**2. Create `packages/versioning/versions/26.4.mcfunction`** (name the file after the release, as `1.21.9` and `26.3` are):
```mcfunction
# probe: <block> was added in 26.4
execute if block ~ ~ ~ minecraft:<new_block_from_26.4>
scoreboard players set VERSION$minecraft.current DatapackManager 12604
scoreboard players set VERSION$minecraft.current.major DatapackManager 1
scoreboard players set VERSION$minecraft.current.minor DatapackManager 26
scoreboard players set VERSION$minecraft.current.patch DatapackManager 4
```
The canary **must be the first command** (comment lines may precede it) and the file must contain nothing but the probe and the four `set`s. Never add non-probe logic to a `versions/*` file.

**3. Register it in `check.mcfunction`** (the `datapackmanager-1.21` MC-version copy, *not* the pack save-data copy, §6.2/§9), appended in ascending order after the `26.3` line:
```mcfunction
execute unless score VERSION$minecraft.current DatapackManager matches 12604.. run function datapackmanager-1.21:packages/versioning/versions/26.4
```
There is no trailing `patch` line any more; a release without a new id simply reports as the leaf below it (§6.2).

**4. Bump forward bounds.** In `datapackmanager-1.21/.../root/core/initialize.mcfunction` set `VERSION$minecraft.forward ... 12604`. In each pack's declare file (`harvester/packages/preinstaller/check.mcfunction`, DD equivalent) bump `VERSION$minecraft.forward <PackId>` and decide `ignorecompatibility.forward` (Harvester is already `true`). Then run `python _pythontools/reference_check.py datapackmanager-mc1.21` and `python _pythontools/format_check.py`, and regenerate the 26.3 generation (§11).

**5. Add resource-existence variants (Pattern C) for anything new the update introduces:**
- **New wood/door types (DD):** new `closermechanism/v1/1.22.mcfunction` + `v2/1.22.mcfunction` (+ per-wood files, minding the v1-underscore/v2-concatenated split), called unconditionally from `v1.mcfunction`/`v2.mcfunction`; new `datatagging/summon/door/1.22.mcfunction` (with the correct `DD_particle_X` class) called from `door.mcfunction`. **Verify which `minor` range the new version falls into in `closermechanism/main.mcfunction` - check whether `setblock replace` still closes doors cleanly (v1) or regressed (v2). Do not assume.**
- **New harvester tool tiers:** new particle/`toolbreak-*` variant + durability constant.

**6. Handle any syntax break the update introduces** (like the 1.20.5 tag→components, 1.21 namespaced components, 1.21.5 event-key rename, 1.21.9 particle color). Add a Pattern-A score-gated branch or a new `compatibility/<feature>-1.22.mcfunction` at *every* affected call site - grep for the old syntax to find them all (thresholds are hand-tuned per file; there is no global constant - §6.9). Keep emitting both old+new text-component keys. **JSON data files cannot branch**: when a predicate, item modifier or advancement format changes, add a version-named copy and call it from a version-named function (Harvester's `compatibility/setdamage-<version>` and `is_sneaking-26.3` are the pattern), because the old file stops loading on the new version and the new one does not load on the old.

**7. Update MPP metadata.** Raise `packFormatVersionMax` in every `.mpp-datapack` (with `.N` snapshot suffix if targeting snapshots), update `minecraftVersion`, and bump `pack_format` in `pack.mcmeta.disabled` only if you also raise the minimum. Re-export via MPP to regenerate `pack.mcmeta` with the widened `supported_formats`.

**8. Propagate framework changes from the canonical template, then verify byte-identical copies.** There is one source of truth for the framework: the standalone template directory **`datapackmanager-mc1.21/`** at the repo root (the full reference implementation; the Project Creator / Framework Updater treat it as canonical). **Do NOT hand-edit the vendored `data/datapackmanager-1.21` copies first**, and do NOT edit one pack's copy and call it done. Workflow:
  - a. Make every framework edit (steps 1 to 4, 6) in the canonical template `datapackmanager-mc1.21/` only.
  - b. Run the Python **Framework Updater** (§12), which hash-diffs the template against each pack's `data/datapackmanager-1.21` (plus `data/datapackmanager`, `data/minecraft`) and propagates changes into all consumers while preserving their gameplay code.
  - c. **Verify the copies actually landed byte-identical** - e.g. `diff -r` (or compare per-file SHA-256) between the template and every vendored tree, so no pack is left on a stale framework generation. Editing only the standalone template does nothing to shipped packs (§13.2); skipping this verify step is how vendored copies silently drift out of lockstep.
  - d. Then bump each pack's `VERSION$datapack.current` and add an `updates/vX` migration **only if** save-data layout changed.

**9. Export via MPP first - the working tree does NOT load as-is - then test on the real new version AND at least one old version** (e.g. 1.14.4). Both packs ship only `pack.mcmeta.disabled` and have **no active `pack.mcmeta`**, so Minecraft will silently refuse to load the repo working tree at all: no `pack.mcmeta` means the pack never loads, `#load` never fires, and the version-detection engine never runs - you'd be "testing" a pack that isn't installed. You **must** run an MPP export first (which regenerates `pack.mcmeta` from `.mpp-datapack`) to produce a loadable pack before *any* in-game test. Then confirm the new canary parses only where intended, no shared file broke from an unguarded new-syntax line, doors close correctly, and harvest/tool-damage still work.

**The load test does most of this for you.** `python _pythontools/verify_build.py --load --accept-eula` builds the release packs the way the zips are laid out, starts a headless server from every client jar in `.minecraft/versions` that `_pythontools/load_test.json` lists, and fails on any load error outside a resource's declared version window, on a wrong `VERSION$minecraft.current`, on an inactive pack, or on a failed smoke scenario (§12). For a new Minecraft version: install it in the launcher once (so its jar and libraries exist), add it to `load_test.json` with the value the new leaf should produce, add version windows for the new version-isolated files, and run it. It still does not replace a look in game with a real player: sneak harvesting, the config menu and particles need one.

**Mental model:**
- "Does this ID/syntax exist yet?" → isolate into a version-named file, call it unguarded (C).
- "Same action, different command text per version?" → inline `execute if score ... matches` (A) or split files with a score dispatcher (B).
- "Whole feature missing below version?" → predicate/command fallback (D).
- "Behavior changed then changed back?" → non-monotonic `minor` ranges are allowed (v1/v2/v1).

---

## 11. Framework generations (`datapackmanager-1.21` and `datapackmanager-26.3`)

The framework namespace carries a generation label. Two generations exist at the repo root with identical content:

- `datapackmanager-mc1.21/` (namespace `datapackmanager-1.21`, alert label `mc1.21`) is the canonical template. Every framework edit is made here. It is what the six consumer packs vendor today.
- `datapackmanager-mc26.3/` (namespace `datapackmanager-26.3`, alert label `mc26.3`) is derived from the template by `_pythontools/derive_generation.py`, which renames the framework folder and rewrites every namespace reference and label. Never edit it by hand: regenerate it, and run the script with `--check` to prove it has not drifted.

```bash
python _pythontools/derive_generation.py datapackmanager-mc1.21 datapackmanager-mc26.3
python _pythontools/derive_generation.py datapackmanager-mc1.21 datapackmanager-mc26.3 --check
```

Moving a consumer onto the 26.3 generation means replacing its vendored `data/datapackmanager-1.21` tree with `data/datapackmanager-26.3`, rewriting every `datapackmanager-1.21:` reference in the consumer's own functions and in `load.json`, and re-exporting. Until that is done the consumer keeps running the 1.21 generation, which supports the same Minecraft range once re-vendored from the template. Two generations installed in one world both run, because this framework has no arbitration between generations (the rebuilt core in `datapackmanager-core/` does), so migrate every pack in a world together. Before 2026-09-25 the 26.x fork (`datapackmanager-mc26.1/`) was a directory rename with all 65 internal references still pointing at `datapackmanager-1.21`; the derivation script exists so that cannot happen again.

---

## 12. Tooling (`_pythontools/`)

- **`datapack_manager_tool.py`** - the (being-sunsetted) Tkinter GUI. Six tabs; the important ones: **Tag Analyzer** parses exactly the `z_xx_###_t/f` / `XX_` / `XX$` conventions (it is the enforcement mechanism for §4's naming rules); **Project Creator** bootstraps a new pack from the canonical `datapackmanager-mc1.21` template, string-replacing `mydatapack`→namespace and `MD`→2-letter tag; **Framework Updater** hash-diffs the framework folders (`data/datapackmanager-1.21`, `data/datapackmanager`, `data/minecraft`) from the canonical template into targets, preserving user code and rewriting `mydatapack:` refs. This is the tool that keeps every vendored copy byte-identical (§10 step 8). Superseded by M++.
- **`reference_check.py`** resolves every function reference in a pack (functions, tags, advancement rewards) and exits 1 on a dead one; `--orphans` lists functions nothing calls. Run it after any framework change.
- **`format_check.py`** enforces one line-ending style per file, no trailing whitespace, one final line break, no runs of blank lines, and two-space JSON; `--fix` rewrites in place.
- **`derive_generation.py`** derives `datapackmanager-mc26.3` from the canonical template (§11); `--check` reports drift.
- **`verify_build.py`** is the build gate: format, reference and derivation checks over the framework trees, `_pythontools` and the release packs, plus the load test with `--load --accept-eula`. Run it before every commit that touches a pack and before every export.
- **`load_test.py`** is the real load test. Per Minecraft version in `load_test.json` it builds the release packs into a fresh flat world (pack.mcmeta from pack.mcmeta.disabled, and with the default dual layout the plural folders the old zips carry), starts `net.minecraft.server.Main` (MinecraftServer on 1.14 and 1.15) from the installed client jar with the launcher's own Java runtime, offline and bound to 127.0.0.1, and checks:
  - every load error in the log, attributed to a pack resource, against that resource's version window in `load_test.json` (first matching rule wins; `{name}` is the version in the resource's own name; no rule means it must load everywhere); an error it cannot attribute fails the run;
  - the golden `VERSION$minecraft.current` for that version and its `.major/.minor/.patch`, `FLAG$isActive`, `COUNT$datapacks`, and each pack's `FLAG$isActive` and `VERSION$datapack.latest`;
  - the smoke scenarios in `load_test_scenarios/`: Harvester harvests a plot through the positioner and writes tool damage twice through the version's item-modifier set; Dimensional Doors creates, links, closes (orientation checked), teleports an armor stand, and destroys two pairs in one tick.
  Starting a server accepts the Minecraft EULA, so it needs `--accept-eula` or `MINECRAFT_ACCEPT_EULA=1`. Each server runs in a Windows job object, so killing the script kills the server. Logs and a JSON report per version land in `%TEMP%/datapacks-load-test/<timestamp>/logs`. A full run over 20 versions takes about 22 minutes; `--quick` runs five boundary versions. Scenario commands must work on every version they run on: `setblock` cannot open or close one half of a door before 1.21.4 (it recomputes the half from the other one), and 1.21.11 renamed the game rules (`randomTickSpeed` became `random_tick_speed`).
- **`generate_positions.py`** - code-gens spherical-shell `execute positioned ~x ~y ~z if block ... run function ...` lines (for hand-unrolled fan-outs too large to write manually).
- `dmtool_settings.ini` - gitignored (local paths). Reveals the old numbered-stage layout (`1. released/` ... `6. archived/`) now replaced by `_`-prefixed folders + M++ `tags`.

---

## 13. Gotchas, footguns & fragile spots

Ranked roughly by likelihood-to-bite on a future MC version.

1. **Version detection is the linchpin.** Every branch in both packs reads `VERSION$*` set by the vendored framework. A new MC version is *unknown* until you add a probe file. First step of any update is always: add a canary - and prefer a durable block/item, not a churn-prone particle (§10 step 1). If you forget, `check.mcfunction` throws "not compatible"/"unknown version" and the pack may deactivate.

2. **The framework is vendored, not shared.** Every fix must be made in the canonical template `datapackmanager-mc1.21/` and propagated to every pack's copy via the Framework Updater; they must stay byte-identical (verify with a diff/hash - §10 step 8). Editing only the standalone `datapackmanager-mc1.21` template does nothing to the *shipped* packs until you propagate.

3. **Two same-named `versioning/check.mcfunction` files.** One in `datapackmanager-1.21` (MC-version oracle, §6.2) and one per pack (save-data migration ratchet, §9). Identical basename, different namespace, unrelated jobs - confirm the namespace before editing.

4. **The v1/v2 door-closer boundary is a hardcoded behavioral assumption.** `current matches 12104..` → v1 is a catch-all; if a future MC re-breaks `setblock replace` on doors, it will silently leave doors open. The Dimensional Doors smoke scenario closes three doors and checks their state on every tested version, so run the load test on each new version before trusting the boundary.

5. **Adding a new wood/door type needs edits in >=3 files** with the v1-underscore/v2-concatenated naming split. Easy to miss one and get doors that won't portal or won't close.

6. **NBT/component dialect churn.** `Item.tag` (`..12004`) vs `components.custom_data` (`12005..`); `Count`→`count` (1.20.5); unprefixed→`minecraft:`-prefixed keys; stringified-JSON text→SNBT text components (1.21.5); and the `SelectedItem.tag.Damage`→`components.minecraft:damage` split. Every call site in Harvester and DD agrees on 1.20.5 since 2026-09-25 (§6.9), but there is no single constant: grep every call site on the next format change. Mojang keeps churning item components.

7. **Particle name/arg churn** has already bitten twice (`flash` gained mandatory `color` at 1.21.9; `sonic_boom` only >=1.19). Particle failures don't halt execution - they silently produce no visual + log spam, so they're easy to miss in testing. This is also why particles make poor version canaries.

8. **Marker-armor_stand assumptions (DD).** v2 door cleanup relies on `kill @e[...name="Oak Door"...nbt={Age:0s}]` - matching the item's *display name* and `Age` NBT. If item names (localization) or `Age` change, v2 leaks dropped door items. `@e[name="Conduit"]` in conduitdetection depends on the vanilla conduit's default name.

9. **`#minecraft:doors` blockstate assumptions.** Positioner sampling and every closer `setblock` assume `open/facing/hinge/powered/half` blockstates. Any blockstate rename breaks both.

10. **`spreadplayers` / `forceload` / `schedule` signatures** are unguarded - the whole loop engine and cross-dimension mechanism depend on them. A signature change would be catastrophic.

11. **Text components** - the dual `hoverEvent`/`hover_event` (and `clickEvent`/`click_event`) blocks are the mass-edit target if a future MC *removes* the legacy camelCase form. Note they only appear on tellraws that actually use hover/click (e.g. `harvester packages/events/command/config.mcfunction`, 6 occurrences), not on plain-text notifications (§3.8).

12. **Known dead references in the consumer packs:** Harvester and Dimensional Doors were re-vendored and cleaned on 2026-09-25 and report 0 unresolved references and 0 orphans. The other four framework consumers still carry the baseline framework's `root/commands/config-`/`uninstall-` calls and the `ui_jingle` migrations. `predicate/player_checkers/is_sneaking_.json` in Harvester is unused. Missing-function calls are silent no-ops, so these are harmless but should be removed.

13. **`RAND$4` is deterministic and per-tick-global**, not per-plot random - seed consumption and bonus XP are synchronized across all plots/players in a tick. Don't "fix" this expecting per-plot behavior without understanding the design.

14. **Data-file formats changed in 26.2 and 26.3.** 26.2 turned entity predicates into a component-style map (`type` became `minecraft:entity_type`, unknown keys are rejected); 26.3 renamed the predicate type key `condition` to `type`, the loot-function key `function` to `type`, `conditions` (list) to `condition` (one predicate), and split number providers into int and float kinds with no `scale` on `minecraft:score`. Any JSON predicate, item modifier or loot table written for 26.2 or earlier fails to load on 26.3. See §10 step 6 and Harvester's `26.3` folders.

15. **1.21.10 reports as 1.21.9 (`12109`).** It added no parseable id, so it shares the 1.21.9 leaf; 26.1.1 and 26.1.2 likewise report as 26.1. The former `patch.mcfunction`, which reported both 1.21.9 and 1.21.10 as `12110`, is gone. If you ever need to branch on a hotfix you cannot, short of finding an id it introduced.

16. **The working tree isn't loadable.** Both packs ship only `pack.mcmeta.disabled` - with no active `pack.mcmeta`, Minecraft silently won't load the pack and none of the above ever runs. Always MPP-export before any in-game test (§10 step 9, §9); `load_test.py` builds its own loadable copy for its test servers.
