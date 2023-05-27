#> -----------------------------------------------
#> Harvester Datapack
#> This code is protected by the GNU GPLv3 License
#> © 2020 Portyl Studios
#> https://portylstudios.com
#> -----------------------------------------------


#> filter
# this filters positioners by tag


execute if entity @s[tag=H_1x1,x_rotation=0..90] if block ~ ~ ~ minecraft:farmland run function harvester:modules/harvest/positioner/1x1
execute if entity @s[tag=H_1x1,x_rotation=0..90] unless block ~ ~ ~ minecraft:farmland positioned ~ ~-1 ~ run function harvester:modules/harvest/positioner/1x1

execute if entity @s[tag=H_3x3_star,x_rotation=0..90] if block ~ ~ ~ minecraft:farmland run function harvester:modules/harvest/positioner/3x3_star
execute if entity @s[tag=H_3x3_star,x_rotation=0..90] unless block ~ ~ ~ minecraft:farmland positioned ~ ~-1 ~ run function harvester:modules/harvest/positioner/3x3_star

execute if entity @s[tag=H_3x3,x_rotation=0..90] if block ~ ~ ~ minecraft:farmland run function harvester:modules/harvest/positioner/3x3
execute if entity @s[tag=H_3x3,x_rotation=0..90] unless block ~ ~ ~ minecraft:farmland positioned ~ ~-1 ~ run function harvester:modules/harvest/positioner/3x3

execute if entity @s[tag=H_3x3_netherwart,x_rotation=0..90] if block ~ ~ ~ minecraft:farmland run function harvester:modules/harvest/positioner/3x3
execute if entity @s[tag=H_3x3_netherwart,x_rotation=0..90] unless block ~ ~ ~ minecraft:farmland positioned ~ ~-1 ~ run function harvester:modules/harvest/positioner/3x3


#> End of file
#> -----------
