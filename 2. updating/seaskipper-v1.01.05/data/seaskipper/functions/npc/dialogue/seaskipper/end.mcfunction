execute at @s as @e[tag=seaskipper,tag=npc,distance=..4,sort=nearest,limit=1] run playsound entity.villager.celebrate neutral @a ~ ~ ~ 1 0.8 0

tellraw @s {"text":""}
tellraw @s {"text":""}
tellraw @s {"text":""}
tellraw @s {"text":""}
tellraw @s {"text":""}
tellraw @s [{"text":"Seaskipper: ","color":"dark_green"},{"text":"Here we are. We've reached your destination! Come visit me anytime you'd like make a trip.","color":"green"}]
tellraw @s {"text":""}


# end conversation
scoreboard players reset @s dialogueTracker
