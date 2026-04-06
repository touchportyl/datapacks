# code for the flaming quirk


# tag flaming items
tag @e[nbt={SelectedItem:{tag:{TC_Flaming:1b}}}] add TC_isFlaming
tag @e[nbt={Item:{tag:{TC_Flaming:1b}}}] add TC_isFlaming

# cleanup
execute as @e[tag=!TC_isFlaming,scores={TC_FlamingTimer=0..}] run scoreboard players reset @s TC_FlamingTimer

#> controller
execute as @e[tag=TC_isFlaming] at @s run function tinkererscraft:root/enchants/flaming/controller