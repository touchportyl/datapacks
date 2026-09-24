# DatapackManager — Minecraft version limitations

Every Minecraft breaking change that constrains a datapack's command/JSON syntax, tagged with the exact
version it **arrived** and (where relevant) the version the **old form stopped working**. Minecraft rejects
an *entire* `.mcfunction` file if any single line fails to parse, so a syntax that changed between versions
is a hard boundary: a file written for one side silently vanishes on the other.

Each entry says whether it **affects this framework** (`datapackmanager-2`, floor 1.14.4). Version tags were
verified against minecraft.wiki per-version articles and the Pack format / Raw JSON text / NBT format pages;
a few marked **[unverified]** rest on secondary sources and need an in-game or changelog check.

Legend: **parse-break** = wrong-version form drops the whole file; **feature-break** = silently ignored /
not discovered, file still loads; **semantic** = parses but means something different.

---

## 1. The three that bound this framework's real range

### 1.1 Directory names went plural → singular — **added 1.21 (24w21a), pack_format 45→48**
`functions/`→`function/`, `tags/functions/`→`tags/function/`, `advancements/`→`advancement/` (and
`recipes`, `loot_tables`, `predicates`, `item_modifiers`, `structures`). **feature-break, not parse-break:**
on ≤1.20.6 only the *plural* layout is read; on 1.21+ only the *singular*. A single flat pack **cannot span
this boundary** — the files are simply not discovered on the wrong side.

**Affects the framework — decisively.** This source uses the singular layout, so this artifact loads on
**1.21+ only**, and `pack.mcmeta` sets `min_format: 48` to say so honestly. The command *vocabulary* is
1.14.4-safe (sections below), but delivering a pack that actually **loads** on 1.14–1.20.6 requires a
second build with the plural layout, or datapack overlays (§4.4) supplying a plural variant. That is a build
step, not something the source tree can express. Until such a build exists, the version leaves for
1.14.4–1.20.5 are inert in this artifact (they run only in a plural-layout build).

### 1.2 `schedule` `replace` keyword and `schedule clear` — **added 1.15 (19w38a)**
The bare command `schedule function <fn> <time>` is **1.14 (18w43a)**, but the `append`/`replace` keyword
**and** the `schedule clear` subcommand were added in **1.15 (19w38a)**. On 1.14.x, `schedule … replace` and
`schedule clear` are **parse-breaks**.

**Handled.** Every loop here uses bare `schedule function … 1s` with **no keyword**. On 1.14 a function
"can be scheduled only once" and re-scheduling "replaces the oldest record" (18w43a), and on 1.15+ the
omitted keyword defaults to `replace` — so a self-rescheduling loop does not stack on either side. Loop
*termination* uses the active-generation guard (a superseded loop fails its guard and does not reschedule)
instead of `schedule clear`. This is what keeps the loop engine at the true 1.14.4 floor.

### 1.3 `pack.mcmeta` range fields — **`supported_formats` added 1.20.2 (23w31a); `min_format`/`max_format` + minor formats added 1.21.9 (25w31a)**
Before 1.20.2 a pack declares one integer `pack_format`. 1.20.2 added `supported_formats` (a range).
1.21.9 added a *minor* component (`88.0`, `94.1`, `101.1`, `107.1`) and the `min_format`/`max_format`
fields, which supersede `pack_format`. Unknown fields are **ignored**, not rejected, so all three can coexist.

**Handled (belt-and-suspenders).** This `pack.mcmeta` carries `pack_format: 48` + `supported_formats` +
`min_format`/`max_format` at once: 1.21–1.21.8 read the first two and ignore the rest; 1.21.9+ read
`min_format`/`max_format`. Not a parse-break in either direction.

---

## 2. Text components (tellraw, objective display names)

The framework uses `{text, color, bold}` and `{score:{name, objective}}` in `tellraw` and in an objective
display name. **None of these break** across 1.14.4 → 26.2 — but the boundary below constrains what may be
*added* to them.

