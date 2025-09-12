# remove all entities with the master tag
kill @e[type=!player,tag=MyDatapack]
tag @a remove MyDatapack

# scoreboards
scoreboard objectives remove MyDatapack
#scoreboard objectives remove MD_scoreboard
function mydatapack:packages/configtriggers/destroy

function mydatapack:root/core/disable