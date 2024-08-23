# set default
execute unless score VERSION$datapack.latest PortylTrident matches 10000.. run scoreboard players set VERSION$datapack.latest PortylTrident 10000

# update from latest to current version
#execute unless score VERSION$datapack.latest PortylTrident matches 10003.. run function PortylTrident:packages/versioning/updates/v3.01.00

execute unless score VERSION$datapack.latest PortylTrident matches 10003.. run scoreboard players set VERSION$datapack.latest PortylTrident 10003


# throw error for unsupported minecraft versions
execute if score VERSION$minecraft.current DatapackManager < VERSION$minecraft.backward PortylTrident if score VERSION$ignorecompatibility.backward PortylTrident = BOOL$false DatapackManager run function portyltrident:packages/versioning/throw/minecraftnotcompatible

execute if score VERSION$minecraft.current DatapackManager > VERSION$minecraft.forward PortylTrident if score VERSION$ignorecompatibility.forward PortylTrident = BOOL$false DatapackManager run function portyltrident:packages/versioning/throw/minecraftnotcompatible


# throw error for all versions newer than the currently supported version
#execute if score VERSION$datapack.current PortylTrident < VERSION$datapack.latest PortylTrident run function portyltrident:packages/versioning/throw/datapacknotcompatible
execute if score VERSION$datapack.current PortylTrident < VERSION$datapack.latest PortylTrident run function portyltrident:packages/versioning/throw/datapackunknownversion