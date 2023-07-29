# controls the heated item's effects


# heat up items near by
execute as @e[tag=TC_isHeated] at @s as @e[type=minecraft:item,distance=..4] unless entity @s[nbt={Item:{tag:{TC_Heated:1b}}}] run scoreboard players add @s TC_SmeltingTimer 2

# cool down
execute as @e[scores={TC_SmeltingTimer=1..}] run scoreboard players remove @s TC_SmeltingTimer 1


# ground heat
execute as @e[nbt={Item:{tag:{TC_Heated:1b}},OnGround:1b}] run function tinkererscraft:root/enchants/heated/ground


#pfx:bubbling
execute as @e[nbt={Item:{tag:{TC_Heated:1b}}}] at @s if block ~ ~ ~ minecraft:water run function tinkererscraft:effects/enchants/heated/bubbling

#pfx:heated
execute as @e[scores={TC_SmeltingTimer=5..}] at @s run function tinkererscraft:effects/enchants/heated


#> furnace vanilla
execute as @e[scores={TC_SmeltingTimer=50}] unless entity @s[nbt={Item:{tag:{TC_Casted:1b}}}] run function tinkererscraft:root/enchants/heated/furnace_vanilla

# cap timer for smelting items
execute as @e[scores={TC_SmeltingTimer=50..}] unless entity @s[nbt={Item:{tag:{TC_Casted:1b}}}] run scoreboard players set @s TC_SmeltingTimer 20


# cleanup
tag @e remove TC_isHeated
execute as @e[scores={TC_SmeltingTimer=0}] run scoreboard players reset @s TC_SmeltingTimer