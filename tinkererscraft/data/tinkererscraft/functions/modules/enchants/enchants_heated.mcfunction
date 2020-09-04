#> -----------------------------------------------
#> Tinkerer's Craft Datapack
#> This code is protected by the GNU GPLv3 License
#> © 2020 Portyl Studios
#> https://portylstudios.com
#> -----------------------------------------------


#> enchants heated
# this code controls the heated item's particle display


# heat up
execute as @e[tag=TC_isHeated] at @s as @e[type=minecraft:item,distance=..5] unless entity @s[nbt={Item:{tag:{TC_Heated:1b}}}] run scoreboard players add @s TC_SmeltingTimer 2

# cool down
execute as @e[scores={TC_SmeltingTimer=1..}] run scoreboard players remove @s TC_SmeltingTimer 1

#pfx:smoke
execute as @e[scores={TC_SmeltingTimer=10..}] at @s run function tinkererscraft:modules/effects/effects_heated

#> furnace vanilla
execute as @e[scores={TC_SmeltingTimer=100}] run function tinkererscraft:modules/enchants/furnace_vanilla

# cap timer
execute as @e[scores={TC_SmeltingTimer=100..}] run scoreboard players set @s TC_SmeltingTimer 35

#todo:gc
tag @e remove TC_isHeated


#> End of file
#> -----------
