#> -----------------------------------------------
#> Tinkerer's Craft Datapack
#> This code is protected by the GNU GPLv3 License
#> © 2020 Portyl Studios
#> https://portylstudios.com
#> -----------------------------------------------


#> tick
# this code is run by minecraft:tick


#> main
execute if score $tc.version TP_version matches 20000 run function tinkererscraft:main

#> api
execute if score $api.tc.h TP_version matches 201 run function harvester:packages/api/api_tc


#> End of file
#> -----------
