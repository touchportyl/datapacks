#> -----------------------------------------------
#> Tinkerer's Craft Datapack
#> This code is protected by the GNU GPLv3 License
#> © 2020 Portyl Studios
#> https://portylstudios.com
#> -----------------------------------------------


#> finish
# show test end


tellraw @a [{"text":"\n\n> "},{"score":{"name":"$tc.count","objective":"TC_temp_tests"}},{"text":" version tests finished.\n\n"}]
scoreboard objectives remove TC_temp_tests
reload


#> End of file
#> -----------
