# remove all entities with the master tag
kill @e[type=!player,tag=DimensionalDoors]
tag @a remove DimensionalDoors

# scoreboards
scoreboard objectives remove DimensionalDoors
#scoreboard objectives remove DD_scoreboard
function dimensionaldoors:packages/configtriggers/destroy

function dimensionaldoors:root/core/disable