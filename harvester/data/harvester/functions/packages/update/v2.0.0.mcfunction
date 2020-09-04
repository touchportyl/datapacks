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
tellraw @a [{"text":""},{"text":" -","color":"red"},{"text":" Cleaning up","color":"gray"},{"text":" [Harvester] ","color":"aqua"},{"text":"v1.3"}]


# cleanup
scoreboard objectives remove H_init


# install current version
function harvester:packages/install


#> End of file
#> -----------
