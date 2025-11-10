# unload packages
function seaskipper:packages/endermitescript/unload

# reset
scoreboard objectives remove SS_DialogueTracker
scoreboard objectives remove SS_TalkedToVillager
team remove SS_NoCollision
kill @e[tag=Seaskipper]
tag @e[tag=ES_ignore] remove ES_ignore
tag @e[tag=SS_ignore] remove SS_ignore

# scoreboards
scoreboard objectives remove Seaskipper

function seaskipper:root/core/disable