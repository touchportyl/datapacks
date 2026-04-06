#> -----------------------------------------------
#> Harvester Datapack
#> This code is protected by the GNU GPLv3 License
#> © 2020 Portyl Studios
#> https://portylstudios.com
#> -----------------------------------------------


#> v2.0.0
# this code updates v1.3 to v2.0


# update version
scoreboard players set $h.version TP_version 20000

# update msg
execute if score H_api_hash H_api matches 101 run tellraw @a [{"text":""},{"text":" -","color":"red"},{"text":" Cleaning up","color":"gray"},{"text":" [Harvester] ","color":"aqua"},{"text":"v1.3"}]


# cleanup
scoreboard objectives remove H_init
scoreboard objectives remove H_api
scoreboard objectives remove H_rand_2
scoreboard objectives remove H_sneak_time
tag @a remove H_harvesting
tag @a remove H_harvested

# install current version
function harvester:packages/install


#> End of file
#> -----------
