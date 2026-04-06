#> -----------------------------------------------
#> Tinkerer's Craft Datapack
#> This code is protected by the GNU GPLv3 License
#> © 2020 Portyl Studios
#> https://portylstudios.com
#> -----------------------------------------------


#> check (references: ../main)
# this code checks if the multiblock structure still exists
# the lever, stained glass, and fake internal lava is ignored


# first layer: fuel
execute as @s at @s unless block ^1 ^-2 ^1 minecraft:lava run function tinkererscraft:modules/smeltery/remove
execute as @s at @s unless block ^1 ^-2 ^ minecraft:lava run function tinkererscraft:modules/smeltery/remove
execute as @s at @s unless block ^1 ^-2 ^-1 minecraft:lava run function tinkererscraft:modules/smeltery/remove
execute as @s at @s unless block ^ ^-2 ^1 minecraft:lava run function tinkererscraft:modules/smeltery/remove
execute as @s at @s unless block ^ ^-2 ^ minecraft:lava run function tinkererscraft:modules/smeltery/remove
execute as @s at @s unless block ^ ^-2 ^-1 minecraft:lava run function tinkererscraft:modules/smeltery/remove
execute as @s at @s unless block ^-1 ^-2 ^1 minecraft:lava run function tinkererscraft:modules/smeltery/remove
execute as @s at @s unless block ^-1 ^-2 ^ minecraft:lava run function tinkererscraft:modules/smeltery/remove
execute as @s at @s unless block ^-1 ^-2 ^-1 minecraft:lava run function tinkererscraft:modules/smeltery/remove

# second layer: base
execute as @s at @s unless block ^1 ^-1 ^1 minecraft:polished_blackstone_bricks run function tinkererscraft:modules/smeltery/remove
execute as @s at @s unless block ^1 ^-1 ^ minecraft:polished_blackstone_bricks run function tinkererscraft:modules/smeltery/remove
execute as @s at @s unless block ^1 ^-1 ^-1 minecraft:polished_blackstone_bricks run function tinkererscraft:modules/smeltery/remove
execute as @s at @s unless block ^ ^-1 ^1 minecraft:polished_blackstone_bricks run function tinkererscraft:modules/smeltery/remove
execute as @s at @s unless block ^ ^-1 ^ minecraft:gilded_blackstone run function tinkererscraft:modules/smeltery/remove
execute as @s at @s unless block ^ ^-1 ^-1 minecraft:polished_blackstone_bricks run function tinkererscraft:modules/smeltery/remove
execute as @s at @s unless block ^-1 ^-1 ^1 minecraft:polished_blackstone_bricks run function tinkererscraft:modules/smeltery/remove
execute as @s at @s unless block ^-1 ^-1 ^ minecraft:polished_blackstone_bricks run function tinkererscraft:modules/smeltery/remove
execute as @s at @s unless block ^-1 ^-1 ^-1 minecraft:polished_blackstone_bricks run function tinkererscraft:modules/smeltery/remove

# third layer: control
execute as @s at @s unless block ^1 ^ ^1 minecraft:polished_blackstone_bricks run function tinkererscraft:modules/smeltery/remove
execute as @s at @s unless block ^1 ^ ^ minecraft:polished_blackstone_bricks run function tinkererscraft:modules/smeltery/remove
execute as @s at @s unless block ^1 ^ ^-1 minecraft:polished_blackstone_bricks run function tinkererscraft:modules/smeltery/remove
execute as @s at @s unless block ^ ^ ^1 minecraft:chiseled_polished_blackstone run function tinkererscraft:modules/smeltery/remove
execute as @s at @s unless block ^ ^ ^-1 minecraft:polished_blackstone_bricks run function tinkererscraft:modules/smeltery/remove
execute as @s at @s unless block ^-1 ^ ^1 minecraft:polished_blackstone_bricks run function tinkererscraft:modules/smeltery/remove
execute as @s at @s unless block ^-1 ^ ^ minecraft:polished_blackstone_bricks run function tinkererscraft:modules/smeltery/remove
execute as @s at @s unless block ^-1 ^ ^-1 minecraft:polished_blackstone_bricks run function tinkererscraft:modules/smeltery/remove

# fourth layer: display
execute as @s at @s unless block ^1 ^1 ^1 minecraft:polished_blackstone_bricks run function tinkererscraft:modules/smeltery/remove
execute as @s at @s unless block ^1 ^1 ^ minecraft:polished_blackstone_bricks run function tinkererscraft:modules/smeltery/remove
execute as @s at @s unless block ^1 ^1 ^-1 minecraft:polished_blackstone_bricks run function tinkererscraft:modules/smeltery/remove
execute as @s at @s unless block ^ ^1 ^ minecraft:air run function tinkererscraft:modules/smeltery/remove
execute as @s at @s unless block ^ ^1 ^-1 minecraft:polished_blackstone_bricks run function tinkererscraft:modules/smeltery/remove
execute as @s at @s unless block ^-1 ^1 ^1 minecraft:polished_blackstone_bricks run function tinkererscraft:modules/smeltery/remove
execute as @s at @s unless block ^-1 ^1 ^ minecraft:polished_blackstone_bricks run function tinkererscraft:modules/smeltery/remove
execute as @s at @s unless block ^-1 ^1 ^-1 minecraft:polished_blackstone_bricks run function tinkererscraft:modules/smeltery/remove

# fifth layer: cap
execute as @s at @s unless block ^1 ^2 ^1 minecraft:polished_blackstone_brick_slab run function tinkererscraft:modules/smeltery/remove
execute as @s at @s unless block ^1 ^2 ^ minecraft:polished_blackstone_brick_slab run function tinkererscraft:modules/smeltery/remove
execute as @s at @s unless block ^1 ^2 ^-1 minecraft:polished_blackstone_brick_slab run function tinkererscraft:modules/smeltery/remove
execute as @s at @s unless block ^ ^2 ^1 minecraft:polished_blackstone_brick_slab run function tinkererscraft:modules/smeltery/remove
execute as @s at @s unless block ^ ^2 ^ minecraft:air run function tinkererscraft:modules/smeltery/remove
execute as @s at @s unless block ^ ^2 ^-1 minecraft:polished_blackstone_brick_slab run function tinkererscraft:modules/smeltery/remove
execute as @s at @s unless block ^-1 ^2 ^1 minecraft:polished_blackstone_brick_slab run function tinkererscraft:modules/smeltery/remove
execute as @s at @s unless block ^-1 ^2 ^ minecraft:polished_blackstone_brick_slab run function tinkererscraft:modules/smeltery/remove
execute as @s at @s unless block ^-1 ^2 ^-1 minecraft:polished_blackstone_brick_slab run function tinkererscraft:modules/smeltery/remove


#> End of file
#> -----------
