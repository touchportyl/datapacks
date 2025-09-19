# turns non-solid plants into dead bushes

# reference
# https://minecraft.fandom.com/wiki/Plant#Blocks


# plants
execute if block ~ ~ ~ minecraft:grass run setblock ~ ~ ~ minecraft:dead_bush replace
execute if block ~ ~ ~ minecraft:tall_grass run setblock ~ ~ ~ minecraft:dead_bush replace
execute if block ~ ~ ~ minecraft:fern run setblock ~ ~ ~ minecraft:dead_bush replace
execute if block ~ ~ ~ minecraft:large_fern run setblock ~ ~ ~ minecraft:dead_bush replace
execute if block ~ ~ ~ minecraft:sweet_berry_bush run setblock ~ ~ ~ minecraft:dead_bush replace

# saplings
execute if block ~ ~ ~ minecraft:oak_sapling run setblock ~ ~ ~ minecraft:dead_bush replace
execute if block ~ ~ ~ minecraft:spruce_sapling run setblock ~ ~ ~ minecraft:dead_bush replace
execute if block ~ ~ ~ minecraft:birch_sapling run setblock ~ ~ ~ minecraft:dead_bush replace
execute if block ~ ~ ~ minecraft:jungle_sapling run setblock ~ ~ ~ minecraft:dead_bush replace
execute if block ~ ~ ~ minecraft:acacia_sapling run setblock ~ ~ ~ minecraft:dead_bush replace
execute if block ~ ~ ~ minecraft:dark_oak_sapling run setblock ~ ~ ~ minecraft:dead_bush replace

# flowers
execute if block ~ ~ ~ minecraft:dandelion run setblock ~ ~ ~ minecraft:dead_bush replace
execute if block ~ ~ ~ minecraft:poppy run setblock ~ ~ ~ minecraft:dead_bush replace
execute if block ~ ~ ~ minecraft:blue_orchid run setblock ~ ~ ~ minecraft:dead_bush replace
execute if block ~ ~ ~ minecraft:allium run setblock ~ ~ ~ minecraft:dead_bush replace
execute if block ~ ~ ~ minecraft:azure_bluet run setblock ~ ~ ~ minecraft:dead_bush replace
execute if block ~ ~ ~ minecraft:red_tulip run setblock ~ ~ ~ minecraft:dead_bush replace
execute if block ~ ~ ~ minecraft:orange_tulip run setblock ~ ~ ~ minecraft:dead_bush replace
execute if block ~ ~ ~ minecraft:white_tulip run setblock ~ ~ ~ minecraft:dead_bush replace
execute if block ~ ~ ~ minecraft:pink_tulip run setblock ~ ~ ~ minecraft:dead_bush replace
execute if block ~ ~ ~ minecraft:oxeye_daisy run setblock ~ ~ ~ minecraft:dead_bush replace
execute if block ~ ~ ~ minecraft:cornflower run setblock ~ ~ ~ minecraft:dead_bush replace
execute if block ~ ~ ~ minecraft:lily_of_the_valley run setblock ~ ~ ~ minecraft:dead_bush replace
execute if block ~ ~ ~ minecraft:wither_rose run setblock ~ ~ ~ minecraft:dead_bush replace
execute if block ~ ~ ~ minecraft:sunflower run setblock ~ ~ ~ minecraft:dead_bush replace
execute if block ~ ~ ~ minecraft:lilac run setblock ~ ~ ~ minecraft:dead_bush replace
execute if block ~ ~ ~ minecraft:rose_bush run setblock ~ ~ ~ minecraft:dead_bush replace
execute if block ~ ~ ~ minecraft:peony run setblock ~ ~ ~ minecraft:dead_bush replace

# crops
execute if block ~ ~ ~ minecraft:wheat run setblock ~ ~ ~ minecraft:dead_bush replace
execute if block ~ ~ ~ minecraft:potatoes run setblock ~ ~ ~ minecraft:dead_bush replace
execute if block ~ ~ ~ minecraft:carrots run setblock ~ ~ ~ minecraft:dead_bush replace
execute if block ~ ~ ~ minecraft:beetroots run setblock ~ ~ ~ minecraft:dead_bush replace
execute if block ~ ~ ~ minecraft:melon_stem run setblock ~ ~ ~ minecraft:dead_bush replace
execute if block ~ ~ ~ minecraft:pumpkin_stem run setblock ~ ~ ~ minecraft:dead_bush replace


# updates
execute as @s at @s if score VERSION$minecraft.current DatapackManager matches 17.. run function tinkererscraft:compatibility/enchants/heated/burn_plants-1.17
execute as @s at @s if score VERSION$minecraft.current DatapackManager matches 19.. run function tinkererscraft:compatibility/enchants/heated/burn_plants-1.19
execute as @s at @s if score VERSION$minecraft.current DatapackManager matches 20.. run function tinkererscraft:compatibility/enchants/heated/burn_plants-1.20


#fx:smoke and hiss
function tinkererscraft:effects/enchants/heated/burn_plants