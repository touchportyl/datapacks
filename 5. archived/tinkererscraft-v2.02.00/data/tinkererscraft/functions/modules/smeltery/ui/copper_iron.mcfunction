#> -----------------------------------------------
#> Tinkerer's Craft Datapack
#> This code is protected by the GNU GPLv3 License
#> © 2020 Portyl Studios
#> https://portylstudios.com
#> -----------------------------------------------


#> copper_iron (references: ../modules/smeltery/ui/controller)
# this code swaps the display from copper to iron


execute as @s[tag=TC_outputcopper,scores={TC_lCopper=0}] at @s if block ^ ^1 ^1 minecraft:black_stained_glass run tag @s add TC_outputiron
execute as @s[tag=TC_outputcopper] at @s unless block ^ ^1 ^1 minecraft:black_stained_glass run tag @s add TC_outputiron
execute as @s[scores={TC_OutputTimer=1..}] at @s unless block ^ ^1 ^1 minecraft:black_stained_glass run tag @s add TC_stoppour
execute as @s[tag=TC_outputcopper] at @s unless block ^ ^1 ^1 minecraft:black_stained_glass run setblock ^ ^1 ^1 minecraft:black_stained_glass replace
execute as @s[tag=TC_outputiron] at @s if block ^ ^1 ^1 minecraft:black_stained_glass run tag @s remove TC_outputcopper


#> End of file
#> -----------
