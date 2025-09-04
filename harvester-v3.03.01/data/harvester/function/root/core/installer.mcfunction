# notify
tellraw @a [{"text":"","color":"gray"},{"text":" + ","color":"green"},{"text":"Harvester","color":"white"},{"text":" >","color":"white"},{"text":" Installed."}]

# compatibility: porting version number from the old v1.3/v2.0 system to new datapack manager
scoreboard players operation VERSION$datapack.latest Harvester = $h.version TP_version

# load the default config
function harvester:defaultconfig
function harvester:packages/configtriggers/create