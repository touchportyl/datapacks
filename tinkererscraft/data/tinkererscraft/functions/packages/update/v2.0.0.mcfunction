#> -----------------------------------------------
#> Tinkerer's Craft Datapack
#> This code is protected by the GNU GPLv3 License
#> © 2020 Portyl Studios
#> https://portylstudios.com
#> -----------------------------------------------


#> v2.0.0
# this code updates v1.9 to v2.0


# update version
scoreboard players set $tc.version TP_version 20000

# display update msg if cleanup happens
# TC_api_hash for v1.9 and v1.9.1 is set as 101
execute if score TC_api_hash TC_api matches 101 run tellraw @a [{"text":""},{"text":" -","color":"red"},{"text":" Cleaning up","color":"gray"},{"text":" [Tinkerer's Craft] ","color":"aqua"},{"text":"v1.9.1"}]


# cleanup
scoreboard objectives remove TC_init
scoreboard objectives remove TC_api
scoreboard objectives remove TP_Timer
tag @e[tag=TC_setzero] remove TC_setzero


# install current version
function tinkererscraft:packages/install


#> End of file
#> -----------
