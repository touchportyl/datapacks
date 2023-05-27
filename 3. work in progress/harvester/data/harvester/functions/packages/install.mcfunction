#> -----------------------------------------------
#> Harvester Datapack
#> This code is protected by the GNU GPLv3 License
#> © 2020 Portyl Studios
#> https://portylstudios.com
#> -----------------------------------------------


#> install
# this code installs all the required components for Harvester
#
# how to read $tc.api hashes:
# 210 = v2.1 (disabled)
# 351 = v3.5 (enabled)


# set api version
execute unless score $h.api TP_version matches 201.. run scoreboard players set $h.api TP_version 201

# install msg
tellraw @a [{"text":""},{"text":" +","color":"green"},{"text":" [Harvester] ","color":"aqua","hoverEvent":{"action":"show_text","value":"Harvest and replant crops efficiently with a hoe!"}},{"text":"v3.0.0"},{"text":" installed successfully","color":"gray"}]


# core variables

# randomizers
# global
scoreboard objectives add H_rand dummy [{"text":"Randomizer for Harvester","color":"green"}]

# timers


#> End of file
#> -----------
