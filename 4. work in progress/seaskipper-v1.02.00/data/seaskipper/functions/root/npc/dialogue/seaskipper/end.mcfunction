execute at @s as @e[tag=Seaskipper,tag=SS_npc,distance=..4,sort=nearest,limit=1] run function seaskipper:effects/villager/end

tellraw @s {"text":""}
tellraw @s {"text":""}
tellraw @s {"text":""}
tellraw @s {"text":""}
tellraw @s {"text":""}
tellraw @s [{"text":"Seaskipper: ","color":"dark_green"},{"text":"Here we are. We've reached your destination! Come visit me anytime you'd like make a trip.","color":"green"}]
tellraw @s {"text":""}


# end conversation
scoreboard players reset @s SS_DialogueTracker