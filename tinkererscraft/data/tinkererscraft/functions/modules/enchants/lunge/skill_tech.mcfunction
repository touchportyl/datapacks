#> -----------------------------------------------
#> Tinkerer's Craft Datapack
#> This code is protected by the GNU GPLv3 License
#> © 2020 Portyl Studios
#> https://portylstudios.com
#> -----------------------------------------------


#> skill tech
# this code gives the player the tech boost for the lunge skill


# advancement
advancement grant @s until tinkererscraft:skills/lunge_tech

# potion effects
effect give @s minecraft:speed 7 3 true
effect give @s minecraft:jump_boost 1 1 true

#pfx:boom
particle minecraft:explosion ~ ~0.2 ~ 0 0 0 0 1 force
playsound entity.generic.explode block @a ~ ~ ~ 0.5 2 0


#> End of file
#> -----------
