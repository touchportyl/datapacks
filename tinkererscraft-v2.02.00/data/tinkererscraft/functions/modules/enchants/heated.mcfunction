#> -----------------------------------------------
#> Tinkerer's Craft Datapack
#> This code is protected by the GNU GPLv3 License
#> © 2020 Portyl Studios
#> https://portylstudios.com
#> -----------------------------------------------


#> heated (references: ../main)
# this is code for the heated enchant


# tag heated items
tag @e[nbt={SelectedItem:{tag:{TC_Heated:1b}}}] add TC_isHeated
tag @e[nbt={Item:{tag:{TC_Heated:1b}}}] add TC_isHeated

#> controller
function tinkererscraft:modules/enchants/heated/controller


#> End of file
#> -----------
