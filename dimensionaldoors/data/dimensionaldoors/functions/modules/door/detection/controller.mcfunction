#> -----------------------------------------------
#> Dimensional Doors Datapack
#> This code is protected by the GNU GPLv3 License
#> © 2020 Portyl Studios
#> https://portylstudios.com
#> -----------------------------------------------


#> detection controller
# this code detects when a player or entity goes through a door


#> portal detection

execute if entity @s[tag=DD_left] run function dimensionaldoors:modules/door/detection/left
execute if entity @s[tag=DD_right] run function dimensionaldoors:modules/door/detection/right

# mark for removal
execute unless block ~ ~ ~ minecraft:oak_door run tag @s add DD_destroy


#> End of file
#> -----------
