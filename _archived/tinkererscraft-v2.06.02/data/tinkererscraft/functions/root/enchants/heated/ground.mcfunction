# controls the heated item's effects on the ground
#
# effects
# - grass block turns into dirt, then into coarse dirt
# - grass, weeds, and flowers turns into dead bushes


# heat up the item itself
scoreboard players add @s TC_SmeltingTimer 2

# timeline
execute as @s[scores={TC_SmeltingTimer=20}] at @s if block ~ ~-1 ~ minecraft:dirt run setblock ~ ~-1 ~ minecraft:coarse_dirt replace
execute as @s[scores={TC_SmeltingTimer=25}] at @s if block ~ ~-1 ~ minecraft:grass_block run setblock ~ ~-1 ~ minecraft:dirt replace
execute as @s[scores={TC_SmeltingTimer=50}] at @s align xyz run function tinkererscraft:root/enchants/heated/burn_plants
execute as @s[scores={TC_SmeltingTimer=75}] at @s if block ~ ~-1 ~ minecraft:dirt run setblock ~ ~-1 ~ minecraft:coarse_dirt replace
execute as @s[scores={TC_SmeltingTimer=85}] at @s if block ~ ~ ~ minecraft:dead_bush run setblock ~ ~ ~ minecraft:fire destroy
execute as @s[scores={TC_SmeltingTimer=100}] at @s run setblock ~ ~ ~ minecraft:fire destroy