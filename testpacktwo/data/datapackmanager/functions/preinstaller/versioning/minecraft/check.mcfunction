tellraw @a[tag=debug] [{"text":"[ preinstaller/versioning/minecraft/check.mcfunction ]","color":"gray"}]

# set default
execute unless score $minecraft.version DatapackManager matches 112.. run scoreboard players set $minecraft.version DatapackManager 112

# check for all known versions
execute unless score $minecraft.version DatapackManager matches 113.. run function datapackmanager:preinstaller/versioning/minecraft/versions/1.13
execute unless score $minecraft.version DatapackManager matches 114.. run function datapackmanager:preinstaller/versioning/minecraft/versions/1.14
execute unless score $minecraft.version DatapackManager matches 115.. run function datapackmanager:preinstaller/versioning/minecraft/versions/1.15
execute unless score $minecraft.version DatapackManager matches 116.. run function datapackmanager:preinstaller/versioning/minecraft/versions/1.16
execute unless score $minecraft.version DatapackManager matches 117.. run function datapackmanager:preinstaller/versioning/minecraft/versions/1.17

# throw error for all versions older than the currently supported version
execute unless score $minecraft.version DatapackManager >= $config.versioning.minecraft.current DatapackManager run function datapackmanager:errorcodes/oldminecraftversion
execute unless score $minecraft.version DatapackManager >= $config.versioning.minecraft.current DatapackManager run scoreboard players set $debug.error.forcedisablepack DatapackManager 1
execute unless score $minecraft.version DatapackManager >= $config.versioning.minecraft.current DatapackManager run function datapackmanager:config

# throw error for all versions newer than the currently supported version
execute if score $minecraft.version DatapackManager > $config.versioning.minecraft.forward DatapackManager run function datapackmanager:errorcodes/futureminecraftversion
