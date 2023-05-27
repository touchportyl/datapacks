#> -----------------------------------------------
#> Tinkerer's Craft Datapack
#> This code is protected by the GNU GPLv3 License
#> © 2020 Portyl Studios
#> https://portylstudios.com
#> -----------------------------------------------


#> test


tellraw @a {"text":"\n\n> Version test: 0.0.0\n"}
scoreboard players reset $tc.version TP_version
scoreboard players add $tc.count TC_temp_tests 1
schedule function tinkererscraft:packages/install_checker 2t
tellraw @a {"text":""}


#> End of file
#> -----------
