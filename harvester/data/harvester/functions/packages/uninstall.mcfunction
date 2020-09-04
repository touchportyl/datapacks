#> -----------------------------------------------
#> Harvester Datapack
#> This code is protected by the GNU GPLv3 License
#> © 2020 Portyl Studios
#> https://portylstudios.com
#> -----------------------------------------------


#> uninstall
# this code actually uninstalls Harvester


# set version
scoreboard players reset $h.version TP_version
scoreboard players reset $h.api TP_version
scoreboard players reset $api.tc.h TP_version

# uninstall msg
tellraw @a [{"text":""},{"text":" -","color":"red"},{"text":" [Harvester] ","color":"aqua"},{"text":"uninstalled successfully","color":"gray"}]

# remove all persistent entities
kill @e[tag=Harvester]


# randomizers
# r2
scoreboard objectives remove H_rand_2

# timers
scoreboard objectives remove H_sneak_time


# disable pack
datapack disable "file/harvester"


#> End of file
#> -----------
