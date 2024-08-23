# notify
tellraw @a [{"text":"","color":"gray"},{"text":" + ","color":"green"},{"text":"Seaskipper","color":"white"},{"text":" >","color":"white"},{"text":" Updated from v1.01.05 to v1.02.00."}]

function datapackmanager-1.21:packages/effects/ui/jingle

# update
scoreboard players set VERSION$datapack.latest Seaskipper 10200


# renamed "seaskipper" to "Seaskipper"
tag @e[tag=seaskipper] add Seaskipper
tag @e[tag=seaskipper] remove seaskipper

# renamed "npc" to "SS_npc"
tag @e[tag=npc] add SS_npc
tag @e[tag=npc] remove npc

# renamed "SS_playerNearby" to "SS_playernearby"
tag @e[tag=SS_playerNearby] add SS_playernearby
tag @e[tag=SS_playerNearby] remove SS_playerNearby

# renamed "dialogueTracker" to "SS_DialogueTracker"
scoreboard objectives remove dialogueTracker
scoreboard objectives add SS_DialogueTracker dummy [{"text":"Dialogue Tracker","color":"aqua"}]

# renamed "talkedToVillager" to "SS_TalkedToVillager"
scoreboard objectives remove talkedToVillager
scoreboard objectives add SS_TalkedToVillager dummy [{"text":"Talked To Villager","color":"aqua"}]

# renamed "noCollision" to "SS_NoCollision"
team remove noCollision
team add SS_NoCollision


# cleanup