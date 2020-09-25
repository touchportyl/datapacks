#> -----------------------------------------------
#> Harvester Datapack
#> This code is protected by the GNU GPLv3 License
#> © 2020 Portyl Studios
#> https://portylstudios.com
#> -----------------------------------------------


#> positioner (references: ../packages/api/main_tc)
# this code positions the harvesting controller
#
# manually detect the 9 plots because it's simpler
# 9 2 3
# 8 1 4
# 7 6 5


execute positioned ~ ~ ~ run function harvester:packages/api/tinkererscraft/controller
execute positioned ~1 ~ ~ run function harvester:packages/api/tinkererscraft/controller
execute positioned ~1 ~ ~1 run function harvester:packages/api/tinkererscraft/controller
execute positioned ~ ~ ~1 run function harvester:packages/api/tinkererscraft/controller
execute positioned ~-1 ~ ~1 run function harvester:packages/api/tinkererscraft/controller
execute positioned ~-1 ~ ~ run function harvester:packages/api/tinkererscraft/controller
execute positioned ~-1 ~ ~-1 run function harvester:packages/api/tinkererscraft/controller
execute positioned ~ ~ ~-1 run function harvester:packages/api/tinkererscraft/controller
execute positioned ~1 ~ ~-1 run function harvester:packages/api/tinkererscraft/controller


#> End of file
#> -----------
