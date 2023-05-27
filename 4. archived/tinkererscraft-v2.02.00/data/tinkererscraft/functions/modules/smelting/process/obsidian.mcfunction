#> -----------------------------------------------
#> Tinkerer's Craft Datapack
#> This code is protected by the GNU GPLv3 License
#> © 2020 Portyl Studios
#> https://portylstudios.com
#> -----------------------------------------------


#> obsidian (references: ../modules/smelting/smelt)
# this code turns items into scoreboard values


# ore
execute as @s at @s store result score @s TC_bObsidian run data get entity @e[tag=TC_obsidian,distance=..2,sort=nearest,limit=1] Item.Count
execute as @s at @s run function tinkererscraft:modules/smelting/process/push


#> End of file
#> -----------
