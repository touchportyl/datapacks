# catch: ignore if not in the correct dialogue state
tag @s remove SS_ignore
execute unless score @s dialogueTracker matches 1 run tag @s add SS_ignore

# continue
scoreboard players set @s[tag=!SS_ignore] dialogueTracker 2
execute at @s[tag=!SS_ignore] as @e[tag=seaskipper,tag=npc,distance=..4,sort=nearest,limit=1] run playsound entity.villager.yes neutral @a ~ ~ ~ 1 0.8 0

tellraw @s[tag=!SS_ignore] {"text":""}
tellraw @s[tag=!SS_ignore] {"text":""}
tellraw @s[tag=!SS_ignore] {"text":""}
tellraw @s[tag=!SS_ignore] {"text":""}
tellraw @s[tag=!SS_ignore] {"text":""}
tellraw @s[tag=!SS_ignore] [{"text":"Seaskipper: ","color":"dark_green"},{"text":"Here's are the available ports for Ayutthaya! Let me know where you're headed.","color":"green"}]
tellraw @s[tag=!SS_ignore] {"text":""}


# Ayutthaya
tellraw @s[tag=!SS_ignore] {"text":""}
tellraw @s[tag=!SS_ignore] [{"text":"  Ayutthaya","color":"gold"}]
tellraw @s[tag=!SS_ignore] {"text":""}

tellraw @s[tag=!SS_ignore] [{"text":"","clickEvent":{"action":"run_command","value":"/function seaskipper:warp/ayutthaya/asoka"}},{"text":"  >> "},{"text":"Asoka","color":"red","underlined":true}]
tellraw @s[tag=!SS_ignore] [{"text":"","clickEvent":{"action":"run_command","value":"/function seaskipper:warp/ayutthaya/mangystau"}},{"text":"  >> "},{"text":"Mangystau","color":"red","underlined":true}]

tellraw @s[tag=!SS_ignore] {"text":""}


# cleanup
tag @s remove SS_ignore