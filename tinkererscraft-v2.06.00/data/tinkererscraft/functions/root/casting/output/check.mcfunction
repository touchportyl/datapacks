# converts the setup in front of the smeltery into tags

# tags:
# - TC_cauldron
# - TC_anvil


# remove tags first
tag @e[tag=TC_cauldron] remove TC_cauldron
tag @e[tag=TC_anvil] remove TC_anvil
tag @e[tag=TC_ingot] remove TC_ingot
tag @e[tag=TC_nugget] remove TC_nugget
tag @e[tag=TC_pickaxe] remove TC_pickaxe
tag @e[tag=TC_sword] remove TC_sword
tag @e[tag=TC_axe] remove TC_axe
tag @e[tag=TC_shovel] remove TC_shovel
tag @e[tag=TC_hoe] remove TC_hoe
tag @e[tag=TC_pressureplate] remove TC_pressureplate


#> update tags

# cauldron detection
execute as @s at @s if block ^ ^-1 ^2 minecraft:cauldron run tag @s add TC_cauldron

# anvil detection
execute as @s at @s if block ^ ^-1 ^2 minecraft:anvil run tag @s add TC_anvil


#> deeper check to see what's on the anvil
execute as @s[tag=TC_anvil] at @s run function tinkererscraft:root/casting/output/anvil