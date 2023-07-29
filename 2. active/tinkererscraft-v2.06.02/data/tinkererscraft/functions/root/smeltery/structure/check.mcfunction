# checks if the multiblock structure still exists
# the lever, stained glass, and fake internal lava is ignored
# the hole/chimney/air blocks are counted as part of the multiblock structure


# first layer: fuel
execute as @s at @s unless block ^1 ^-2 ^1 minecraft:lava run function tinkererscraft:root/smeltery/structure/destroy/remove
execute as @s at @s unless block ^1 ^-2 ^ minecraft:lava run function tinkererscraft:root/smeltery/structure/destroy/remove
execute as @s at @s unless block ^1 ^-2 ^-1 minecraft:lava run function tinkererscraft:root/smeltery/structure/destroy/remove
execute as @s at @s unless block ^ ^-2 ^1 minecraft:lava run function tinkererscraft:root/smeltery/structure/destroy/remove
execute as @s at @s unless block ^ ^-2 ^ minecraft:lava run function tinkererscraft:root/smeltery/structure/destroy/remove
execute as @s at @s unless block ^ ^-2 ^-1 minecraft:lava run function tinkererscraft:root/smeltery/structure/destroy/remove
execute as @s at @s unless block ^-1 ^-2 ^1 minecraft:lava run function tinkererscraft:root/smeltery/structure/destroy/remove
execute as @s at @s unless block ^-1 ^-2 ^ minecraft:lava run function tinkererscraft:root/smeltery/structure/destroy/remove
execute as @s at @s unless block ^-1 ^-2 ^-1 minecraft:lava run function tinkererscraft:root/smeltery/structure/destroy/remove

# second layer: base
execute as @s at @s unless block ^1 ^-1 ^1 minecraft:polished_blackstone_bricks run function tinkererscraft:root/smeltery/structure/destroy/remove
execute as @s at @s unless block ^1 ^-1 ^ minecraft:polished_blackstone_bricks run function tinkererscraft:root/smeltery/structure/destroy/remove
execute as @s at @s unless block ^1 ^-1 ^-1 minecraft:polished_blackstone_bricks run function tinkererscraft:root/smeltery/structure/destroy/remove
execute as @s at @s unless block ^ ^-1 ^1 minecraft:polished_blackstone_bricks run function tinkererscraft:root/smeltery/structure/destroy/remove
execute as @s at @s unless block ^ ^-1 ^ minecraft:gilded_blackstone run function tinkererscraft:root/smeltery/structure/destroy/remove
execute as @s at @s unless block ^ ^-1 ^-1 minecraft:polished_blackstone_bricks run function tinkererscraft:root/smeltery/structure/destroy/remove
execute as @s at @s unless block ^-1 ^-1 ^1 minecraft:polished_blackstone_bricks run function tinkererscraft:root/smeltery/structure/destroy/remove
execute as @s at @s unless block ^-1 ^-1 ^ minecraft:polished_blackstone_bricks run function tinkererscraft:root/smeltery/structure/destroy/remove
execute as @s at @s unless block ^-1 ^-1 ^-1 minecraft:polished_blackstone_bricks run function tinkererscraft:root/smeltery/structure/destroy/remove

# third layer: control
execute as @s at @s unless block ^1 ^ ^1 minecraft:polished_blackstone_bricks run function tinkererscraft:root/smeltery/structure/destroy/remove
execute as @s at @s unless block ^1 ^ ^ minecraft:polished_blackstone_bricks run function tinkererscraft:root/smeltery/structure/destroy/remove
execute as @s at @s unless block ^1 ^ ^-1 minecraft:polished_blackstone_bricks run function tinkererscraft:root/smeltery/structure/destroy/remove
execute as @s at @s unless block ^ ^ ^1 minecraft:chiseled_polished_blackstone run function tinkererscraft:root/smeltery/structure/destroy/remove
execute as @s at @s unless block ^ ^ ^-1 minecraft:polished_blackstone_bricks run function tinkererscraft:root/smeltery/structure/destroy/remove
execute as @s at @s unless block ^-1 ^ ^1 minecraft:polished_blackstone_bricks run function tinkererscraft:root/smeltery/structure/destroy/remove
execute as @s at @s unless block ^-1 ^ ^ minecraft:polished_blackstone_bricks run function tinkererscraft:root/smeltery/structure/destroy/remove
execute as @s at @s unless block ^-1 ^ ^-1 minecraft:polished_blackstone_bricks run function tinkererscraft:root/smeltery/structure/destroy/remove

# fourth layer: display
execute as @s at @s unless block ^1 ^1 ^1 minecraft:polished_blackstone_bricks run function tinkererscraft:root/smeltery/structure/destroy/remove
execute as @s at @s unless block ^1 ^1 ^ minecraft:polished_blackstone_bricks run function tinkererscraft:root/smeltery/structure/destroy/remove
execute as @s at @s unless block ^1 ^1 ^-1 minecraft:polished_blackstone_bricks run function tinkererscraft:root/smeltery/structure/destroy/remove
execute as @s at @s unless block ^ ^1 ^ minecraft:air run function tinkererscraft:root/smeltery/structure/destroy/remove
execute as @s at @s unless block ^ ^1 ^-1 minecraft:polished_blackstone_bricks run function tinkererscraft:root/smeltery/structure/destroy/remove
execute as @s at @s unless block ^-1 ^1 ^1 minecraft:polished_blackstone_bricks run function tinkererscraft:root/smeltery/structure/destroy/remove
execute as @s at @s unless block ^-1 ^1 ^ minecraft:polished_blackstone_bricks run function tinkererscraft:root/smeltery/structure/destroy/remove
execute as @s at @s unless block ^-1 ^1 ^-1 minecraft:polished_blackstone_bricks run function tinkererscraft:root/smeltery/structure/destroy/remove

# fifth layer: cap
execute as @s at @s unless block ^1 ^2 ^1 minecraft:polished_blackstone_brick_slab run function tinkererscraft:root/smeltery/structure/destroy/remove
execute as @s at @s unless block ^1 ^2 ^ minecraft:polished_blackstone_brick_slab run function tinkererscraft:root/smeltery/structure/destroy/remove
execute as @s at @s unless block ^1 ^2 ^-1 minecraft:polished_blackstone_brick_slab run function tinkererscraft:root/smeltery/structure/destroy/remove
execute as @s at @s unless block ^ ^2 ^1 minecraft:polished_blackstone_brick_slab run function tinkererscraft:root/smeltery/structure/destroy/remove
execute as @s at @s unless block ^ ^2 ^ minecraft:air run function tinkererscraft:root/smeltery/structure/destroy/remove
execute as @s at @s unless block ^ ^2 ^-1 minecraft:polished_blackstone_brick_slab run function tinkererscraft:root/smeltery/structure/destroy/remove
execute as @s at @s unless block ^-1 ^2 ^1 minecraft:polished_blackstone_brick_slab run function tinkererscraft:root/smeltery/structure/destroy/remove
execute as @s at @s unless block ^-1 ^2 ^ minecraft:polished_blackstone_brick_slab run function tinkererscraft:root/smeltery/structure/destroy/remove
execute as @s at @s unless block ^-1 ^2 ^-1 minecraft:polished_blackstone_brick_slab run function tinkererscraft:root/smeltery/structure/destroy/remove