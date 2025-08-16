# catch: ignore if not in the correct dialogue state
tag @s remove SS_ignore
execute unless score @s SS_DialogueTracker matches 1 run tag @s add SS_ignore

# continue
scoreboard players set @s[tag=!SS_ignore] SS_DialogueTracker 3
execute at @s[tag=!SS_ignore] as @e[tag=Seaskipper,tag=SS_npc,distance=..4,sort=nearest,limit=1] run function seaskipper:effects/villager/no

tellraw @s[tag=!SS_ignore] {"text":""}
tellraw @s[tag=!SS_ignore] {"text":""}
tellraw @s[tag=!SS_ignore] {"text":""}
tellraw @s[tag=!SS_ignore] {"text":""}
tellraw @s[tag=!SS_ignore] {"text":""}
tellraw @s[tag=!SS_ignore] [{"text":"Seaskipper: ","color":"dark_green"},{"text":"Westeria doesn't have any ports open for travel at the moment. Maybe next time.","color":"green"}]
tellraw @s[tag=!SS_ignore] {"text":""}

# end conversation
scoreboard players reset @s[tag=!SS_ignore] dialogueTracker

# cleanup
tag @s remove SS_ignore