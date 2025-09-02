# set default
execute unless score VERSION$datapack.latest Harvester matches 10000.. run scoreboard players set VERSION$datapack.latest Harvester 10000
scoreboard players operation FLAG$isActive Harvester = BOOL$true DatapackManager

# update from latest to current version
execute unless score VERSION$datapack.latest Harvester matches 20000.. run function harvester:packages/versioning/updates/v2.00.00
execute unless score VERSION$datapack.latest Harvester matches 30100.. run function harvester:packages/versioning/updates/v3.01.00

# set minor version
execute unless score VERSION$datapack.latest Harvester matches 30300.. run scoreboard players set VERSION$datapack.latest Harvester 30300


# throw error for unsupported minecraft versions
execute if score VERSION$minecraft.current DatapackManager < VERSION$minecraft.backward Harvester if score VERSION$ignorecompatibility.backward Harvester = BOOL$false DatapackManager as @a at @s run function harvester:packages/versioning/throw/datapacknotcompatible

execute if score VERSION$minecraft.current DatapackManager > VERSION$minecraft.forward Harvester if score VERSION$ignorecompatibility.forward Harvester = BOOL$false DatapackManager as @a at @s run function harvester:packages/versioning/throw/datapacknotcompatible


# throw error for all versions newer than the currently supported version
execute if score VERSION$datapack.current Harvester < VERSION$datapack.latest Harvester as @a at @s run function harvester:packages/versioning/throw/datapackunknownversion