#> -----------------------------------------------
#> Tinkerer's Craft Datapack
#> This code is protected by the GNU GPLv3 License
#> © 2020 Portyl Studios
#> https://portylstudios.com
#> -----------------------------------------------


#> display
# display a helping actionbar


# start
execute as @e[tag=TC_smeltery] at @s as @a[distance=..7,sort=nearest] run tag @s add TC_displayhelp

# run
execute as @a[tag=TC_displayhelp] run function tinkererscraft:modules/smeltery/ui/help/actionbar

# reset
execute as @e[tag=TC_smeltery] at @s as @a[distance=8..,sort=nearest] run tag @s remove TC_displayhelp
scoreboard players reset @a[tag=!TC_displayhelp] TC_TextTimer


#> End of file
#> -----------
