#> -----------------------------------------------
#> <namespace> Datapack
#> This code is protected by the GNU GPLv3 License
#> © 2020 Portyl Studios
#> https://portylstudios.com
#> -----------------------------------------------


#> install
# this code installs all the required components for <namespace>
#
# how to read $<main_pack>.api hashes:
# 210 = v2.1 (disabled)
# 351 = v3.5 (enabled)


# set api version
execute unless score $<main_pack>.api TP_version matches 101.. run scoreboard players set $<main_pack>.api TP_version 101

# install msg
tellraw @a [{"text":""},{"text":" +","color":"green"},{"text":" [<namespace>] ","color":"aqua","hoverEvent":{"action":"show_text","value":"A catchphrase for your pack."}},{"text":"v1.0.0"},{"text":" installed successfully","color":"gray"}]


# core variables
scoreboard objectives add <name> dummy [{"text":"Global <name>","color":"white"}]

# randomizers
# r<number>
scoreboard objectives add <main_pack>_rand_<number> dummy [{"text":"Randomizer (<number>) for <namespace>","color":"<pack_color>"}]

# timers
scoreboard objectives add <main_pack>_<name>Timer dummy [{"text":"<name> Timer","color":"<pack_color>"}]

# hardcoded array
scoreboard objectives add <main_pack>_NumberArray dummy [{"text":"Numerical Array for <namespace>","color":"<pack_color>"}]
scoreboard players set One <main_pack>_NumberArray 1
scoreboard players set Two <main_pack>_NumberArray 2
scoreboard players set Three <main_pack>_NumberArray 3
scoreboard players set Four <main_pack>_NumberArray 4
scoreboard players set Five <main_pack>_NumberArray 5
scoreboard players set Six <main_pack>_NumberArray 6
scoreboard players set Seven <main_pack>_NumberArray 7
scoreboard players set Eight <main_pack>_NumberArray 8
scoreboard players set Nine <main_pack>_NumberArray 9
scoreboard players set Ten <main_pack>_NumberArray 10


#> End of file
#> -----------
