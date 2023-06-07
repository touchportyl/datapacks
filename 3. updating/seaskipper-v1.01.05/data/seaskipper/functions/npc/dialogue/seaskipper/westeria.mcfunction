# catch: ignore if not in the correct dialogue state
tag @s remove SS_ignore
execute unless score @s dialogueTracker matches 1 run tag @s add SS_ignore

# continue
scoreboard players set @s[tag=!SS_ignore] dialogueTracker 3
execute at @s[tag=!SS_ignore] as @e[tag=seaskipper,tag=npc,distance=..4,sort=nearest,limit=1] run playsound entity.villager.no neutral @a ~ ~ ~ 1 0.8 0

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