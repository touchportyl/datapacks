#> -----------------------------------------------
#> Dimensional Doors Datapack
#> This code is protected by the GNU GPLv3 License
#> © 2020 Portyl Studios
#> https://portylstudios.com
#> -----------------------------------------------


#> load
# this code is run by minecraft:load


#> version_checker
scoreboard objectives add TP_version dummy [{"text":"Global Version","color":"white"}]
execute unless score $global.version TP_version matches 116 run function dimensionaldoors:packages/version_checker/version_checker
execute if score $global.version TP_version matches 116 unless score $dd.version TP_version matches 20000 run function dimensionaldoors:packages/install_checker


#> End of file
#> -----------
