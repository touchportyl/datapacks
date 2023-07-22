#> -----------------------------------------------
#> Tinkerer's Craft Datapack
#> This code is protected by the GNU GPLv3 License
#> © 2020 Portyl Studios
#> https://portylstudios.com
#> -----------------------------------------------


#> ground (references: ../root/enchants/heated/controller)
# this code controls the heated item's effects on the ground
#
# effects
# - grass block turns into dirt, then into coarse dirt
# - grass, weeds, and flowers turns into dead bushes


# heat up
scoreboard players add @s TC_SmeltingTimer 2

# timeline
execute as @s[scores={TC_SmeltingTimer=45}] at @s if block ~ ~-1 ~ minecraft:dirt run setblock ~ ~-1 ~ minecraft:coarse_dirt replace
execute as @s[scores={TC_SmeltingTimer=50}] at @s if block ~ ~-1 ~ minecraft:grass_block run setblock ~ ~-1 ~ minecraft:dirt replace
execute as @s[scores={TC_SmeltingTimer=100}] at @s align xyz run function tinkererscraft:root/enchants/heated/burn_plants
execute as @s[scores={TC_SmeltingTimer=150}] at @s if block ~ ~-1 ~ minecraft:dirt run setblock ~ ~-1 ~ minecraft:coarse_dirt replace
execute as @s[scores={TC_SmeltingTimer=175}] at @s if block ~ ~ ~ minecraft:dead_bush run setblock ~ ~ ~ minecraft:fire destroy
execute as @s[scores={TC_SmeltingTimer=200}] at @s run setblock ~ ~ ~ minecraft:fire destroy