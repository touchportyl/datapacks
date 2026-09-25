# DatapackManager core

A standalone, installable runtime that Minecraft datapacks can depend on. It provides:

1. **Latest-version arbitration** - when several datapacks each bundle a copy of DatapackManager,
   the newest generation takes over and the older ones stand down, reliably and regardless of
   which one Minecraft happens to load first.
2. **A cross-datapack event bus** - independent datapacks, written by different authors,
   exchange messages over shared function tags.
3. **A player command line** - ordinary players run `/trigger dm_command set <n>` to invoke
   commands and open datapack config menus.
4. **A Minecraft version oracle** - publishes the running game version as a scoreboard integer,
   which Minecraft still offers no native way to read.

**Command vocabulary: 1.14.4 and up.** The floor is 1.14 because `/schedule` (the basis of every
loop) arrived then - and the loops deliberately avoid the `replace` keyword and `schedule clear`,
which are 1.15, to hold that floor. **But this *artifact* loads on 1.21+ only**, because it uses the
singular `function/` directory layout Minecraft introduced in 1.21; delivering a pack that loads on
1.14 to 1.20 needs a plural-layout build of the same source. See **[LIMITATIONS.md](LIMITATIONS.md)** for
every version boundary, precisely tagged, and [Verification status](#verification-status) below.
Status: **untested - no in-game load has been performed.**

---

## Namespaces, and why there are two

| Namespace | Versioned? | Holds |
|---|---|---|
| `datapackmanager` | no - stable forever | The public API surface: the bus event tags, the CLI verb tag, the root advancement |
| `datapackmanager-2` | **yes - this is generation 2** | All framework logic |
| `DatapackManager` (scoreboard objective) | no - stable forever | The shared state every generation reads and writes |

**The version in `datapackmanager-2` is load-bearing, not cosmetic.** Minecraft merges datapacks
by namespace: if two packs both ship functions under the same namespace, the one loaded *last*
silently overrides the other, and load order depends on file-explorer sorting. If every
generation shared one namespace, a world with an old pack and a new pack could non-deterministically
run the *old* framework.

Giving each generation its own namespace (`datapackmanager-2`, a future `datapackmanager-3`, ...)
means all installed generations load side by side instead of overwriting each other. On load they
each register their version into the shared `DatapackManager` objective; one tick later - deferred
by `/schedule`, which is what makes the floor 1.14 - the newest generation activates and the rest
go inert. Two packs bundling the *same* generation share a namespace and Minecraft de-duplicates
them to one copy, which is correct because they are byte-identical.

Public things (bus tags, the advancement) live in the unversioned `datapackmanager` namespace so a
third-party subscriber binds to an address that survives generation bumps.

> The generation label (`-2`) is a maintainer decision. It is a framework generation number,
> deliberately independent of the Minecraft version, so a Minecraft update never forces a rename  -
> only a breaking framework change does. Rename via find/replace if you prefer another scheme.

---

## The event bus

Publishing and subscribing both rest on **function tags**, which merge across datapacks with no
coordination (the same mechanism lantern-load and Smithed use) and have existed since 1.13.

### Subscribing

Merge one function into a public event tag from your own pack. You never vendor this framework.

`data/datapackmanager/tags/function/event/load.json` **in your pack**:

```json
{ "replace": false, "values": [ "mypack:on_dm_load" ] }
```

`mypack:on_dm_load` then runs on the same tick DatapackManager finishes loading.

### Events published by this pack

| Tag | Fires |
|---|---|
| `#datapackmanager:event/load` | Once, when the active generation finishes initialising |
| `#datapackmanager:event/command_config` | A player ran `/trigger dm_command set 4`; they are tagged `DatapackManager_config` |
| `#datapackmanager:event/command_uninstall` | A player ran `/trigger dm_command set 5`; they are tagged `DatapackManager_uninstall` |

### Payloads

The 1.14-compatible core carries **numeric** payloads only, as scoreboard fake players on the
`DatapackManager` objective (write your value before running the event tag; subscribers read it).
Command storage - the substrate for **text** and **entity** payloads - did not arrive until 1.15,
so those are a later, version-gated tier and **not an API today**. Do not design around them yet.

### Publishing your own event

Ship your own tag `#mypack:event/<name>` and run `function #mypack:event/<name>`. Adding an event
costs no framework files - the tag *is* the event.

---

## The command line

`/trigger` is permission level 0 - the only vanilla command an ordinary (non-operator) player can
use to push data into a datapack, and `set <n>` is the only way to pass it a value. There is no
level-0 way to pass text.

| Command | Does |
|---|---|
| `/trigger dm_command set 1` | help |
| `/trigger dm_command set 2` | about |
| `/trigger dm_command set 3` | detected Minecraft version |
| `/trigger dm_command set 4` | open datapack config (broadcast) |
| `/trigger dm_command set 5` | uninstall (broadcast) |

**Registering your own verb** - merge a router into `#datapackmanager:command` and pick a verb
number >= 100:

```json
{ "replace": false, "values": [ "mypack:cli_router" ] }
```
```mcfunction
execute if score @s dm_command matches 100 run function mypack:my_command
```

Your router runs as the player who typed the command. An idle server does no per-player work: the
CLI only touches players who have actually used the trigger. Players are armed on their first second
online by the hidden advancement `datapackmanager-2:enable_command`, whose reward runs `root/command/enable`.

---

## The version oracle

Reads on the `DatapackManager` objective (fake-player names kept identical to the legacy framework,
so this is a drop-in replacement for version detection):

| Fake player | Meaning |
|---|---|
| `VERSION$minecraft.current` | `major*10000 + minor*100 + patch` |
| `VERSION$minecraft.current.major` / `.minor` / `.patch` | Components |
| `VERSION$minecraft.backward` / `.forward` | Supported range (11404 to 12603) |

The year.drop releases (26.1 and later) are stored as 1.<year>.<drop>: 26.1 is `12601`, 26.2 is `12602`,
26.3 is `12603`. The value stays five digits and sorts above 1.21.11 (`12111`), `.minor` carries the year
(26) and `.patch` the drop, so every consumer gate on `.minor` (`matches 21..` and the like) stays true on
26.x. In-game the framework prints these as `26.3`, not `1.26.3` (`packages/alerts/minecraft_version` and
`root/command/verb/version` switch format at `current matches 12600..`).
encode to `260200` and collide with 26.2.

**Two limits worth knowing:**

- **Drop granularity only.** 1.21.10 added no new parseable id over 1.21.9, and 26.1.1 / 26.1.2 add
  none over 26.1, so those are indistinguishable at runtime and report as their drop. `.patch` carries
  the drop number, never a hotfix. Never gate on a hotfix.
- **"Too new" is guarded by `pack.mcmeta`.** `max_format` (26.3's data pack format is `121.0`) is the
  real guard: the game refuses a pack whose format is beyond it, and that works against versions that do
  not exist yet. The runtime alert `minecraft_too_new` needs a **sentinel leaf**, a probe for the first
  *unsupported* version with `forward` one below it, and 26.4 Snapshot 1 added no new id, so no sentinel
  exists today: on anything newer than 26.3 `current` saturates at `12603` and the alert stays silent. Add
  the sentinel when a 26.4 snapshot exposes a durable block; a renamed id just makes the leaf drop.
  to 26.2, the alert goes quiet, nothing breaks.

---

## Verification status

**This pack has never been loaded by Minecraft.** Everything below was checked statically (all 40
functions and every tag reference resolve, all JSON parses, no command exceeds the 1.14.4 vocabulary,
the ratchet and the arbitration were simulated) - but static checks are not a load. Before relying on it:

1. Load **this artifact** on 1.21.11, 26.1, 26.2 and 26.3; `/trigger dm_command set 3` should report
   `1.21.11`, `26.1`, `26.2` and `26.3`. It will **not** load below 1.21 (singular `function/` layout). To test the 1.14.4 floor,
   build a plural-layout variant (`functions/`, `tags/functions/`, `advancements/`, icon `{"item"}`,
   `pack_format 4`) and load that on 1.14.4 - the *commands* are 1.14-safe, only the packaging differs.
   See [LIMITATIONS.md](LIMITATIONS.md) §1.1.
2. Install two builds with different generation numbers and confirm only the newest runs, in either
   file-explorer order; then remove the newer one and confirm the older re-activates.
3. Load on a 26.4 snapshot and confirm the pack still runs and reports `26.3`; the too-new alert stays
   silent by design until a sentinel leaf for 26.4 exists.
4. Confirm `pack.mcmeta` is accepted at both ends of the range - it carries `pack_format`,
   `supported_formats`, *and* `min_format`/`max_format` (older clients read the first, 1.21.9+ the
   last); that all three coexist is **unverified**, as is the `[major, minor]` form of `max_format`.
5. Confirm long fake-player names (e.g. `VERSION$minecraft.current`, 25 chars) drive scoreboard
   operations correctly on 1.14 to 1.17. Evidence (bug MC-74422) says over-long fake-player names are
   accepted for score operations and only ever broke sidebar *display*, but this specific path is
   unconfirmed pre-1.18. Objective names are kept <= 16 chars, which the pre-1.18 cap did enforce.

Probe identifiers 1.14.4 → 1.21.9 are the maintainer's existing tested canaries. The four new ones
were each verified against the minecraft.wiki release article on 2026-09-25: `wooden_spear` (1.21.11
"Mounts of Mayhem", 2025-12-09), `golden_dandelion` (26.1, 2026-03-24), `sulfur` (26.2, 2026-06-16) and
`poplar_log` (26.3, 2026-09-15). All are block or item probes, not entity-type selectors, because unknown
entity types do not reliably parse-fail before 1.21.2 (see LIMITATIONS.md §5.3).
(see LIMITATIONS.md §5.3).
