#> -----------------------------------------------
#> Tinkerer's Craft Datapack
#> This code is protected by the GNU GPLv3 License
#> © 2020 Portyl Studios
#> https://portylstudios.com
#> -----------------------------------------------


#> iron_gold (references: ../modules/smeltery/ui/controller)
# this code swaps the display from iron to gold


execute as @s[tag=TC_outputiron,scores={TC_lIron=0}] at @s if block ^ ^1 ^1 minecraft:black_stained_glass run tag @s add TC_outputgold
execute as @s[tag=TC_outputiron] at @s unless block ^ ^1 ^1 minecraft:black_stained_glass run tag @s add TC_outputgold
execute as @s[scores={TC_OutputTimer=1..}] at @s unless block ^ ^1 ^1 minecraft:black_stained_glass run tag @s add TC_stoppour
execute as @s[tag=TC_outputiron] at @s unless block ^ ^1 ^1 minecraft:black_stained_glass run setblock ^ ^1 ^1 minecraft:black_stained_glass replace
execute as @s[tag=TC_outputgold] at @s if block ^ ^1 ^1 minecraft:black_stained_glass run tag @s remove TC_outputiron


#> End of file
#> -----------
