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

#> filter > positioner > controller
execute unless entity @s[tag=!H_irgol,tag=!H_obdiam] run function harvester:packages/api/tinkererscraft/filter


#> End of file
#> -----------
