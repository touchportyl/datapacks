#> -----------------------------------------------
#> Harvester Datapack
#> This code is protected by the GNU GPLv3 License
#> © 2020 Portyl Studios
#> https://portylstudios.com
#> -----------------------------------------------


#> controller (references: ../modules/harvest/positioner)
# this code controls the harvesting process


#> wheat
execute if block ~ ~1 ~ minecraft:wheat[age=7] run function harvester:modules/harvest/wheat

#> potato
execute if block ~ ~1 ~ minecraft:potatoes[age=7] run function harvester:modules/harvest/potato

#> carrot
execute if block ~ ~1 ~ minecraft:carrots[age=7] run function harvester:modules/harvest/carrot

#> beetroot
execute if block ~ ~1 ~ minecraft:beetroots[age=3] run function harvester:modules/harvest/beetroot

#> netherwart
execute if entity @s[tag=H_api_3x3_netherwart] if block ~ ~1 ~ minecraft:nether_wart[age=3] run function harvester:modules/harvest/netherwart


#> End of file
#> -----------
