#> -----------------------------------------------
#> Tinkerer's Craft Datapack
#> This code is protected by the GNU GPLv3 License
#> © 2020 Portyl Studios
#> https://portylstudios.com
#> -----------------------------------------------


#> smelt (references: ../main)
# this code turns items into scoreboard values

# copper
execute as @s at @s run function tinkererscraft:modules/smelting/process/copper

# iron
execute as @s at @s run function tinkererscraft:modules/smelting/process/iron

# gold
execute as @s at @s run function tinkererscraft:modules/smelting/process/gold

# obsidian
execute as @s at @s run function tinkererscraft:modules/smelting/process/obsidian

#sfx:smelting
function tinkererscraft:modules/effects/smelting/smelt

# xp
function tinkererscraft:modules/effects/smelting/process/xp

# update ui
function tinkererscraft:modules/smeltery/ui/update


#> End of file
#> -----------
