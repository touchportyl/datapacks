#> -----------------------------------------------
#> Tinkerer's Craft Datapack
#> This code is protected by the GNU GPLv3 License
#> © 2020 Portyl Studios
#> https://portylstudios.com
#> -----------------------------------------------


#> remove smeltery
# this code checks if the multiblock structure still exists
# the lever, stained glass, and fake internal lava is ignored


# first layer: fuel
execute as @s at @s unless block ^1 ^-2 ^1 minecraft:lava run function tinkererscraft:modules/broken_smeltery
execute as @s at @s unless block ^1 ^-2 ^ minecraft:lava run function tinkererscraft:modules/broken_smeltery
execute as @s at @s unless block ^1 ^-2 ^-1 minecraft:lava run function tinkererscraft:modules/broken_smeltery
execute as @s at @s unless block ^ ^-2 ^1 minecraft:lava run function tinkererscraft:modules/broken_smeltery
execute as @s at @s unless block ^ ^-2 ^ minecraft:lava run function tinkererscraft:modules/broken_smeltery
execute as @s at @s unless block ^ ^-2 ^-1 minecraft:lava run function tinkererscraft:modules/broken_smeltery
execute as @s at @s unless block ^-1 ^-2 ^1 minecraft:lava run function tinkererscraft:modules/broken_smeltery
execute as @s at @s unless block ^-1 ^-2 ^ minecraft:lava run function tinkererscraft:modules/broken_smeltery
execute as @s at @s unless block ^-1 ^-2 ^-1 minecraft:lava run function tinkererscraft:modules/broken_smeltery

# second layer: base
execute as @s at @s unless block ^1 ^-1 ^1 minecraft:polished_blackstone_bricks run function tinkererscraft:modules/broken_smeltery
execute as @s at @s unless block ^1 ^-1 ^ minecraft:polished_blackstone_bricks run function tinkererscraft:modules/broken_smeltery
execute as @s at @s unless block ^1 ^-1 ^-1 minecraft:polished_blackstone_bricks run function tinkererscraft:modules/broken_smeltery
execute as @s at @s unless block ^ ^-1 ^1 minecraft:polished_blackstone_bricks run function tinkererscraft:modules/broken_smeltery
execute as @s at @s unless block ^ ^-1 ^ minecraft:gilded_blackstone run function tinkererscraft:modules/broken_smeltery
execute as @s at @s unless block ^ ^-1 ^-1 minecraft:polished_blackstone_bricks run function tinkererscraft:modules/broken_smeltery
execute as @s at @s unless block ^-1 ^-1 ^1 minecraft:polished_blackstone_bricks run function tinkererscraft:modules/broken_smeltery
execute as @s at @s unless block ^-1 ^-1 ^ minecraft:polished_blackstone_bricks run function tinkererscraft:modules/broken_smeltery
execute as @s at @s unless block ^-1 ^-1 ^-1 minecraft:polished_blackstone_bricks run function tinkererscraft:modules/broken_smeltery

# third layer: control
execute as @s at @s unless block ^1 ^ ^1 minecraft:polished_blackstone_bricks run function tinkererscraft:modules/broken_smeltery
execute as @s at @s unless block ^1 ^ ^ minecraft:polished_blackstone_bricks run function tinkererscraft:modules/broken_smeltery
execute as @s at @s unless block ^1 ^ ^-1 minecraft:polished_blackstone_bricks run function tinkererscraft:modules/broken_smeltery
execute as @s at @s unless block ^ ^ ^1 minecraft:chiseled_polished_blackstone run function tinkererscraft:modules/broken_smeltery
execute as @s at @s unless block ^ ^ ^-1 minecraft:polished_blackstone_bricks run function tinkererscraft:modules/broken_smeltery
execute as @s at @s unless block ^-1 ^ ^1 minecraft:polished_blackstone_bricks run function tinkererscraft:modules/broken_smeltery
execute as @s at @s unless block ^-1 ^ ^ minecraft:polished_blackstone_bricks run function tinkererscraft:modules/broken_smeltery
execute as @s at @s unless block ^-1 ^ ^-1 minecraft:polished_blackstone_bricks run function tinkererscraft:modules/broken_smeltery

# fourth layer: display
execute as @s at @s unless block ^1 ^1 ^1 minecraft:polished_blackstone_bricks run function tinkererscraft:modules/broken_smeltery
execute as @s at @s unless block ^1 ^1 ^ minecraft:polished_blackstone_bricks run function tinkererscraft:modules/broken_smeltery
execute as @s at @s unless block ^1 ^1 ^-1 minecraft:polished_blackstone_bricks run function tinkererscraft:modules/broken_smeltery
execute as @s at @s unless block ^ ^1 ^ minecraft:air run function tinkererscraft:modules/broken_smeltery
execute as @s at @s unless block ^ ^1 ^-1 minecraft:polished_blackstone_bricks run function tinkererscraft:modules/broken_smeltery
execute as @s at @s unless block ^-1 ^1 ^1 minecraft:polished_blackstone_bricks run function tinkererscraft:modules/broken_smeltery
execute as @s at @s unless block ^-1 ^1 ^ minecraft:polished_blackstone_bricks run function tinkererscraft:modules/broken_smeltery
execute as @s at @s unless block ^-1 ^1 ^-1 minecraft:polished_blackstone_bricks run function tinkererscraft:modules/broken_smeltery

# fifth layer: cap
execute as @s at @s unless block ^1 ^2 ^1 minecraft:polished_blackstone_brick_slab run function tinkererscraft:modules/broken_smeltery
execute as @s at @s unless block ^1 ^2 ^ minecraft:polished_blackstone_brick_slab run function tinkererscraft:modules/broken_smeltery
execute as @s at @s unless block ^1 ^2 ^-1 minecraft:polished_blackstone_brick_slab run function tinkererscraft:modules/broken_smeltery
execute as @s at @s unless block ^ ^2 ^1 minecraft:polished_blackstone_brick_slab run function tinkererscraft:modules/broken_smeltery
execute as @s at @s unless block ^ ^2 ^ minecraft:air run function tinkererscraft:modules/broken_smeltery
execute as @s at @s unless block ^ ^2 ^-1 minecraft:polished_blackstone_brick_slab run function tinkererscraft:modules/broken_smeltery
execute as @s at @s unless block ^-1 ^2 ^1 minecraft:polished_blackstone_brick_slab run function tinkererscraft:modules/broken_smeltery
execute as @s at @s unless block ^-1 ^2 ^ minecraft:polished_blackstone_brick_slab run function tinkererscraft:modules/broken_smeltery
execute as @s at @s unless block ^-1 ^2 ^-1 minecraft:polished_blackstone_brick_slab run function tinkererscraft:modules/broken_smeltery


#> End of file
#> -----------
