# DatapackManager core - bootstrap. Wired into #minecraft:load, so this runs once per load/reload.
# WARNING: the master objective must be created before anything else references it.
scoreboard objectives add DatapackManager dummy [{"text":"Datapack Manager","color":"white"}]

function datapackmanager-2:root/core/constants

# --- Latest-version arbitration, part 1: register this generation ------------------------
# Every installed generation of DatapackManager loads (each has its own namespace, so they do
# not overwrite each other), and each records its own version into a shared running maximum.
# One tick later, root/core/elect compares and only the newest generation activates; the rest
# stay inert. This is what "disable older versions of myself and run only the latest" means,
# and it is why /schedule (Minecraft 1.14) is the floor: the election must be DEFERRED until
# every generation present has registered on this same tick.
#
# VERSION$framework.latest must be reset once per load tick, before any generation adds to it -
# but no generation knows if it runs first. Game time is identical for every generation on a
# given tick and advances between reloads, so it is used as a per-tick epoch: the first
# generation to run this tick resets the maximum; the rest only contribute to it.
execute store result score VERSION$framework.now DatapackManager run time query gametime
execute unless score VERSION$framework.now DatapackManager = VERSION$framework.epoch DatapackManager run scoreboard players set VERSION$framework.latest DatapackManager 0
scoreboard players operation VERSION$framework.epoch DatapackManager = VERSION$framework.now DatapackManager

scoreboard players set VERSION$framework.candidate DatapackManager 20000
scoreboard players operation VERSION$framework.latest DatapackManager > VERSION$framework.candidate DatapackManager

# Defer the election until all generations have registered (see above).
# No `replace` keyword: it is 1.15+, and bare `schedule` already replaces on 1.14 (a function can
# be scheduled only once), so this stays inside the 1.14.4 floor.
schedule function datapackmanager-2:root/core/elect 1t
