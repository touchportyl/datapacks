# run script uninstallers
function endermitescriptframework:scripts/drivablevehicles/_uninstaller

# reset
kill @e[tag=EndermiteScriptFramework]
tag @e[tag=ESF_ignore] remove ESF_ignore

# remove scoreboard
scoreboard objectives remove EndermiteScriptFramework

tellraw @a [{"text":"","color":"gray"},{"text":" - ","color":"red"},{"text":"Endermite Script Framework","color":"light_purple"},{"text":" >","color":"white"},{"text":" Uninstalled."}]

# disable
datapack disable "endermitescript_ayutthaya-v1.00.00.zip"
datapack disable "endermitescript_ayutthaya-v1.00.00"