### 2.1 Text components: JSON → SNBT — **added 1.21.5 (25w02a); numeric-literal strictness 25w09a**
From 1.21.5, command text components are parsed as **SNBT** and stored as NBT, not JSON. SNBT is a superset
of the JSON object form, so **well-formed JSON keeps parsing** (quoted keys, string values, `true`/`false`).
The framework's components sit in the JSON∩SNBT safe set and parse on both sides.
**Constraint for maintainers:** never introduce, into a text component, a **bare-string array element**
(`["x", {...}]`), a **numeric-typed literal**, or any SNBT-only syntax — NBT lists are homogeneous, so
mixed arrays stop parsing on 1.21.5+ (parse-break), and such forms also fail pre-1.21.5.

### 2.2 `hoverEvent`→`hover_event`, `clickEvent`→`click_event` — **renamed 1.21.5 (25w02a)**
Also `value`→`command`/`url`/`page` inside click events, and `value`→`contents`→`text` inside hover
(`contents` added 1.16/20w17a; finalized to `text` in 1.21.5). **feature-break, not parse-break:** the
wrong-version key is silently ignored (the hover/click just stops working). **Does not affect the
framework** — it uses no hover/click events. Flagged so a future clickable menu is version-forked at 1.21.5.

### 2.3 `score` and basic components — **stable, no version boundary**
`{score:{name, objective}}` (present since 1.8) and `{text, color, bold}` have **no** parse-affecting change
1.14 → 26.2. Safe across the whole range.

---

## 3. NBT / SNBT and items — *not used by the 1.14 core; documented for future tiers*

The core stores **only scoreboard integers** and uses **only bare `give <player> <id>`** (no NBT). So the
item/NBT breaks below do **not** affect it today. They *will* bind a planned text/entity payload tier
(command storage) and any future item-bearing feature.

| Change | Added | Old form breaks | Kind | Affects core |
|---|---|---|---|---|
| Item NBT `id{tag}` → components `id[...]` | 1.20.5 (24w09a) | 1.20.5 | parse-break | No (bare give) |
| Item-stack `Count`(byte)→`count`(int), `id` namespaced | 1.20.5 (24w09a) | 1.20.5 | parse-break | No (storage tier only) |
| `data storage <id>` target added | 1.15 (19w38a) | n/a — absent before | parse-break below 1.15 | **Storage tier floor is 1.15** |
| SNBT numeric rework (leading zeros rejected; hex/binary/`_` added) | 1.21.5 (25w09a) | 1.21.5 | parse-break | No (storage tier only) |
| UUID `UUIDMost`/`UUIDLeast` longs → `[I;a,b,c,d]` int-array | 1.16 (20w12a) | still parses | semantic | No (storage tier only) |
| `fire_resistant` component → `damage_resistant` | 1.21.2 (24w37a) | 1.21.2 | parse-break (validated) | No (no components used) |
| Strict numeric type-checking in data-driven JSON/NBT **[unverified]** | 26.1.2 | 26.1.2 | parse/validate | No (core JSON is correctly typed) — verify |

The 26.1.2 strictness rests only on a secondary source; a per-version wiki confirmation is still needed.
The core's JSON already uses correct types (`"replace": false` boolean, `"values"` array of strings, integer
`pack_format`), so it is expected to pass regardless.

---

## 4. Data-pack JSON schema

### 4.1 Advancement icon `{"item"}` → `{"id", count, components}` — **added 1.20.5 (24w09a)**
The advancement `display.icon` changed from `{"item":"minecraft:knowledge_book"}` (+ `nbt` string) to
`{"id":"minecraft:knowledge_book", "count":1, "components":{}}`. **parse-break:** the new `{"id"}` form is
rejected on ≤1.20.4, the old `{"item"}` form on ≥1.20.5.

