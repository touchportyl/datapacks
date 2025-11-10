# catch: ignore if not in the correct dialogue state
tag @s remove SS_ignore
execute unless score @s SS_DialogueTracker matches 1 run tag @s add SS_ignore

# continue
scoreboard players set @s[tag=!SS_ignore] SS_DialogueTracker 3
execute at @s[tag=!SS_ignore] as @e[tag=Seaskipper,tag=SS_npc,distance=..4,sort=nearest,limit=1] run function seaskipper:effects/villager/yes

tellraw @s[tag=!SS_ignore] {"text":""}
tellraw @s[tag=!SS_ignore] {"text":""}
tellraw @s[tag=!SS_ignore] {"text":""}
tellraw @s[tag=!SS_ignore] {"text":""}
tellraw @s[tag=!SS_ignore] {"text":""}
tellraw @s[tag=!SS_ignore] [{"text":"Seaskipper: ","color":"dark_green"},{"text":"Here's the map for Westeria! Let me know where you're headed.","color":"green"}]
tellraw @s[tag=!SS_ignore] {"text":""}


# Ayutthaya
tellraw @s[tag=!SS_ignore] {"text":""}
tellraw @s[tag=!SS_ignore] [{"text":"  Westeria","color":"gold"}]
tellraw @s[tag=!SS_ignore] {"text":""}

#tellraw @s[tag=!SS_ignore] [{"text":"","clickEvent":{"action":"run_command","value":"/function warp:ayutthaya/asoka"}},{"text":"  >> "},{"text":"Temp","color":"red","underlined":true}]

tellraw @s[tag=!SS_ignore] {"text":""}


# cleanup
tag @s remove SS_ignore