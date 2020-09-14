#> -----------------------------------------------
#> <namespace> Datapack
#> This code is protected by the GNU GPLv3 License
#> © 2020 Portyl Studios
#> https://portylstudios.com
#> -----------------------------------------------


#> uninstall
# this code actually uninstalls <namespace>


# set version
scoreboard players reset $<main_pack>.version TP_version
scoreboard players reset $<main_pack>.api TP_version
scoreboard players reset $api.<main_pack>.<other_pack> TP_version

# uninstall msg
tellraw @a [{"text":""},{"text":" -","color":"red"},{"text":" [<namespace>] ","color":"aqua"},{"text":"uninstalled successfully","color":"gray"}]

# remove all persistent entities
kill @e[tag=<namespace>]


# randomizers
# r2
scoreboard objectives remove <main_pack>_rand_2

# timers
scoreboard objectives remove <main_pack>_sneak_time


# disable pack
datapack disable "file/<namespace>"


#> End of file
#> -----------
