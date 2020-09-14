#> -----------------------------------------------
#> <namespace> Datapack
#> This code is protected by the GNU GPLv3 License
#> © 2020 Portyl Studios
#> https://portylstudios.com
#> -----------------------------------------------


#> v2.0.0
# this code updates v1.0.0 to v2.0.0


# update version
scoreboard players set $<main_pack>.version TP_version 20000

# update msg
tellraw @a [{"text":""},{"text":" -","color":"red"},{"text":" Cleaning up","color":"gray"},{"text":" [<namespace>] ","color":"aqua"},{"text":"v1.0.0"}]


# cleanup
scoreboard objectives remove <main_pack>_init


# install current version
function <namespace>:packages/install


#> End of file
#> -----------
