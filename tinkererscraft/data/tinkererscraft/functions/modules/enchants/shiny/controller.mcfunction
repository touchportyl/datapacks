#> -----------------------------------------------
#> Tinkerer's Craft Datapack
#> This code is protected by the GNU GPLv3 License
#> © 2020 Portyl Studios
#> https://portylstudios.com
#> -----------------------------------------------


#> controller (references: ../modules/enchants/shiny)
# this code controls the shiny item's particle display


# start timer
scoreboard players add @s TC_ShinyTimer 1

#pfx:shiny
execute as @e[scores={TC_ShinyTimer=3}] at @s run function tinkererscraft:modules/effects/shiny

#todo:gc
execute as @e[scores={TC_ShinyTimer=5}] at @s run scoreboard players reset @s TC_ShinyTimer
tag @s remove TC_isShiny


#> End of file
#> -----------
