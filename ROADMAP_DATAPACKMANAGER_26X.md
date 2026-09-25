# DatapackManager - Roadmap to Minecraft 26.1 / 26.2 / 26.3

**Branch:** `datapackmanager-26x-roadmap`. **Reference implementation:** [`datapackmanager-core/`](datapackmanager-core/) - a working, standalone rebuild (untested in-game). It does not touch the shipped packs.
**Companions:** [`FRAMEWORK_ASSESSMENT.md`](FRAMEWORK_ASSESSMENT.md), [`MAINTAINER_GUIDE.md`](MAINTAINER_GUIDE.md).

Facts are marked **[V]** verified against a fetched primary source or the framework code, **[?]** unverified.
Nothing marked **[?]** may be built on. Scope: **DatapackManager only** - consumer packs and their bespoke
structures are out of scope here.

---

## What DatapackManager is, and what "lean" means for it

Its three selling points are **cross-datapack extensibility**, not internal plumbing:

- **The event bus** is a public IPC API: independent datapacks by different authors send each other
  standardized messages. Today numeric; text and entity payloads are planned.
- **The `/trigger` command line** is a player-facing CLI: ordinary players change settings and invoke
  operations at runtime, like a shell.
- **Latest-version arbitration** lets many packs each bundle the framework while only the newest copy
  runs - the others disable themselves.

So "lean" means **minimize the implementation cost per unit of public API - never the API itself.** The
real defect was never that these subsystems exist; it is that adding one event costs ~6 files and one
config option costs ~6 to 7. A framework selling extensibility cannot charge files per extension. The rebuild
attacks that, and keeps every capability.

---

## The load-bearing correction: the versioned namespace *is* the mechanism

An earlier draft of this roadmap proposed a single unversioned namespace (`dm`). **That is wrong and
breaks the framework's core guarantee.** Minecraft merges datapacks by namespace: if two packs ship
functions under the same namespace, the one loaded last silently overrides the other, and load order
follows file-explorer sorting. With one shared namespace, a world containing an old pack and a new pack
could non-deterministically run the *old* framework.

The version suffix is what prevents this. Each generation (`datapackmanager-2`, a future
`datapackmanager-3`, ...) is its own namespace, so all installed generations load side by side instead of
overwriting each other. On load each registers its version into the shared `DatapackManager` objective;
one tick later - **deferred by `/schedule`** - the newest activates and the rest go inert. This is the
"disable older versions of myself and run only the latest" behavior, and it is the reason the compat floor
is **1.14** (`/schedule`, 18w43a [V]).

The generation number is deliberately **independent of the Minecraft version**, so an MC update never
forces a namespace rename - only a breaking framework change does. Public API (bus tags, the root
advancement) lives in the unversioned `datapackmanager` namespace so third-party subscribers bind to a
stable address.

**Arbitration, simulated** ([`datapackmanager-core`](datapackmanager-core/)): with generations 2 and 3
installed, only 3 activates - in either load order. Remove 3 and reload, and 2 correctly re-activates (a
game-time epoch resets the shared maximum once per load tick, so a stale value from the removed generation
cannot strand the survivor). Exactly one generation active in every case.

---

## The compat floor is 1.14.4, and it dictates the whole toolset

`/schedule` is the binding primitive: every loop and the deferred election depend on it, and it arrived in
1.14. That floor rules out the fancier substrates:

| Primitive | Min MC | Usable in the 1.14 core? |
|---|---|---|
| `/schedule function <fn> <time>` (bare) | 1.14 / 18w43a [V] | **Yes** - the reason for the floor |
| `schedule ... replace` keyword + `schedule clear` | **1.15 / 19w38a** [V] | **No - avoided** (see below) |
| Function tags, `function #tag` | 1.13 [V] | **Yes** - the bus fan-out |
| Scoreboard fake players | pre-1.14 | **Yes** - numeric payloads |
| `/trigger`, trigger objectives | 1.8 [V] | **Yes** - the CLI |
| Command storage (`data ... storage`) | 1.15 [V] | No - text payloads become a gated tier |
| Macros `$(...)` | 1.20.2 [V] | No |
| `return run` | 1.20.3 [V] | No |

So the bus is **function-tags + scoreboard**, not the storage/macro design an earlier draft proposed (that
design silently required 1.15+ and would have broken the 1.14 floor). Each event is a function tag
(`#datapackmanager:event/<name>`); publishing runs it, subscribing merges a handler into it, and adding an
event costs **zero framework files**. Text/entity payloads ride command storage and are a version-gated
tier that activates only where the oracle reports 1.15+, so they never break the 1.14 core.

**Two constraints the floor imposes, both handled:**

- **Objective names must be <= 16 characters** - the pre-1.18 cap did enforce this at the objective level.
  So the objectives stay short (`DatapackManager` = 15, `dm_command` = 10), matching the maintainer's
  existing `dm_`-prefixed convention.
