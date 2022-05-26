#> -----------------------------------------------
#> Tinkerer's Craft Datapack
#> This code is protected by the GNU GPLv3 License
#> © 2020 Portyl Studios
#> https://portylstudios.com
#> -----------------------------------------------


#> flaming (references: ../main)
# this is code for the flaming enchant


# tag flaming items
tag @e[nbt={SelectedItem:{tag:{TC_Flaming:1b}}}] add TC_isFlaming
tag @e[nbt={Item:{tag:{TC_Flaming:1b}}}] add TC_isFlaming

# catch
execute as @e[tag=!TC_isFlaming,scores={TC_FlamingTimer=0..}] run scoreboard players reset @s TC_FlamingTimer

#> controller
execute as @e[tag=TC_isFlaming] at @s run function tinkererscraft:modules/enchants/flaming/controller


#> End of file
#> -----------
