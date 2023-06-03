tellraw @a[tag=$datapackID_lower_debug] [{"text":"$datapackID","color":"$datapackColor"},{"text":" > packages/versioning/check.mcfunction","color":"gray"}]

# set default
execute unless score VERSION$datapack.latest $datapackFullName matches 10000.. run scoreboard players set VERSION$datapack.latest $datapackFullName 10000

# update from latest to current version
#execute unless score VERSION$datapack.latest $datapackFullName matches 20000.. run function $datapackFullName_lower:packages/versioning/updates/v2.00.00
#execute unless score VERSION$datapack.latest $datapackFullName matches 30000.. run function $datapackFullName_lower:packages/versioning/updates/v3.00.00


# throw error for unsupported minecraft versions
execute if score VERSION$minecraft.current DatapackManager < VERSION$minecraft.backward $datapackFullName if score VERSION$ignorecompatibility.backward $datapackFullName = BOOL$false DatapackManager run function $datapackFullName_lower:packages/versioning/throw/mcnotcompatible

execute if score VERSION$minecraft.current DatapackManager > VERSION$minecraft.forward $datapackFullName if score VERSION$ignorecompatibility.forward $datapackFullName = BOOL$false DatapackManager run function $datapackFullName_lower:packages/versioning/throw/mcnotcompatible


# throw error for all versions newer than the currently supported version
execute if score VERSION$datapack.current $datapackFullName < VERSION$datapack.latest $datapackFullName run function $datapackFullName_lower:packages/versioning/throw/dpnotcompatible