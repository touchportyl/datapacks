# set default
execute unless score VERSION$datapack.latest PortylTrident matches 10000.. run scoreboard players set VERSION$datapack.latest PortylTrident 10000
scoreboard players operation FLAG$isActive PortylTrident = BOOL$true DatapackManager

# update from latest to current version
#execute unless score VERSION$datapack.latest PortylTrident matches 10100.. run function portyltrident:packages/versioning/updates/v3.01.00

# set minor version
execute unless score VERSION$datapack.latest PortylTrident matches 10005.. run scoreboard players set VERSION$datapack.latest PortylTrident 10005


# throw error for unsupported minecraft versions
execute if score VERSION$minecraft.current DatapackManager < VERSION$minecraft.backward PortylTrident if score VERSION$ignorecompatibility.backward PortylTrident = BOOL$false DatapackManager as @a at @s run function portyltrident:packages/versioning/throw/datapacknotcompatible

execute if score VERSION$minecraft.current DatapackManager > VERSION$minecraft.forward PortylTrident if score VERSION$ignorecompatibility.forward PortylTrident = BOOL$false DatapackManager as @a at @s run function portyltrident:packages/versioning/throw/datapacknotcompatible


# throw error for all versions newer than the currently supported version
execute if score VERSION$datapack.current PortylTrident < VERSION$datapack.latest PortylTrident as @a at @s run function portyltrident:packages/versioning/throw/datapackunknownversion