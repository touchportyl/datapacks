# remove all entities with the master tag
kill @e[type=!player,tag=Seaskipper]
tag @a remove Seaskipper

# unload packages
function seaskipper:packages/endermitescript/unload

# reset
scoreboard objectives remove SS_DialogueTracker
scoreboard objectives remove SS_TalkedToVillager
team remove SS_NoCollision
tag @e[tag=SS_ignore] remove SS_ignore
function seaskipper:root/npc/dialogue/triggers/destroy

# scoreboards
scoreboard objectives remove Seaskipper
#scoreboard objectives remove SS_scoreboard
function seaskipper:packages/configtriggers/destroy

function seaskipper:root/core/disable