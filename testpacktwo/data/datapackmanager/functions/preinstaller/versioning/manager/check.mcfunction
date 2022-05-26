tellraw @a[tag=debug] [{"text":"[ preinstaller/versioning/manager/check.mcfunction ]","color":"gray"}]

# set default
execute unless score $manager.version DatapackManager matches 10000.. run scoreboard players set $manager.version DatapackManager 10000

# update to current version
execute unless score $manager.version DatapackManager matches 113.. run function datapackmanager:preinstaller/versioning/manager/updates/1.00.00

# throw error for all versions older than the currently supported version
execute unless score $manager.version DatapackManager >= $config.versioning.manager.current DatapackManager run function datapackmanager:errorcodes/oldmanagerversion
execute unless score $manager.version DatapackManager >= $config.versioning.manager.current DatapackManager run scoreboard players set $debug.error.forcedisablepack DatapackManager 1
execute unless score $manager.version DatapackManager >= $config.versioning.manager.current DatapackManager run function datapackmanager:config

# throw error for all versions newer than the currently supported version
execute if score $manager.version DatapackManager > $config.versioning.manager.forward DatapackManager run function datapackmanager:errorcodes/futuremanagerversion
