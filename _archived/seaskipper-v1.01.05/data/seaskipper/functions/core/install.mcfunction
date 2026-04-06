tellraw @a[tag=developer] {"text":""}
tellraw @a[tag=developer] [{"text":"","color":"gray"},{"text":"> "},{"text":"Seaskipper","color":"white","underlined":true},{"text":" by "},{"text":"touchportyl","color":"light_purple"}]

# clear schedules
schedule clear seaskipper:npc/behaviors/generic/ambientparticles
schedule clear seaskipper:core/tick
schedule clear seaskipper:endermitescript/tick

# team setup
team add noCollision {"text":"noCollision"}
team modify noCollision color white
team modify noCollision collisionRule never
team modify noCollision seeFriendlyInvisibles false

# scoreboard setup
scoreboard objectives remove dialogueTracker
scoreboard objectives add dialogueTracker dummy
scoreboard objectives add talkedToVillager minecraft.custom:minecraft.talked_to_villager


# start ambient ticker
schedule function seaskipper:npc/behaviors/generic/ambientparticles 1s


# start tick
schedule function seaskipper:core/tick 1s

# start endermite script
schedule function seaskipper:endermitescript/tick 1s