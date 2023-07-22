#> -----------------------------------------------
#> Tinkerer's Craft Datapack
#> This code is protected by the GNU GPLv3 License
#> © 2020 Portyl Studios
#> https://portylstudios.com
#> -----------------------------------------------


#> burn plants (references: ../root/enchants/heated/ground)
# this code turns non-solid plants into dead bushes


# plants
execute if block ~ ~ ~ minecraft:grass run setblock ~ ~ ~ minecraft:dead_bush replace
execute if block ~ ~ ~ minecraft:tall_grass run setblock ~ ~ ~ minecraft:dead_bush replace
execute if block ~ ~ ~ minecraft:fern run setblock ~ ~ ~ minecraft:dead_bush replace
execute if block ~ ~ ~ minecraft:large_fern run setblock ~ ~ ~ minecraft:dead_bush replace

# flowers
execute if block ~ ~ ~ minecraft:allium run setblock ~ ~ ~ minecraft:dead_bush replace
execute if block ~ ~ ~ minecraft:azure_bluet run setblock ~ ~ ~ minecraft:dead_bush replace
execute if block ~ ~ ~ minecraft:blue_orchid run setblock ~ ~ ~ minecraft:dead_bush replace
execute if block ~ ~ ~ minecraft:cornflower run setblock ~ ~ ~ minecraft:dead_bush replace
execute if block ~ ~ ~ minecraft:dandelion run setblock ~ ~ ~ minecraft:dead_bush replace
execute if block ~ ~ ~ minecraft:lilac run setblock ~ ~ ~ minecraft:dead_bush replace
execute if block ~ ~ ~ minecraft:lily_of_the_valley run setblock ~ ~ ~ minecraft:dead_bush replace
execute if block ~ ~ ~ minecraft:oxeye_daisy run setblock ~ ~ ~ minecraft:dead_bush replace
execute if block ~ ~ ~ minecraft:peony run setblock ~ ~ ~ minecraft:dead_bush replace
execute if block ~ ~ ~ minecraft:poppy run setblock ~ ~ ~ minecraft:dead_bush replace
execute if block ~ ~ ~ minecraft:rose_bush run setblock ~ ~ ~ minecraft:dead_bush replace
execute if block ~ ~ ~ minecraft:sunflower run setblock ~ ~ ~ minecraft:dead_bush replace
execute if block ~ ~ ~ minecraft:red_tulip run setblock ~ ~ ~ minecraft:dead_bush replace
execute if block ~ ~ ~ minecraft:orange_tulip run setblock ~ ~ ~ minecraft:dead_bush replace
execute if block ~ ~ ~ minecraft:white_tulip run setblock ~ ~ ~ minecraft:dead_bush replace
execute if block ~ ~ ~ minecraft:pink_tulip run setblock ~ ~ ~ minecraft:dead_bush replace
execute if block ~ ~ ~ minecraft:wither_rose run setblock ~ ~ ~ minecraft:dead_bush replace

# crops
execute if block ~ ~ ~ minecraft:wheat run setblock ~ ~ ~ minecraft:dead_bush replace
execute if block ~ ~ ~ minecraft:potatoes run setblock ~ ~ ~ minecraft:dead_bush replace
execute if block ~ ~ ~ minecraft:carrots run setblock ~ ~ ~ minecraft:dead_bush replace
execute if block ~ ~ ~ minecraft:beetroots run setblock ~ ~ ~ minecraft:dead_bush replace



#sfx:hiss
playsound minecraft:block.fire.extinguish block @a ~0.5 ~ ~0.5 0.5 1 0

#pfx:smoke
particle minecraft:smoke ~0.5 ~ ~0.5 0.1 0.1 0.1 0.5 10 force