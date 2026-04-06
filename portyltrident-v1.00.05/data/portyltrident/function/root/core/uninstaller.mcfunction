# remove all entities with the master tag
kill @e[type=!player,tag=PortylTrident]
tag @a remove PortylTrident

# scoreboards
scoreboard objectives remove PortylTrident
#scoreboard objectives remove PT_scoreboard
function portyltrident:packages/configtriggers/destroy

function portyltrident:root/core/disable