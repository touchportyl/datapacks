# code for the heated enchant


# tag heated items
tag @e[nbt={SelectedItem:{tag:{TC_Heated:1b}}}] add TC_isHeated
tag @e[nbt={Item:{tag:{TC_Heated:1b}}}] add TC_isHeated

#> controller
function tinkererscraft:root/enchants/heated/controller