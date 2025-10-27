# remove all entities with the master tag
kill @e[type=!player,tag=Harvester]
tag @a remove Harvester

# scoreboards
scoreboard objectives remove Harvester
scoreboard objectives remove HV_damagetool
function harvester:packages/configtriggers/destroy

function harvester:root/core/disable