tellraw @a[tag=debug] [{"text":"[ preinstaller/versioning/datapack/check.mcfunction ]","color":"gray"}]

# set default
execute unless score $datapack.version DatapackManager matches 10000.. run scoreboard players set $datapack.version DatapackManager 10000

# update to current version
#execute unless score $datapack.version DatapackManager matches 10000.. run function datapackmanager:preinstaller/versioning/datapack/updates/1.00.00

# throw error for all versions older than the currently supported version
#execute unless score $datapack.version DatapackManager >= $config.versioning.datapack.current DatapackManager run function datapackmanager:errorcodes/olddatapackversion
#execute unless score $datapack.version DatapackManager >= $config.versioning.datapack.current DatapackManager run scoreboard players set $debug.error.forcedisablepack DatapackManager 1
#execute unless score $datapack.version DatapackManager >= $config.versioning.datapack.current DatapackManager run function datapackmanager:config

# throw error for all versions newer than the currently supported version
execute if score $datapack.version DatapackManager > $config.versioning.datapack.forward DatapackManager run function datapackmanager:errorcodes/futuredatapackversion
