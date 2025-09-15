# notify
tellraw @a [{"text":"","color":"gray"},{"text":" + ","color":"green"},{"text":"Dimensional Doors","color":"white"},{"text":" >","color":"white"},{"text":" Installed."}]

# load the default config
function dimensionaldoors:defaultconfig

function dimensionaldoors:packages/configtriggers/create

# create objectives
# 16 letter limit for objective names
# XX_XXXXXXXXXXXXX
#scoreboard objectives add DD_scoreboard dummy {"text":"Dimensional Doors: Scoreboard","color":"white"}