**Affects the framework — cosmetically.** `advancement/root.json` uses the `{"id"}` form, correct for this
1.21+ artifact. In a plural-layout build for 1.14–1.20.4 the icon must become `{"item":…}`. `root.json` is a
purely cosmetic toast-group parent, and the functional enable-on-join advancement (`enable_command.json`)
has **no icon**, so nothing operational depends on this. **[unverified]** whether a bad icon fails only the
icon or the whole advancement — treat as whole-advancement to be safe.

### 4.2 Function-tag object entry `{"id":…, "required":false}` — **added 1.16.2 (20w30a)**
Before 1.16.2 a tag `values` array may contain **plain strings only**; the object entry form is a
**parse-break** that drops the whole tag on ≤1.16.1. **Does not affect the framework** — its tags use plain
strings. Flagged as a constraint: `required:false` (tolerating an absent subscriber function) is unavailable
below 1.16.2.

### 4.3 Missing function reference fails the whole tag — **behavior since 1.13; `required:false` escape hatch 1.16.2**
If a function tag lists a function id that does not exist and the entry is not `required:false`, Minecraft
fails to load the **entire tag**. The framework's own tag entries all resolve (`command.json` → an existing
router; event tags ship empty), so it is safe. A subscriber that lists a missing handler will drop the whole
merged tag on <1.16.2; document `required:false` for subscribers targeting ≥1.16.2.

### 4.4 Datapack overlays — **added 1.20.2 (23w31a)**; `formats` key → `min_format`/`max_format` at 1.21.9
Overlays let one pack carry alternate directory trees for a format range. This is the sanctioned way to make
one pack span the §1.1 folder rename (a plural base for ≤1.20.6 + a singular overlay for 1.21+) — but
overlays themselves need pack_format ≥ 16 (1.20.2), so they cannot help 1.14–1.20.1, which need the plural
base directly. `minecraft:tick`/`minecraft:load` tags and nested tag references (`#other:tag`, since 1.13)
are stable across the whole range.

---

## 5. Commands the framework uses — stability table

Verified stable for the exact forms used, across the loadable range, unless noted.

| Command form | Verdict |
|---|---|
| `execute if block / if entity / if score / store result score … run / as / at / unless` | Stable since 1.13 |
| `scoreboard objectives add … <text-component display>` / `players set/operation/enable/reset/get` | Stable |
| `function <ns>:<path>` and `function #<ns>:<tag>` | Stable since 1.13 |
| `tellraw @s <component>` | Grammar stable; component internals per §2 |
| `particle <id> ~ ~ ~ dx dy dz speed count` (optionless) | Stable; particle **options** moved to SNBT in 1.20.5 but the framework uses no options |
| `give <player> <id>` (bare, no NBT) | Stable; item **NBT** changed 1.20.5 but the framework passes no NBT |
| `tag @s add/remove` | Stable since 1.13 |
| `time query gametime` | Stable since 1.8 |
| `schedule function … <time>` (no keyword) | Stable since 1.14 — **but see §1.2**: never add `replace`/`clear` |

### 5.1 Objective name 16-char limit — **removed 1.18 (21w37a)**
Objective and team names were capped at 16 chars before 1.18; an over-16 objective name is a **parse-break**
on ≤1.17. The framework's objectives are `DatapackManager` (15) and `dm_command` (10), both under the cap.

### 5.2 Fake-player (score-holder) names over 16 chars — **cap removed 1.18 (21w37a); pre-1.18 parse-enforcement [unverified]**
The 1.18 note that removed length limits names "score holders," but evidence (bug MC-74422) indicates the
pre-1.18 limit on *fake-player* names was **runtime/display, not parse-enforced** — long fake-player names
drive score operations fine and only ever broke sidebar display. The framework relies on this: names like
`VERSION$minecraft.current` (25 chars) exceed 16. **[unverified]** for the score-op path on 1.14–1.17;
confirm in-game before trusting the sub-1.18 tier. (Objective names are kept ≤16 regardless — §5.1.)

