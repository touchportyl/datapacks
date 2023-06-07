#> -----------------------------------------------
#> Tinkerer's Craft Datapack
#> This code is protected by the GNU GPLv3 License
#> © 2020 Portyl Studios
#> https://portylstudios.com
#> -----------------------------------------------


#> weathering (references: ../main)
# this is code for the weathering enchant


# tag items past the weathering threshold
tag @e[nbt={SelectedItem:{tag:{TC_Weathering:1b}}}] add TC_isWeathering


#> controller
execute as @e[tag=TC_isWeathering] at @s run function tinkererscraft:modules/enchants/weathering/controller


#> End of file
#> -----------
