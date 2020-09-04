#> -----------------------------------------------
#> Tinkerer's Craft Datapack
#> This code is protected by the GNU GPLv3 License
#> © 2020 Portyl Studios
#> https://portylstudios.com
#> -----------------------------------------------


#> ui display
# this code controls the ore display for all the smelteries
# - cycle tags
# - set values based on tag


#if break glass switch display - tutorial to iron
execute as @e[tag=TC_outputnull] at @s unless block ^ ^1 ^1 minecraft:black_stained_glass run tag @s add TC_outputiron
execute as @s[tag=TC_outputnull] at @s unless block ^ ^1 ^1 minecraft:black_stained_glass run setblock ^ ^1 ^1 minecraft:black_stained_glass replace
execute as @s[tag=TC_outputiron] at @s if block ^ ^1 ^1 minecraft:black_stained_glass run tag @s remove TC_outputnull

#if break glass switch display - iron to gold
execute as @s[tag=TC_outputiron,scores={TC_lIron=0}] at @s if block ^ ^1 ^1 minecraft:black_stained_glass run tag @s add TC_outputgold
execute as @s[tag=TC_outputiron] at @s unless block ^ ^1 ^1 minecraft:black_stained_glass run tag @s add TC_outputgold
execute as @s[scores={TC_OutputTimer=1..}] at @s unless block ^ ^1 ^1 minecraft:black_stained_glass run tag @s add TC_stoppour
execute as @s[tag=TC_outputiron] at @s unless block ^ ^1 ^1 minecraft:black_stained_glass run setblock ^ ^1 ^1 minecraft:black_stained_glass replace
execute as @s[tag=TC_outputgold] at @s if block ^ ^1 ^1 minecraft:black_stained_glass run tag @s remove TC_outputiron

#if break glass switch display - gold to obsidian
execute as @s[tag=TC_outputgold,scores={TC_lGold=0}] at @s if block ^ ^1 ^1 minecraft:black_stained_glass run tag @s add TC_outputobsidian
execute as @s[tag=TC_outputgold] at @s unless block ^ ^1 ^1 minecraft:black_stained_glass run tag @s add TC_outputobsidian
execute as @s[scores={TC_OutputTimer=1..}] at @s unless block ^ ^1 ^1 minecraft:black_stained_glass run tag @s add TC_stoppour
execute as @s[tag=TC_outputgold] at @s unless block ^ ^1 ^1 minecraft:black_stained_glass run setblock ^ ^1 ^1 minecraft:black_stained_glass replace
execute as @s[tag=TC_outputobsidian] at @s if block ^ ^1 ^1 minecraft:black_stained_glass run tag @s remove TC_outputgold

#if break glass switch display - obsidian to irgol
execute as @s[tag=TC_outputobsidian,scores={TC_lObsidian=0}] at @s if block ^ ^1 ^1 minecraft:black_stained_glass run tag @s add TC_outputirgol
execute as @s[tag=TC_outputobsidian] at @s unless block ^ ^1 ^1 minecraft:black_stained_glass run tag @s add TC_outputirgol
execute as @s[scores={TC_OutputTimer=1..}] at @s unless block ^ ^1 ^1 minecraft:black_stained_glass run tag @s add TC_stoppour
execute as @s[tag=TC_outputobsidian] at @s unless block ^ ^1 ^1 minecraft:black_stained_glass run setblock ^ ^1 ^1 minecraft:black_stained_glass replace
execute as @s[tag=TC_outputirgol] at @s if block ^ ^1 ^1 minecraft:black_stained_glass run tag @s remove TC_outputobsidian

#if break glass switch display - irgol to obdiam
execute as @s[tag=TC_outputirgol,scores={TC_lIrgol=0}] at @s if block ^ ^1 ^1 minecraft:black_stained_glass run tag @s add TC_outputobdiam
execute as @s[tag=TC_outputirgol] at @s unless block ^ ^1 ^1 minecraft:black_stained_glass run tag @s add TC_outputobdiam
execute as @s[scores={TC_OutputTimer=1..}] at @s unless block ^ ^1 ^1 minecraft:black_stained_glass run tag @s add TC_stoppour
execute as @s[tag=TC_outputirgol] at @s unless block ^ ^1 ^1 minecraft:black_stained_glass run setblock ^ ^1 ^1 minecraft:black_stained_glass replace
execute as @s[tag=TC_outputobdiam] at @s if block ^ ^1 ^1 minecraft:black_stained_glass run tag @s remove TC_outputirgol

