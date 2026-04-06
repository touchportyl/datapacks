# set default
execute unless score VERSION$datapack.latest Seaskipper matches 10000.. run scoreboard players set VERSION$datapack.latest Seaskipper 10000
scoreboard players operation FLAG$isActive Seaskipper = BOOL$true DatapackManager

# update from latest to current version
#execute unless score VERSION$datapack.latest Seaskipper matches 10100.. run function seaskipper:packages/versioning/updates/v3.01.00

# set minor version
#execute unless score VERSION$datapack.latest Seaskipper matches 10003.. run scoreboard players set VERSION$datapack.latest Seaskipper 10003


# throw error for unsupported minecraft versions
execute if score VERSION$minecraft.current DatapackManager < VERSION$minecraft.backward Seaskipper if score VERSION$ignorecompatibility.backward Seaskipper = BOOL$false DatapackManager as @a at @s run function seaskipper:packages/versioning/throw/datapacknotcompatible

execute if score VERSION$minecraft.current DatapackManager > VERSION$minecraft.forward Seaskipper if score VERSION$ignorecompatibility.forward Seaskipper = BOOL$false DatapackManager as @a at @s run function seaskipper:packages/versioning/throw/datapacknotcompatible


# throw error for all versions newer than the currently supported version
execute if score VERSION$datapack.current Seaskipper < VERSION$datapack.latest Seaskipper as @a at @s run function seaskipper:packages/versioning/throw/datapackunknownversion