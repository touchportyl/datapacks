#> -----------------------------------------------
#> Tinkerer's Craft Datapack
#> This code is protected by the GNU GPLv3 License
#> © 2020 Portyl Studios
#> https://portylstudios.com
#> -----------------------------------------------


#> test


scoreboard players add $tc.copper.total TC_temp_tests 1

execute at @e[tag=TC_temp_tests_smelting] run summon item ~ ~4 ~ {Item:{id:"cut_copper",Count:1b}}

# schedule next
schedule function tinkererscraft:packages/tests/smelting/copper/cut_ 1s


#> End of file
#> -----------
