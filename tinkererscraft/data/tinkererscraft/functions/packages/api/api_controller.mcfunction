#> -----------------------------------------------
#> Tinkerer's Craft Datapack
#> This code is protected by the GNU GPLv3 License
#> © 2020 Portyl Studios
#> https://portylstudios.com
#> -----------------------------------------------


#> api controller
# this code runs the api checkers


#> harvester
execute if score $tc.api TP_version matches 201 run schedule function tinkererscraft:packages/api/api_checker 1t append


#> End of file
#> -----------
