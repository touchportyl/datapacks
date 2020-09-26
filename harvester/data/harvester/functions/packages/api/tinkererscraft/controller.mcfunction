#> -----------------------------------------------
#> Harvester Datapack
#> This code is protected by the GNU GPLv3 License
#> © 2020 Portyl Studios
#> https://portylstudios.com
#> -----------------------------------------------


#> controller (references: ../packages/api/tinkererscraft/positioner)
# this code controls the harvesting process


#> irgol
function harvester:packages/api/tinkererscraft/irgol

#> obdiam
execute if block ~ ~1 ~ minecraft:potatoes[age=7] run function harvester:packages/api/tinkererscraft/obdiam


#> End of file
#> -----------