#if break glass switch display - obdiam to iron
execute as @s[tag=TC_outputobdiam,scores={TC_lObdiam=0}] at @s if block ^ ^1 ^1 minecraft:black_stained_glass run tag @s add TC_outputiron
execute as @s[tag=TC_outputobdiam] at @s unless block ^ ^1 ^1 minecraft:black_stained_glass run tag @s add TC_outputiron
execute as @s[scores={TC_OutputTimer=1..}] at @s unless block ^ ^1 ^1 minecraft:black_stained_glass run tag @s add TC_stoppour
execute as @s[tag=TC_outputobdiam] at @s unless block ^ ^1 ^1 minecraft:black_stained_glass run setblock ^ ^1 ^1 minecraft:black_stained_glass replace
execute as @s[tag=TC_outputiron] at @s if block ^ ^1 ^1 minecraft:black_stained_glass run tag @s remove TC_outputobdiam


#swap ore displays
execute as @s[tag=TC_outputiron] at @s positioned ^ ^0.6 ^1 run data modify entity @e[tag=TC_display,tag=TC_ore,distance=..1,limit=1] CustomName set value '{"text":"Iron","color":"gray"}'

execute as @s[tag=TC_outputgold] at @s positioned ^ ^0.6 ^1 run data modify entity @e[tag=TC_display,tag=TC_ore,distance=..1,limit=1] CustomName set value '{"text":"Gold","color":"yellow"}'

execute as @s[tag=TC_outputobsidian] at @s positioned ^ ^0.6 ^1 run data modify entity @e[tag=TC_display,tag=TC_ore,distance=..1,limit=1] CustomName set value '{"text":"Obsidian","color":"dark_gray"}'

execute as @s[tag=TC_outputirgol] at @s positioned ^ ^0.6 ^1 run data modify entity @e[tag=TC_display,tag=TC_ore,distance=..1,limit=1] CustomName set value '{"text":"Irgol","color":"gold"}'

execute as @s[tag=TC_outputobdiam] at @s positioned ^ ^0.6 ^1 run data modify entity @e[tag=TC_display,tag=TC_ore,distance=..1,limit=1] CustomName set value '{"text":"Obdiam","color":"dark_red"}'


#place sign (text parser)
execute as @s at @s run setblock ^ ^1 ^2 minecraft:oak_sign replace

#parse scoreboard on sign Text1
execute as @s[tag=TC_outputiron] at @s run data modify block ^ ^1 ^2 Text1 set value '{"score":{"name":"@e[tag=TC_smeltery,tag=TC_outputiron,distance=..4,limit=1]","objective":"TC_lIron"}}'

execute as @s[tag=TC_outputgold] at @s run data modify block ^ ^1 ^2 Text1 set value '{"score":{"name":"@e[tag=TC_smeltery,tag=TC_outputgold,distance=..4,limit=1]","objective":"TC_lGold"}}'

execute as @s[tag=TC_outputobsidian] at @s run data modify block ^ ^1 ^2 Text1 set value '{"score":{"name":"@e[tag=TC_smeltery,tag=TC_outputobsidian,distance=..4,limit=1]","objective":"TC_lObsidian"}}'

execute as @s[tag=TC_outputirgol] at @s run data modify block ^ ^1 ^2 Text1 set value '{"score":{"name":"@e[tag=TC_smeltery,tag=TC_outputirgol,distance=..4,limit=1]","objective":"TC_lIrgol"}}'

execute as @s[tag=TC_outputobdiam] at @s run data modify block ^ ^1 ^2 Text1 set value '{"score":{"name":"@e[tag=TC_smeltery,tag=TC_outputobdiam,distance=..4,limit=1]","objective":"TC_lObdiam"}}'


#transfer parsed text into custom name
execute as @s[tag=!TC_outputnull] at @s run data modify entity @e[tag=TC_display,tag=TC_number,distance=..2,limit=1] CustomName set from block ^ ^1 ^2 Text1

#remove sign
execute as @s at @s run setblock ^ ^1 ^2 minecraft:air replace


#> End of file
#> -----------
