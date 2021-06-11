#> -----------------------------------------------
#> Tinkerer's Craft Datapack
#> This code is protected by the GNU GPLv3 License
#> © 2020 Portyl Studios
#> https://portylstudios.com
#> -----------------------------------------------


#> controller (references: ../modules/enchants/heated)
# this code controls the heated item's effects


# heat up
execute as @e[tag=TC_isHeated] at @s as @e[type=minecraft:item,distance=..4] unless entity @s[nbt={Item:{tag:{TC_Heated:1b}}}] run scoreboard players add @s TC_SmeltingTimer 2

# cool down
execute as @e[scores={TC_SmeltingTimer=1..}] run scoreboard players remove @s TC_SmeltingTimer 1

# ground heat
execute as @e[nbt={Item:{tag:{TC_Heated:1b}},OnGround:1b}] run function tinkererscraft:modules/enchants/heated/ground

#pfx:bubbling
execute as @e[nbt={Item:{tag:{TC_Heated:1b}}}] at @s if block ~ ~ ~ minecraft:water run particle minecraft:bubble_column_up ~ ~ ~ 0 0 0 0.1 1 force

#pfx:heated
execute as @e[scores={TC_SmeltingTimer=10..}] at @s run function tinkererscraft:modules/effects/heated

#> furnace vanilla
execute as @e[scores={TC_SmeltingTimer=100}] unless entity @s[nbt={Item:{tag:{TC_Casted:1b}}}] run function tinkererscraft:modules/enchants/heated/furnace_vanilla

# cap timer
execute as @e[scores={TC_SmeltingTimer=100..}] unless entity @s[nbt={Item:{tag:{TC_Casted:1b}}}] run scoreboard players set @s TC_SmeltingTimer 35

#todo:gc
tag @e remove TC_isHeated


#> End of file
#> -----------
