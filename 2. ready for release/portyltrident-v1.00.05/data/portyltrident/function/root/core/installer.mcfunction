# notify
tellraw @a [{"text":"","color":"gray"},{"text":" + ","color":"green"},{"text":"Portyl Trident","color":"white"},{"text":" >","color":"white"},{"text":" Installed."}]

# load the default config
function portyltrident:defaultconfig

function portyltrident:packages/configtriggers/create

# create objectives
# 16 letter limit for objective names
# XX_XXXXXXXXXXXXX
#scoreboard objectives add PT_scoreboard dummy {"text":"Portyl Trident: Scoreboard","color":"white"}