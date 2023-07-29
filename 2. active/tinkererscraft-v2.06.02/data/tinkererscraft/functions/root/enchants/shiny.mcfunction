# code for the shiny quirk


# tag shiny items
tag @e[nbt={SelectedItem:{tag:{TC_Shiny:1b}}}] add TC_isShiny
tag @e[nbt={Item:{tag:{TC_Shiny:1b}}}] add TC_isShiny

# cleanup
execute as @e[tag=!TC_isShiny,scores={TC_ShinyTimer=0..}] run scoreboard players reset @s TC_ShinyTimer

#> controller
execute as @e[tag=TC_isShiny] at @s run function tinkererscraft:root/enchants/shiny/controller