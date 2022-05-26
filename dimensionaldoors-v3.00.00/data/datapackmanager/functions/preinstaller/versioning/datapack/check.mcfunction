tellraw @a[tag=debug] [{"text":"> preinstaller/versioning/datapack/check.mcfunction","color":"gray"}]

# set default
execute unless score VERSION$datapack.latest DatapackManager matches 10000.. run scoreboard players set VERSION$datapack.latest DatapackManager 10000

# update from latest to current version
execute unless score VERSION$datapack.latest DatapackManager matches 20000.. run function datapackmanager:preinstaller/versioning/datapack/updates/v2.00.00
execute unless score VERSION$datapack.latest DatapackManager matches 30000.. run function datapackmanager:preinstaller/versioning/datapack/updates/v3.00.00


# throw error for all versions newer than the currently supported version
execute if score VERSION$datapack.current DatapackManager > VERSION$datapack.latest DatapackManager run function datapackmanager:preinstaller/versioning/datapack/throw/notcompatible
