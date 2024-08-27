# set default
execute unless score VERSION$datapack.latest DimensionalDoors matches 10000.. run scoreboard players set VERSION$datapack.latest DimensionalDoors 10000
scoreboard players operation FLAG$isActive DimensionalDoors = BOOL$true DatapackManager

# update from latest to current version
execute unless score VERSION$datapack.latest DimensionalDoors matches 30100.. run function dimensionaldoors:packages/versioning/updates/v3.01.00
execute unless score VERSION$datapack.latest DimensionalDoors matches 30200.. run function dimensionaldoors:packages/versioning/updates/v3.02.00

# set minor version
#execute unless score VERSION$datapack.latest DimensionalDoors matches 30200.. run scoreboard players set VERSION$datapack.latest DimensionalDoors 30200


# throw error for unsupported minecraft versions
execute if score VERSION$minecraft.current DatapackManager < VERSION$minecraft.backward DimensionalDoors if score VERSION$ignorecompatibility.backward DimensionalDoors = BOOL$false DatapackManager as @a at @s run function dimensionaldoors:packages/versioning/throw/datapacknotcompatible

execute if score VERSION$minecraft.current DatapackManager > VERSION$minecraft.forward DimensionalDoors if score VERSION$ignorecompatibility.forward DimensionalDoors = BOOL$false DatapackManager as @a at @s run function dimensionaldoors:packages/versioning/throw/datapacknotcompatible


# throw error for all versions newer than the currently supported version
execute if score VERSION$datapack.current DimensionalDoors < VERSION$datapack.latest DimensionalDoors as @a at @s run function dimensionaldoors:packages/versioning/throw/datapackunknownversion