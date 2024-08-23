# set default
execute unless score VERSION$datapack.latest Seaskipper matches 10000.. run scoreboard players set VERSION$datapack.latest Seaskipper 10000

# update from latest to current version
execute unless score VERSION$datapack.latest Seaskipper matches 10105.. run function seaskipper:packages/versioning/updates/v1.02.00

execute unless score VERSION$datapack.latest Seaskipper matches 10200.. run scoreboard players set VERSION$datapack.latest Seaskipper 10200


# throw error for unsupported minecraft versions
execute if score VERSION$minecraft.current DatapackManager < VERSION$minecraft.backward Seaskipper if score VERSION$ignorecompatibility.backward Seaskipper = BOOL$false DatapackManager run function seaskipper:packages/versioning/throw/minecraftnotcompatible

execute if score VERSION$minecraft.current DatapackManager > VERSION$minecraft.forward Seaskipper if score VERSION$ignorecompatibility.forward Seaskipper = BOOL$false DatapackManager run function seaskipper:packages/versioning/throw/minecraftnotcompatible


# throw error for all versions newer than the currently supported version
#execute if score VERSION$datapack.current Seaskipper < VERSION$datapack.latest Seaskipper run function seaskipper:packages/versioning/throw/datapacknotcompatible
execute if score VERSION$datapack.current Seaskipper < VERSION$datapack.latest Seaskipper run function seaskipper:packages/versioning/throw/datapackunknownversion