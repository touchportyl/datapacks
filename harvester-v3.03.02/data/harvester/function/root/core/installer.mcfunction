# notify
tellraw @a [{"text":"","color":"gray"},{"text":" + ","color":"green"},{"text":"Harvester","color":"gold"},{"text":" >","color":"white"},{"text":" Installed."}]

# the version number of the old v1.3/v2.0 system is ported in packages/versioning/check, before the updates run

# load the default config
function harvester:defaultconfig
function datapackmanager-1.21:packages/alerts/configurationloaded

function harvester:packages/configtriggers/create

# create objectives
# 16 letter limit for objective names
# XX_XXXXXXXXXXXXX
scoreboard objectives add HV_damagetool dummy {"text":"Harvester: Damage Tool","color":"gold"}
