#> -----------------------------------------------
#> Harvester Datapack
#> This code is protected by the GNU GPLv3 License
#> © 2020 Portyl Studios
#> https://portylstudios.com
#> -----------------------------------------------


#> api harvester (references: ../tick)
# this code allows harvester to work with Tinkerer's Craft


#> inventory check
function harvester:packages/api/tinkererscraft/hoe
function harvester:modules/inventory/seeds


#> positioner > controller
execute if entity @s[tag=H_api_3x3,x_rotation=0..90] if block ~ ~ ~ minecraft:farmland run function harvester:packages/api/tinkererscraft/positioner/3x3
execute if entity @s[tag=H_api_3x3,x_rotation=0..90] unless block ~ ~ ~ minecraft:farmland positioned ~ ~-1 ~ run function harvester:packages/api/tinkererscraft/positioner/3x3

execute if entity @s[tag=H_api_3x3_netherwart,x_rotation=0..90] if block ~ ~ ~ minecraft:farmland run function harvester:packages/api/tinkererscraft/positioner/3x3
execute if entity @s[tag=H_api_3x3_netherwart,x_rotation=0..90] unless block ~ ~ ~ minecraft:farmland positioned ~ ~-1 ~ run function harvester:packages/api/tinkererscraft/positioner/3x3


# clear tags
function harvester:packages/api/tinkererscraft/garbage_collection
function harvester:modules/garbage_collection


#> End of file
#> -----------
