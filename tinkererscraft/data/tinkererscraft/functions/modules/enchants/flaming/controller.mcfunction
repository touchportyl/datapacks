#> -----------------------------------------------
#> Tinkerer's Craft Datapack
#> This code is protected by the GNU GPLv3 License
#> © 2020 Portyl Studios
#> https://portylstudios.com
#> -----------------------------------------------


#> controller (references: ../modules/enchants/flaming)
# this code controls the flaming item's particle display


# start timer
scoreboard players add @s TC_FlamingTimer 1

#pfx:flame_plus
execute as @e[scores={TC_FlamingTimer=35}] at @s run function tinkererscraft:modules/effects/flaming/circle_1

#pfx:flame_cross
execute as @e[scores={TC_FlamingTimer=50}] at @s run function tinkererscraft:modules/effects/flaming/circle_2

#todo:gc
execute as @e[scores={TC_FlamingTimer=50}] at @s run scoreboard players reset @s TC_FlamingTimer
tag @s remove TC_isFlaming


#> End of file
#> -----------
