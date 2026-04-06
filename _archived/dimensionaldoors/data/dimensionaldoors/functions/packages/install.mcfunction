#> -----------------------------------------------
#> Dimensional Doors Datapack
#> This code is protected by the GNU GPLv3 License
#> © 2020 Portyl Studios
#> https://portylstudios.com
#> -----------------------------------------------


#> install
# this code installs all the required components for Dimensional Doors
#
# how to read $DD.api hashes:
# 210 = v2.1 (disabled)
# 351 = v3.5 (enabled)


# set api version
execute unless score $dd.api TP_version matches 101.. run scoreboard players set $dd.api TP_version 100

# install msg
tellraw @a [{"text":""},{"text":" +","color":"green"},{"text":" [Dimensional Doors] ","color":"aqua","hoverEvent":{"action":"show_text","value":"The elegant solution to /sethome."}},{"text":"v2.0.0"},{"text":" installed successfully","color":"gray"}]


# core variables
scoreboard objectives add DD_doorID dummy [{"text":"Dimensional Door ID","color":"light_purple"}]
execute unless score $dd.doorID.current DD_doorID matches 1.. run scoreboard players set $dd.doorID.current DD_doorID 1





#> End of file
#> -----------
