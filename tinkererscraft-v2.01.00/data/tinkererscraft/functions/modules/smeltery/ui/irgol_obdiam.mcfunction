#> -----------------------------------------------
#> Tinkerer's Craft Datapack
#> This code is protected by the GNU GPLv3 License
#> © 2020 Portyl Studios
#> https://portylstudios.com
#> -----------------------------------------------


#> irgol_obdiam (references: ../modules/smeltery/ui/controller)
# this code swaps the display from irgol to obdiam


execute as @s[tag=TC_outputirgol,scores={TC_lIrgol=0}] at @s if block ^ ^1 ^1 minecraft:black_stained_glass run tag @s add TC_outputobdiam
execute as @s[tag=TC_outputirgol] at @s unless block ^ ^1 ^1 minecraft:black_stained_glass run tag @s add TC_outputobdiam
execute as @s[scores={TC_OutputTimer=1..}] at @s unless block ^ ^1 ^1 minecraft:black_stained_glass run tag @s add TC_stoppour
execute as @s[tag=TC_outputirgol] at @s unless block ^ ^1 ^1 minecraft:black_stained_glass run setblock ^ ^1 ^1 minecraft:black_stained_glass replace
execute as @s[tag=TC_outputobdiam] at @s if block ^ ^1 ^1 minecraft:black_stained_glass run tag @s remove TC_outputirgol


#> End of file
#> -----------
