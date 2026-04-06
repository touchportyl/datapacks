#> -----------------------------------------------
#> Tinkerer's Craft Datapack
#> This code is protected by the GNU GPLv3 License
#> © 2020 Portyl Studios
#> https://portylstudios.com
#> -----------------------------------------------


#> shiny (references: ../main)
# this is code for the shiny enchant


# tag shiny items
tag @e[nbt={SelectedItem:{tag:{TC_Shiny:1b}}}] add TC_isShiny

# catch
execute as @e[tag=!TC_isShiny,scores={TC_ShinyTimer=0..}] run scoreboard players reset @s TC_ShinyTimer

#> controller
execute as @e[tag=TC_isShiny] at @s run function tinkererscraft:modules/enchants/shiny/controller


#> End of file
#> -----------
