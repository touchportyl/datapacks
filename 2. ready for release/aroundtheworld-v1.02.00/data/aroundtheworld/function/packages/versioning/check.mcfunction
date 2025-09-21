# set default
execute unless score VERSION$datapack.latest AroundTheWorld matches 10000.. run scoreboard players set VERSION$datapack.latest AroundTheWorld 10000
scoreboard players operation FLAG$isActive AroundTheWorld = BOOL$true DatapackManager

# update from latest to current version
#execute unless score VERSION$datapack.latest AroundTheWorld matches 10100.. run function aroundtheworld:packages/versioning/updates/v1.01.00

# set minor version
execute unless score VERSION$datapack.latest AroundTheWorld matches 10200.. run scoreboard players set VERSION$datapack.latest AroundTheWorld 10200


# throw error for unsupported minecraft versions
execute if score VERSION$minecraft.current DatapackManager < VERSION$minecraft.backward AroundTheWorld if score VERSION$ignorecompatibility.backward AroundTheWorld = BOOL$false DatapackManager as @a at @s run function aroundtheworld:packages/versioning/throw/datapacknotcompatible

execute if score VERSION$minecraft.current DatapackManager > VERSION$minecraft.forward AroundTheWorld if score VERSION$ignorecompatibility.forward AroundTheWorld = BOOL$false DatapackManager as @a at @s run function aroundtheworld:packages/versioning/throw/datapacknotcompatible


# throw error for all versions newer than the currently supported version
execute if score VERSION$datapack.current AroundTheWorld < VERSION$datapack.latest AroundTheWorld as @a at @s run function aroundtheworld:packages/versioning/throw/datapackunknownversion