#> -----------------------------------------------
#> Tinkerer's Craft Datapack
#> This code is protected by the GNU GPLv3 License
#> © 2020 Portyl Studios
#> https://portylstudios.com
#> -----------------------------------------------


#> obsidian_irgol (references: ../modules/smeltery/ui/controller)
# this code swaps the display from obsidian to irgol


execute as @s[tag=TC_outputobsidian,scores={TC_lObsidian=0}] at @s if block ^ ^1 ^1 minecraft:black_stained_glass run tag @s add TC_outputirgol
execute as @s[tag=TC_outputobsidian] at @s unless block ^ ^1 ^1 minecraft:black_stained_glass run tag @s add TC_outputirgol
execute as @s[scores={TC_OutputTimer=1..}] at @s unless block ^ ^1 ^1 minecraft:black_stained_glass run tag @s add TC_stoppour
execute as @s[tag=TC_outputobsidian] at @s unless block ^ ^1 ^1 minecraft:black_stained_glass run setblock ^ ^1 ^1 minecraft:black_stained_glass replace
execute as @s[tag=TC_outputirgol] at @s if block ^ ^1 ^1 minecraft:black_stained_glass run tag @s remove TC_outputobsidian


#> End of file
#> -----------
