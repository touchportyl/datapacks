#> -----------------------------------------------
#> Tinkerer's Craft Datapack
#> This code is protected by the GNU GPLv3 License
#> © 2020 Portyl Studios
#> https://portylstudios.com
#> -----------------------------------------------


#> tick
# this code is run by minecraft:tick


#> main
execute if score $h.version TP_version matches 20000 if entity @a[nbt={SelectedItem:{id:"minecraft:diamond_hoe"}}] if predicate harvester:player_checkers/is_sneaking run function harvester:main

#> main (with api catch)
execute if score $h.version TP_version matches 20000 if entity @a[nbt={SelectedItem:{id:"minecraft:netherite_hoe"}}] unless score $api.tc.h TP_version matches 201 if predicate harvester:player_checkers/is_sneaking run function harvester:main


#> End of file
#> -----------
