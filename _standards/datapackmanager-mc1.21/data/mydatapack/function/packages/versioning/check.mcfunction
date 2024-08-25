# set default
execute unless score VERSION$datapack.latest MyDatapack matches 10000.. run scoreboard players set VERSION$datapack.latest MyDatapack 10000

# update from latest to current version
#execute unless score VERSION$datapack.latest MyDatapack matches 10100.. run function MyDatapack:packages/versioning/updates/v3.01.00

# set minor version
execute unless score VERSION$datapack.latest MyDatapack matches 10003.. run scoreboard players set VERSION$datapack.latest MyDatapack 10003


# throw error for unsupported minecraft versions
execute if score VERSION$minecraft.current DatapackManager < VERSION$minecraft.backward MyDatapack if score VERSION$ignorecompatibility.backward MyDatapack = BOOL$false DatapackManager run function mydatapack:packages/versioning/throw/minecraftnotcompatible

execute if score VERSION$minecraft.current DatapackManager > VERSION$minecraft.forward MyDatapack if score VERSION$ignorecompatibility.forward MyDatapack = BOOL$false DatapackManager run function mydatapack:packages/versioning/throw/minecraftnotcompatible


# throw error for all versions newer than the currently supported version
#execute if score VERSION$datapack.current MyDatapack < VERSION$datapack.latest MyDatapack run function mydatapack:packages/versioning/throw/datapacknotcompatible
execute if score VERSION$datapack.current MyDatapack < VERSION$datapack.latest MyDatapack run function mydatapack:packages/versioning/throw/datapackunknownversion