# notify
tellraw @a [{"text":"","color":"gray"},{"text":" + ","color":"green"},{"text":"My Datapack","color":"white"},{"text":" >","color":"white"},{"text":" Installed."}]

# load the default config
function mydatapack:defaultconfig
function datapackmanager-1.21:packages/alerts/configurationloaded

function mydatapack:packages/configtriggers/create

# create objectives
# 16 letter limit for objective names
# XX_XXXXXXXXXXXXX
#scoreboard objectives add MD_scoreboard dummy {"text":"My Datapack: Scoreboard","color":"white"}
