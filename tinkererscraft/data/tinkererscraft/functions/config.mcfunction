#> -----------------------------------------------
#> Tinkerer's Craft Datapack
#> This code is protected by the GNU GPLv3 License
#> © 2020 Portyl Studios
#> https://portylstudios.com
#> -----------------------------------------------


#> config
# override default features



#> debug related
# Do not edit unless you know what you're doing!

# display debug messages
# 0 = hide api, warning, and error messages
# 1 = show api, warning, and error messages (default)
# 2 = only show warning and error messages
# 3 = only show error messages
scoreboard players set $tc.debug TP_config 1

# override the version checker to manually test older versions
# 0 = enable version checker (default)
# 1 = disable version checker and input values manually
scoreboard players set $global.version.override TP_config 0
scoreboard players set $tc.version.override TP_config 0
# set minecraft version (112 to 999)
# 117 = 1.17 (default)
execute if score $global.version.override TP_config matches 1 run scoreboard players set $global.version TP_version 117
# set Tinkerer's Craft version (10000 to 99999)
# 20100 = v2.01.00 (default)
execute if score $tc.version.override TP_config matches 1 run scoreboard players set $tc.version TP_version 20100


#> End of file
#> -----------