- **Fake-player (score-holder) names may stay long and readable.** Evidence (bug MC-74422 [V]) shows
  Minecraft accepts over-long fake-player names for score operations; the 16-char removal in 1.18 mainly
  affected objective/team names and sidebar display. So `VERSION$minecraft.current` and friends keep their
  full, self-documenting names - **[?]** confirm the score-op path on 1.14 to 1.17 in-game.

- **`schedule` `replace`/`clear` are 1.15, not 1.14.** A patch-note check (below) found that only the bare
  `schedule function <fn> <time>` is 1.14; the `replace` keyword and `schedule clear` arrived in 1.15. The
  loops therefore use bare `schedule` (which replaces by default on both 1.14 and 1.15+) and rely on the
  active-generation guard - not `schedule clear` - to stop a superseded loop. This is what actually holds the
  1.14.4 floor for the loop engine.

**The packaging caveat, made precise.** Data-pack directories went plural→singular in 1.21 (24w21a [V],
`functions/`→`function/`). A single flat pack cannot use both, so this artifact (singular, `min_format 48`)
loads on **1.21+ only**; the sub-1.21 version leaves are inert in it and run only in a plural-layout build of
the same source. The *commands* are 1.14-safe; the *directory packaging* for 1.14 to 1.20 is an MPP/build
responsibility (**[?]**, Q2) - via a plural export or datapack overlays (1.20.2+).

**A full, version-tagged catalogue of every such boundary now lives in
[`datapackmanager-core/LIMITATIONS.md`](datapackmanager-core/LIMITATIONS.md)** - the deliverable of a
patch-note research pass that verified each version against primary sources and cross-referenced it against
the framework's actual command surface. Its §7 is the "unaccounted sub-version" audit: within this artifact's
loadable range [1.21, 26.2], no parse-breaking change to the framework's real command surface falls at a
non-leaf boundary; the only structural one that touches it is the 1.21 folder rename, already gated by
`min_format 48`.

---

## The "too new" alert cannot be fixed by raising `forward`

