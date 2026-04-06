#> -----------------------------------------------
#> Dimensional Doors Datapack
#> This code is protected by the GNU GPLv3 License
#> © 2020 Portyl Studios
#> https://portylstudios.com
#> -----------------------------------------------


#> uninstall
# this code actually uninstalls dimensionaldoors


# set version
scoreboard players reset $dd.version TP_version
scoreboard players reset $dd.api TP_version
#scoreboard players reset $api.<main_pack>.<other_pack> TP_version

# uninstall msg
tellraw @a [{"text":""},{"text":" -","color":"red"},{"text":" [Dimensional Doors] ","color":"aqua"},{"text":"uninstalled successfully","color":"gray"}]

# remove all persistent entities
kill @e[tag=dimensionaldoors]


# scoreboards
scoreboard objectives remove DD_doorID


# disable pack
datapack disable "file/dimensionaldoors"


#> End of file
#> -----------
