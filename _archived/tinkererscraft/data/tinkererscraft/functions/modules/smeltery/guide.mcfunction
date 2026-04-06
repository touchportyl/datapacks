#> -----------------------------------------------
#> Tinkerer's Craft Datapack
#> This code is protected by the GNU GPLv3 License
#> © 2020 Portyl Studios
#> https://portylstudios.com
#> -----------------------------------------------


#> guide (references: ../main)
# this controls the guide book's display


execute as @s[y_rotation=135..225] run function tinkererscraft:modules/smeltery/guide/north
execute as @s[y_rotation=225..315] run function tinkererscraft:modules/smeltery/guide/east
execute as @s[y_rotation=315..45] run function tinkererscraft:modules/smeltery/guide/south
execute as @s[y_rotation=45..135] run function tinkererscraft:modules/smeltery/guide/west


#> End of file
#> -----------
