#> -----------------------------------------------
#> Tinkerer's Craft Datapack
#> This code is protected by the GNU GPLv3 License
#> © 2020 Portyl Studios
#> https://portylstudios.com
#> -----------------------------------------------


#> load
# this code is run by minecraft:load

#> versioning system
scoreboard objectives add TP_version dummy [{"text":"Global Version","color":"white"}]
scoreboard objectives add TP_config dummy [{"text":"Global Config","color":"white"}]

#> config
function tinkererscraft:config

#> version checker
execute unless score $global.version TP_version matches 117 run function tinkererscraft:packages/version_checker/version_checker

execute if score $global.version TP_version matches 116..117 unless score $tc.version TP_version matches 20200 run schedule function tinkererscraft:packages/install_checker 3s
execute if score $global.version TP_version matches 116..117 if score $tc.version TP_version matches 20200 run schedule function tinkererscraft:packages/api/api_controller 3s


#> End of file
#> -----------
