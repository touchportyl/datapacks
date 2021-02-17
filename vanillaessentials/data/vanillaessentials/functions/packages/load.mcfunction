#> -----------------------------------------------
#> Vanilla Essentials Datapack
#> This code is protected by the GNU GPLv3 License
#> © 2020 Portyl Studios
#> https://portylstudios.com
#> -----------------------------------------------


#> load
# this code is run by minecraft:load


#> version_checker
scoreboard objectives add TP_version dummy [{"text":"Global Version","color":"white"}]
execute unless score $global.version TP_version matches 117 run function vanillaessentials:packages/version_checker/version_checker
execute if score $global.version TP_version matches 117 unless score $ve.version TP_version matches 10000 run schedule function vanillaessentials:packages/install_checker 3s


#> End of file
#> -----------
