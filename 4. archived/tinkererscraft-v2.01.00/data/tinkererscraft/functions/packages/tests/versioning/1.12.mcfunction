#> -----------------------------------------------
#> Tinkerer's Craft Datapack
#> This code is protected by the GNU GPLv3 License
#> © 2020 Portyl Studios
#> https://portylstudios.com
#> -----------------------------------------------


#> test


tellraw @a {"text":"\n\n> Version test: 1.12\n"}
scoreboard players set $global.version TP_version 112
scoreboard players add $tc.count TC_temp_tests 1
schedule function tinkererscraft:packages/version_checker/version_checker 2t
tellraw @a {"text":""}


#> End of file
#> -----------