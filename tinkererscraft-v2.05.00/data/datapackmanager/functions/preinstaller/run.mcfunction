tellraw @a[tag=debug] [{"text":"[ preinstaller/run.mcfunction ]","color":"gray"}]

# create master scoreboard
scoreboard objectives add DatapackManager dummy [{"text":"Datapack Manager","color":"white"}]

# set constants
scoreboard players set $bool.false DatapackManager 0
scoreboard players set $bool.true DatapackManager 1

# load config
function datapackmanager:config

# check minecraft version
execute unless score $minecraft.version DatapackManager = $config.versioning.minecraft.current DatapackManager run function datapackmanager:preinstaller/versioning/minecraft/check

# check manager version
execute unless score $manager.version DatapackManager = $config.versioning.manager.current DatapackManager run function datapackmanager:preinstaller/versioning/manager/check

# check datapack version
execute unless score $datapack.version DatapackManager = $config.versioning.datapack.current DatapackManager run function datapackmanager:preinstaller/versioning/datapack/check

# run datapack
execute if score $minecraft.version DatapackManager >= $config.versioning.minecraft.current DatapackManager if score $manager.version DatapackManager >= $config.versioning.manager.current DatapackManager if score $datapack.version DatapackManager >= $config.versioning.datapack.current DatapackManager run function tinkererscraft:config