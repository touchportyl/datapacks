#> -----------------------------------------------
#> <packname> Datapack
#> This code is protected by the <license>
#> © <year> Portyl Studios
#> https://portylstudios.com
#> -----------------------------------------------


#> install
# this code installs all the required components for <packname>
#
# how to read $<packid>.api hashes:
# 210 = v2.1 (disabled)
# 351 = v3.5 (enabled)


# set api version
execute unless score $<packid>.api TP_version matches <apihash>.. run scoreboard players set $<packid>.api TP_version <apihash>

# install msg
tellraw @a [{"text":""},{"text":" +","color":"green"},{"text":" [<packname>] ","color":"aqua","hoverEvent":{"action":"show_text","value":"<catchphrase>"}},{"text":"<version>"},{"text":" installed successfully","color":"gray"}]


# hardcoded array
scoreboard objectives add <packID>_NumberArray dummy [{"text":"Numerical Array for <packname>","color":"<packcolor>"}]
scoreboard players set One <packID>_NumberArray 1
scoreboard players set Two <packID>_NumberArray 2
scoreboard players set Three <packID>_NumberArray 3
scoreboard players set Four <packID>_NumberArray 4
scoreboard players set Five <packID>_NumberArray 5
scoreboard players set Six <packID>_NumberArray 6
scoreboard players set Seven <packID>_NumberArray 7
scoreboard players set Eight <packID>_NumberArray 8
scoreboard players set Nine <packID>_NumberArray 9
scoreboard players set Ten <packID>_NumberArray 10


#> End of file
#> -----------
