#> -----------------------------------------------
#> Speedrun Tools Datapack
#> This code is protected by the GNU GPLv3 License
#> © 2020 Portyl Studios
#> https://portylstudios.com
#> -----------------------------------------------


#> tick
# this code is run by minecraft:tick


#> main
execute if score $st.version TP_version matches 10000 run function speedruntools:main

#> main (with api catch)
execute if score $st.version TP_version matches 10000 unless score $api.st.empty TP_version matches 101 run function speedruntools:main


#> End of file
#> -----------
