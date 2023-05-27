#> -----------------------------------------------
#> Harvester Datapack
#> This code is protected by the GNU GPLv3 License
#> © 2020 Portyl Studios
#> https://portylstudios.com
#> -----------------------------------------------


#> positioner (references: ../main)
# this code positions the harvesting controller
#
# manually detect the 5 plots because it's simpler
#   2
# 5 1 3
#   4


execute positioned ~ ~ ~ run function harvester:modules/harvest/controller
execute positioned ~1 ~ ~ run function harvester:modules/harvest/controller
execute positioned ~ ~ ~1 run function harvester:modules/harvest/controller
execute positioned ~-1 ~ ~ run function harvester:modules/harvest/controller
execute positioned ~ ~ ~-1 run function harvester:modules/harvest/controller


#> End of file
#> -----------
