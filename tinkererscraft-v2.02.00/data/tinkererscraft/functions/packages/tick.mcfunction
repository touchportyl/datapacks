#> -----------------------------------------------
#> Tinkerer's Craft Datapack
#> This code is protected by the GNU GPLv3 License
#> © 2020 Portyl Studios
#> https://portylstudios.com
#> -----------------------------------------------


#> tick
# this code is run by minecraft:tick


#> main
execute if score $tc.version TP_version matches 20200 run function tinkererscraft:packages/main

#> hooks
execute if score $tc.version TP_version matches 20200 run function tinkererscraft:packages/hooks/listen


#> End of file
#> -----------