### 5.3 Invalid selectors → parse failure — **1.21.2 (24w33a)**
From 1.21.2, an invalid selector (including, in some cases, an unknown entity type in `@e[type=…]`) is a
**parse failure** rather than resolving to empty. This makes entity-type **canaries** unreliable below
1.21.2 (the probe may not drop the file where intended). The framework therefore uses **block/item/particle**
canaries (reliably parse-validated in every version) and no entity-selector canary — the 1.21.11 probe is
`give a minecraft:wooden_spear`, an item.

---

## 6. Pack format reference (data packs)

`4` = 1.14–1.14.4 · `5` = 1.15–1.16.1 · `6` = 1.16.2–1.16.5 · `7` = 1.17–1.17.1 · `8` = 1.18–1.18.1 ·
`9` = 1.18.2 · `10` = 1.19–1.19.3 · `12` = 1.19.4 · `15` = 1.20–1.20.1 · `18` = 1.20.2 · `26` = 1.20.3–1.20.4 ·
`41` = 1.20.5–1.20.6 · `48` = 1.21–1.21.1 · `57` = 1.21.2–1.21.3 · `61` = 1.21.4 · `71` = 1.21.5 · `80` = 1.21.6 ·
`81` = 1.21.7–1.21.8 · `88.0` = 1.21.9–1.21.10 · `94.1` = 1.21.11 · `101.1` = 26.1–26.1.2 · `107.1` = 26.2 ·
`108–110` = 26.3 snapshots **[unverified, moving]**.

**Load gating (not a parse concern):** a pack whose format is **too new** is marked incompatible and needs
force-confirm; **too old** is marked out-of-date and is generally still loadable with a warning
(**[unverified]** exact too-old wording). This is why `max_format` — not a runtime score — is the framework's
real "this Minecraft is too new" guard (see the 26.3 sentinel in the README).

---

## 7. Unaccounted sub-version boundaries (the audit you asked for)

The version ratchet has leaves at 1.14.4, 1.15.2, 1.16.5, 1.17.1, 1.18.2, 1.19.4, 1.20.2, 1.20.3, 1.20.5,
1.21.2, 1.21.4, 1.21.5, 1.21.6, 1.21.7, 1.21.9, 1.21.11, 26.1, 26.2, 26.3. Releases with a real breaking
change that fall **between** leaves were checked against the framework's *actual* command surface:

| Release (bucketed under leaf) | Breaking change | Hits the framework's surface? |
|---|---|---|
| **1.16.2** (under 1.16.5) | `required:false` tag entries (§4.2) | No — plain-string tags only |
| **1.20.5** (a leaf) | item components, advancement icon (§3, §4.1) | Icon: cosmetic, dual-build only |
| **1.20.6 / 1.21 / 1.21.1** (under 1.20.5) | **directory singularization (§1.1)** | **Yes — the loadable-floor boundary**, gated by `min_format: 48` |
| **1.21.2** (a leaf) | invalid-selector parse failure (§5.3); `damage_resistant` | Selectors: avoided by using item canaries |
| **1.21.6** (a leaf) | strict-mode JSON parsing (25w18a) | No — framework JSON is clean |
| **1.21.8** (under 1.21.7) | none (pack_format 81 = 1.21.7) | No |
| **1.21.10** (under 1.21.9) | none parseable — bucketed by design | No |
| **26.1.1 / 26.1.2** (under 26.1) | numeric type strictness (§3) **[unverified]** | No — correctly-typed JSON |

**Net finding:** within this artifact's effective loadable range **[1.21, 26.2]**, no parse-breaking change
to the framework's actual command surface falls at a non-leaf boundary. The one genuinely unaccounted
*structural* boundary that touches the framework is the **1.21 directory rename** — and it is already
neutralized by `min_format: 48`, at the cost of the sub-1.21 leaves being inert in this build. The 1.21.5
text-SNBT boundary lands on a leaf and the framework's usage is JSON∩SNBT safe.

**Two things a future change must respect** (they are safe today but are the tripwires): (1) never put an
SNBT-only or mixed-array form into a text component (§2.1); (2) never add `replace`/`clear` to a `schedule`
if the 1.14 floor is to hold (§1.2).
