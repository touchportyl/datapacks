# notify
tellraw @a [{"text":"","color":"gray"},{"text":" + ","color":"green"},{"text":"Seaskipper","color":"white"},{"text":" >","color":"white"},{"text":" Installed."}]

# load the default config
function seaskipper:defaultconfig


# team setup
team add SS_NoCollision {"text":"No Collision"}
team modify SS_NoCollision color white
team modify SS_NoCollision collisionRule never
team modify SS_NoCollision seeFriendlyInvisibles false

# scoreboard setup
scoreboard objectives remove SS_DialogueTracker
scoreboard objectives add SS_DialogueTracker dummy {"text":"Dialogue Tracker","color":"aqua"}
scoreboard objectives remove SS_TalkedToVillager
scoreboard objectives add SS_TalkedToVillager minecraft.custom:minecraft.talked_to_villager {"text":"Talked To Villager","color":"aqua"}