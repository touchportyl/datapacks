#> -----------------------------------------------
#> Tinkerer's Craft Datapack
#> This code is protected by the GNU GPLv3 License
#> © 2020 Portyl Studios
#> https://portylstudios.com
#> -----------------------------------------------


#> gold_obsidian (references: ../modules/smeltery/ui/controller)
# this code swaps the display from gold to obsidian


execute as @s[tag=TC_outputgold,scores={TC_lGold=0}] at @s if block ^ ^1 ^1 minecraft:black_stained_glass run tag @s add TC_outputobsidian
execute as @s[tag=TC_outputgold] at @s unless block ^ ^1 ^1 minecraft:black_stained_glass run tag @s add TC_outputobsidian
execute as @s[scores={TC_OutputTimer=1..}] at @s unless block ^ ^1 ^1 minecraft:black_stained_glass run tag @s add TC_stoppour
execute as @s[tag=TC_outputgold] at @s unless block ^ ^1 ^1 minecraft:black_stained_glass run setblock ^ ^1 ^1 minecraft:black_stained_glass replace
execute as @s[tag=TC_outputobsidian] at @s if block ^ ^1 ^1 minecraft:black_stained_glass run tag @s remove TC_outputgold


#> End of file
#> -----------
