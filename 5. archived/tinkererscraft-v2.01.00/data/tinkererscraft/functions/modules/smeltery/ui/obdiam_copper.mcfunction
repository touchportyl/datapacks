#> -----------------------------------------------
#> Tinkerer's Craft Datapack
#> This code is protected by the GNU GPLv3 License
#> © 2020 Portyl Studios
#> https://portylstudios.com
#> -----------------------------------------------


#> obdiam_copper (references: ../modules/smeltery/ui/controller)
# this code swaps the display from obdiam to copper


execute as @s[tag=TC_outputobdiam,scores={TC_lObdiam=0}] at @s if block ^ ^1 ^1 minecraft:black_stained_glass run tag @s add TC_outputcopper
execute as @s[tag=TC_outputobdiam] at @s unless block ^ ^1 ^1 minecraft:black_stained_glass run tag @s add TC_outputcopper
execute as @s[scores={TC_OutputTimer=1..}] at @s unless block ^ ^1 ^1 minecraft:black_stained_glass run tag @s add TC_stoppour
execute as @s[tag=TC_outputobdiam] at @s unless block ^ ^1 ^1 minecraft:black_stained_glass run setblock ^ ^1 ^1 minecraft:black_stained_glass replace
execute as @s[tag=TC_outputcopper] at @s if block ^ ^1 ^1 minecraft:black_stained_glass run tag @s remove TC_outputobdiam


#> End of file
#> -----------
