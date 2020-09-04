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
tellraw @a [{"text":""},{"text":" +","color":"green"},{"text":" [Harvester] ","color":"aqua","hoverEvent":{"action":"show_text","value":"Adding utility to hoes."}},{"text":"v2.0.0"},{"text":" installed successfully","color":"gray"}]


# core variables

# randomizers
# r2
scoreboard objectives add H_rand_2 dummy [{"text":"Randomizer (2) for Harvester","color":"green"}]

# timers
scoreboard objectives add H_sneak_time minecraft.custom:minecraft.sneak_time [{"text":"Sneak Detection for Harvester","color":"green"}]


#> End of file
#> -----------
