#> -----------------------------------------------
#> Tinkerer's Craft Datapack
#> This code is protected by the GNU GPLv3 License
#> © 2020 Portyl Studios
#> https://portylstudios.com
#> -----------------------------------------------


#> controller (references: ../main)
# this code handles the smeltery's pouring mechanics


# timer++ when pouring
scoreboard players add @s TC_OutputTimer 1


#> start
execute as @s[scores={TC_OutputTimer=2}] at @s run function tinkererscraft:modules/effects/pouring/start

#> cauldron
execute as @s[tag=TC_cauldron] at @s run function tinkererscraft:modules/effects/pouring/cauldron

#> anvil
execute as @s[tag=TC_anvil] at @s run function tinkererscraft:modules/effects/pouring/anvil


#> drain
function tinkererscraft:modules/casting/drain

#> conditions
execute as @s[scores={TC_OutputTimer=1..}] run function tinkererscraft:modules/casting/pouring/conditions


# update ui
function tinkererscraft:modules/smeltery/ui/update


#> End of file
#> -----------
