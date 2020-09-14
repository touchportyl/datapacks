#> -----------------------------------------------
#> <namespace> Datapack
#> This code is protected by the GNU GPLv3 License
#> © 2020 Portyl Studios
#> https://portylstudios.com
#> -----------------------------------------------


#> tick
# this code is run by minecraft:tick


#> main
execute if score $<main_pack>.version TP_version matches 10000 run function <namespace>:main

#> main (with api catch)
execute if score $<main_pack>.version TP_version matches 10000 unless score $api.<main_pack>.<other_pack> TP_version matches 101 run function <namespace>:main


#> End of file
#> -----------
