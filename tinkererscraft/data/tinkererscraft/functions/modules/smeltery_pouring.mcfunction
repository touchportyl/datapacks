#> -----------------------------------------------
#> Tinkerer's Craft Datapack
#> This code is protected by the GNU GPLv3 License
#> © 2020 Portyl Studios
#> https://portylstudios.com
#> -----------------------------------------------


#> smeltery pouring
# this code handles the smeltery's pouring mechanics


# count timer when pouring
scoreboard players add @s TC_OutputTimer 1


#> effects_pouring_global
execute as @s[scores={TC_OutputTimer=2}] at @s run function tinkererscraft:modules/effects/effects_pouring_global

#> effects_pouring_cauldron
execute as @s[tag=TC_cauldron] at @s run function tinkererscraft:modules/effects/effects_pouring_cauldron

#> effects_pouring_anvil
execute as @s[tag=TC_anvil] at @s run function tinkererscraft:modules/effects/effects_pouring_anvil


#> drain
execute as @s at @s run function tinkererscraft:modules/drain


#> End of file
#> -----------
