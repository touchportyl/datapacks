tellraw @a[tag=aw_debug] [{"text":"AW","color":"blue"},{"text":" > packages/versioning/check.mcfunction","color":"gray"}]

# set default
execute unless score VERSION$datapack.latest AroundTheWorld matches 10000.. run scoreboard players set VERSION$datapack.latest AroundTheWorld 10000

# update from latest to current version
#execute unless score VERSION$datapack.latest AroundTheWorld matches 20000.. run function aroundtheworld:packages/versioning/updates/v2.00.00
#execute unless score VERSION$datapack.latest AroundTheWorld matches 30000.. run function aroundtheworld:packages/versioning/updates/v3.00.00

execute unless score VERSION$datapack.latest AroundTheWorld matches 10101.. run scoreboard players set VERSION$datapack.latest AroundTheWorld 10101


# throw error for unsupported minecraft versions
execute if score VERSION$minecraft.current DatapackManager < VERSION$minecraft.backward AroundTheWorld if score VERSION$ignorecompatibility.backward AroundTheWorld = BOOL$false DatapackManager run function aroundtheworld:packages/versioning/throw/mcnotcompatible

execute if score VERSION$minecraft.current DatapackManager > VERSION$minecraft.forward AroundTheWorld if score VERSION$ignorecompatibility.forward AroundTheWorld = BOOL$false DatapackManager run function aroundtheworld:packages/versioning/throw/mcnotcompatible


# throw error for all versions newer than the currently supported version
execute if score VERSION$datapack.current AroundTheWorld < VERSION$datapack.latest AroundTheWorld run function aroundtheworld:packages/versioning/throw/dpnotcompatible