`FRAMEWORK_ASSESSMENT.md` recommends reviving `minecraftunknownversion` by raising `forward` above the
ceiling. **That cannot work for any value.** The ratchet's probes parse on "version X *or later*," so on any
client at or above the newest probe every probe parses and `current` saturates there; `current > forward` is
then either unreachable (`forward >= ceiling` - today's bug, `forward = 12110`) or fires on a supported
version. A version that does not exist yet cannot fail to parse a probe.

Two mechanisms work: **`max_format`** (the game refuses a too-new pack; works against versions that do not
exist yet) and a **sentinel leaf** (a probe for the first *unsupported* version with `forward` one below it).
As of 2026-09-25 26.3 is a supported leaf and 26.4 Snapshot 1 added no new id, so no sentinel exists, the
alert is silent by design, and `max_format` (121.0) is the only guard. Add the sentinel when a 26.4 snapshot
exposes a durable block; it degrades safely, because a renamed id makes the leaf drop and detection fall
back one version.
and detection falls back one version.

---

## Verified probe identifiers

1.14.4 → 1.21.9 reuse the maintainer's existing tested canaries. The four new leaves were each verified
against the minecraft.wiki release article on 2026-09-25.

| Version | Encoded | Probe | Source |
|---|---|---|---|
| 1.21.11 | `12111` | `give a minecraft:wooden_spear` | 1.21.11 "Mounts of Mayhem", 2025-12-09 |
| 26.1 | `12601` | `execute if block ~ ~ ~ minecraft:golden_dandelion` | 26.1 "Tiny Takeover", 2026-03-24 |
| 26.2 | `12602` | `execute if block ~ ~ ~ minecraft:sulfur` | 26.2 "Chaos Cubed", 2026-06-16 |
| 26.3 | `12603` | `execute if block ~ ~ ~ minecraft:poplar_log` | 26.3 release, 2026-09-15 |

Encoding decision (maintainer, 2026-09-25): year.drop releases are stored as 1.<year>.<drop>, so 26.1 → `12601`
and 26.3 → `12603`. The value stays five digits, sorts above 1.21.11 (`12111`), and `.minor` stays monotonic
because it carries the year, so every consumer gate such as `minor matches 21..` stays true on 26.x; `.patch`
carries the drop. The `260100` scheme of an earlier draft would have set `.minor` to 1 and broken those gates.
Detection is drop-granular [V]: 1.21.10 and 26.1.1/26.1.2 add no new parseable id and report as their drop, so
consumers must not gate on a hotfix. In-game the version prints as `26.3`, not `1.26.3`.
a hotfix.

---

## What the reference implementation delivers

[`datapackmanager-core/`](datapackmanager-core/) - 48 files, ~173 lines of mcfunction, namespace
`datapackmanager-2` + public `datapackmanager`. Statically verified (all 41 references resolve, all JSON
parses, no command exceeds the 1.14.4 vocabulary) and simulated (ratchet + arbitration). **Not yet loaded
in-game.**

- **Arbitration** - `root/core/{load,elect,activate,disable}`: game-time-epoch max + schedule-deferred
  election; latest generation wins, older ones go inert, survivor re-activates after the newer is removed.
- **Event bus** - `#datapackmanager:event/*` function tags; publish = run the tag, subscribe = merge one
  handler, **zero framework files per event**. Numeric (scoreboard) now; text/entity gated for 1.15+.
- **CLI** - one `dm_command` trigger, integer verbs, third-party verbs via `#datapackmanager:command`;
  idle cost is one selector probe per second (vs the old ten `@a` ops), re-arm only the firer plus an
  enable-on-join advancement.
- **Oracle** - the full 1.14.4 → 26.3 ratchet, no sentinel yet (26.4 Snapshot 1 added no new id); the
  `patch.mcfunction` clobber and the dead "too old"/forward machinery are gone.

Two bugs I caught in my own first pass and fixed: an enable-on-join advancement that would re-grant every
tick (turning a once-per-player hook into a per-tick loop), and a CLI gate that would permanently lock out a
player who typed `/trigger dm_command set 0`.

---

## Open questions [?]

| # | Question | Blocks |
|---|---|---|
| Q1 | Does MPP regenerate `pack.mcmeta` from `.mpp-datapack`, and can it emit the plural pre-1.21 directory layout for old-version builds? | Shipping below 1.21 |
| Q2 | Can MPP vendor one source into N consumers? The drift-eliminating codegen **does not exist today** - `_pythontools` is a template-diff GUI. | Eliminating vendored-copy drift |
| Q3 | Is `pack.mcmeta` with `pack_format` + `supported_formats` + `min_format`/`max_format` all present accepted across 1.14 → 26.3? | The reference pack's metadata |
| Q4 | Do over-long **fake-player** names drive score operations correctly on 1.14 to 1.17? (MC-74422 suggests yes; unconfirmed for this path.) | Long readable holder names below 1.18 |
| Q5 | Resolved 2026-09-25: 26.3 shipped on 2026-09-15 with data pack format 121.0 and the probe is `poplar_log`, verified against the release article. Open again for 26.4, whose Snapshot 1 (format 122.0) added no new id. | The next sentinel |

Resolved: `/schedule` = 1.14 [V]; function tags = 1.13 [V]; storage = 1.15 [V]; the 16-char cap lifted in
1.18 and never blocked fake-player score ops [V]; folders went singular in 1.21 [V]; `pack_format` 15 = 1.20,
48 = 1.21 [V]; the four new probe ids [V].

---

## Phased roadmap

**Phase 0 - Resolve blockers, build a way to test.** Zero automated tests exist. Stand up 1.14.4, 1.21,
26.1, 26.2, and a 26.3 snapshot. Write one smoke-test function per pack dumping the `VERSION$minecraft.*`
scores. **Capture a golden baseline before touching the version leaves** - the fix changes 1.21.9's reported
value from the clobbered `12110` to `12109`. Resolve Q1 to Q4.

**Phase 1 - Adopt the rebuilt core as the canonical source.** [`datapackmanager-core/`](datapackmanager-core/)
already implements the arbitration, bus, CLI, and oracle. Confirm the generation namespace string with the
maintainer (`datapackmanager-2` is a placeholder for a framework-generation label). *Exit:* loads clean on
1.21/26.1/26.2; reports the true version on each; arbitration picks the newest of two installed generations.

**Phase 2 - done differently (2026-09-25).** `datapackmanager-mc26.1/` was retired and replaced by
`datapackmanager-mc26.3/`, derived mechanically from the canonical template by `_pythontools/derive_generation.py`,
so it has zero unresolved references. Which source (shipped generation or rebuilt core) becomes canonical in the
long run is still the maintainer's call in phase 1.

**Phase 3 - Migrate consumers onto the new generation.** Out of scope for this document (per instruction:
DatapackManager only), but the shape: each consumer swaps its vendored framework tree, re-subscribes its
handlers into `#datapackmanager:event/*`, and updates its own `pack.mcmeta`. The arbitration means a consumer
still on an older generation coexists safely rather than fighting the new one.

**Phase 4 - done for 26.3 (2026-09-25).** 26.3 is a supported leaf (`poplar_log`, `max_format` 121.0). The
next turn is 26.4: add a sentinel leaf once a snapshot exposes a durable block id, pin `max_format`, and
promote it at GA. Pinning `max_format` at the newest release means consumers visibly go incompatible on the
next launch day rather than silently mis-detecting, which is the correct trade but makes each drop a release
commitment.
release commitment.

---

## What changed and why it stays capable

Nothing in the public API was removed. The bus, the CLI, the oracle, the migration/version discipline, and
the latest-wins arbitration all survive. What went away is machinery: the tri-state `.copy`/`.handled`
handshake and both polling loops (replaced by same-tick tag fan-out), the `patch.mcfunction` clobber, the
unreachable forward-based alert, `resetcommands`' ten-per-second `@a` sweep, and - once regenerated from one
source - the byte-identical fork duplication. The per-event cost drops from ~6 files to zero; the per-config
cost from ~6 to 7 files to 0 to 1.
