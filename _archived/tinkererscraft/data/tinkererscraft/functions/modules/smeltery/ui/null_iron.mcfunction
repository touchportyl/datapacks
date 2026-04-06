#> -----------------------------------------------
#> Tinkerer's Craft Datapack
#> This code is protected by the GNU GPLv3 License
#> © 2020 Portyl Studios
#> https://portylstudios.com
#> -----------------------------------------------


#> null_iron (references: ../modules/smeltery/ui/controller)
# this code swaps the display from the tutorial display to iron


execute as @s[tag=TC_outputnull] at @s unless block ^ ^1 ^1 minecraft:black_stained_glass run tag @s add TC_outputiron
execute as @s[tag=TC_outputnull] at @s unless block ^ ^1 ^1 minecraft:black_stained_glass run setblock ^ ^1 ^1 minecraft:black_stained_glass replace
execute as @s[tag=TC_outputiron] at @s if block ^ ^1 ^1 minecraft:black_stained_glass run tag @s remove TC_outputnull


#> End of file
#> -----------
