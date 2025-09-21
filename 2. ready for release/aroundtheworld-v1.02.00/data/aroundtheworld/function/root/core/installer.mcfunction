# notify
tellraw @a [{"text":"","color":"gray"},{"text":" + ","color":"green"},{"text":"Around The World","color":"white"},{"text":" >","color":"white"},{"text":" Installed."}]

# load the default config
function aroundtheworld:defaultconfig

function aroundtheworld:packages/configtriggers/create

# create objectives
# 16 letter limit for objective names
# XX_XXXXXXXXXXXXX
#scoreboard objectives add AW_scoreboard dummy {"text":"Around The World: Scoreboard","color":"white"}