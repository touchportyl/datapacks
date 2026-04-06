# remove all entities with the master tag
kill @e[type=!player,tag=AroundTheWorld]
tag @a remove AroundTheWorld

# scoreboards
scoreboard objectives remove AroundTheWorld
#scoreboard objectives remove AW_scoreboard
function aroundtheworld:packages/configtriggers/destroy

function aroundtheworld:root/core/disable