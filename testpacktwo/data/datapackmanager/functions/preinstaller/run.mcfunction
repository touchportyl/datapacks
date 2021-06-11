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

function testpacktwo:install


#execute if score $global.version DatapackManager matches 116..117 unless score $tc.version TP_version matches 20100 run schedule function tinkererscraft:packages/install_checker 3s
#execute if score $global.version DatapackManager matches 116..117 if score $tc.version TP_version matches 20100 run schedule function tinkererscraft:packages/api/api_controller 3s
