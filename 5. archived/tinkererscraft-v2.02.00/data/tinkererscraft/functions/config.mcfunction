#> -----------------------------------------------
#> Tinkerer's Craft Datapack
#> This code is protected by the GNU GPLv3 License
#> © 2020 Portyl Studios
#> https://portylstudios.com
#> -----------------------------------------------


#> config
# override default features by changing the scoreboard values


### ORE DOUBLING ###

# enable regular ore doubling
# regular (not deepslate) ores will grant 2 units of metal when smelted
# 0 to disable (default)
# 1 to enable
scoreboard players set $tc.smelting.double.ore TP_config 0

# enable deepslate ore doubling
# deepslate ores will grant 2 units of metal when smelted
# 0 to disable
# 1 to enable (default)
scoreboard players set $tc.smelting.double.deepslate TP_config 1

# enable nether gold ore doubling
# nether gold ores will grant 2 units of metal when smelted
# 0 to disable (default)
# 1 to enable
scoreboard players set $tc.smelting.double.nethergold TP_config 0


### SMELTING ORES ###

# enable smelting for deepslate copper ore
# note that deepslate copper ore does not generate in vanilla as of 1.17
# 0 to disable (default)
# 1 to enable
scoreboard players set $tc.smelting.copper.deepslate TP_config 0

# enable smelting for nether gold ore
# nether gold ore usually grants less than an ingot of gold
# 0 to disable
# 1 to enable (default)
scoreboard players set $tc.smelting.gold.nether TP_config 1


### CASTING ###

# enable casting of iron tools
# 0 to disable
# 1 to enable (default)
scoreboard players set $tc.casting.iron TP_config 1


### DEBUGGING ###
# Do not edit unless you know what you're doing!

# display debug messages
# 0 = hide api, warning, and error messages (default)
# 1 = show api, warning, and error messages
# 2 = only show warning and error messages
# 3 = only show error messages
scoreboard players set $tc.debug TP_config 3

# override the version checker to manually test older versions
# 0 = enable version checker (default)
# 1 = disable version checker and input values manually
scoreboard players set $global.version.override TP_config 0
scoreboard players set $tc.version.override TP_config 0
# set minecraft version (112 to 999)
# 117 = 1.17 (default)
execute if score $global.version.override TP_config matches 1 run scoreboard players set $global.version TP_version 117
# set Tinkerer's Craft version (10000 to 99999)
# 20200 = v2.02.00 (default)
execute if score $tc.version.override TP_config matches 1 run scoreboard players set $tc.version TP_version 20200


#> End of file
#> -----------
