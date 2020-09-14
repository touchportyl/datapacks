#> -----------------------------------------------
#> <namespace> Datapack
#> This code is protected by the GNU GPLv3 License
#> © 2020 Portyl Studios
#> https://portylstudios.com
#> -----------------------------------------------


#> load
# this code is run by minecraft:load


#> version_checker
scoreboard objectives add TP_version dummy [{"text":"Global Version","color":"white"}]
execute unless score $global.version TP_version matches 116 run function <namespace>:packages/version_checker/version_checker
execute if score $global.version TP_version matches 116 unless score $<main_pack>.version TP_version matches 10000 run function <namespace>:packages/install_checker


#> End of file
#> -----------
