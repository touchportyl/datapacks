tellraw @a[tag=hv_debug] [{"text":"HV","color":"gold"},{"text":" > packages/versioning/check.mcfunction","color":"gray"}]

# set default
execute unless score VERSION$datapack.latest Harvester matches 10000.. run scoreboard players set VERSION$datapack.latest Harvester 10000

# update from latest to current version
execute unless score VERSION$datapack.latest Harvester matches 20000.. run function harvester:packages/versioning/updates/v2.00.00
execute unless score VERSION$datapack.latest Harvester matches 30100.. run function harvester:packages/versioning/updates/v3.01.00
execute unless score VERSION$datapack.latest Harvester matches 30203.. run scoreboard players set VERSION$datapack.latest Harvester 30203


# throw error for unsupported minecraft versions
execute if score VERSION$minecraft.current DatapackManager < VERSION$minecraft.backward Harvester if score VERSION$ignorecompatibility.backward Harvester = BOOL$false DatapackManager run function harvester:packages/versioning/throw/mcnotcompatible

execute if score VERSION$minecraft.current DatapackManager > VERSION$minecraft.forward Harvester if score VERSION$ignorecompatibility.forward Harvester = BOOL$false DatapackManager run function harvester:packages/versioning/throw/mcnotcompatible


# throw error for all versions newer than the currently supported version
execute if score VERSION$datapack.current Harvester < VERSION$datapack.latest Harvester run function harvester:packages/versioning/throw/dpnotcompatible