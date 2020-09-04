#> -----------------------------------------------
#> Harvester Datapack
#> This code is protected by the GNU GPLv3 License
#> © 2020 Portyl Studios
#> https://portylstudios.com
#> -----------------------------------------------


#> inventory_tag
execute as @s run function harvester:modules/inventory_tag

#> harvest_wheat
execute as @s at @s if block ~ ~1 ~ minecraft:wheat[age=7] run function harvester:modules/harvest_wheat

#> harvest_potato
execute as @s at @s if block ~ ~1 ~ minecraft:potatoes[age=7] run function harvester:modules/harvest_potato

#> harvest_carrot
execute as @s at @s if block ~ ~1 ~ minecraft:carrots[age=7] run function harvester:modules/harvest_carrot

#> harvest_beetroot
execute as @s at @s if block ~ ~1 ~ minecraft:beetroots[age=3] run function harvester:modules/harvest_beetroot

#> harvest_netherwart
execute as @s at @s if block ~ ~1 ~ minecraft:nether_wart[age=3] run function harvester:modules/harvest_netherwart









#> End of file
#> -----------
