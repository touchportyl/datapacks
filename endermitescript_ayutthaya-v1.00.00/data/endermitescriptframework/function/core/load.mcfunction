scoreboard objectives add EndermiteScriptFramework dummy {"text":"Endermite Script Framework","color":"light_purple"}

execute unless score FLAG$secret EndermiteScriptFramework matches 259240 run function endermitescriptframework:core/installer

# unload scripts
function endermitescriptframework:scripts/blinkingredstonelamp/_unload
function endermitescriptframework:scripts/drivablevehicles/_unload
function endermitescriptframework:scripts/trafficlight/_unload

# load scripts
schedule function endermitescriptframework:scripts/blinkingredstonelamp/_load 1s
schedule function endermitescriptframework:scripts/drivablevehicles/_load 1s
schedule function endermitescriptframework:scripts/trafficlight/_load 1s

# start the framework's main loop
schedule function endermitescriptframework:core/main 1s

tellraw @a [{"text":"","color":"gray"},{"text":" + ","color":"green"},{"text":"Endermite Script Framework","color":"light_purple"},{"text":" >","color":"white"},{"text":" Loaded."}]