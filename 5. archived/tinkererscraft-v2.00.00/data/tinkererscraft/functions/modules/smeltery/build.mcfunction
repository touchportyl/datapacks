#> -----------------------------------------------
#> Tinkerer's Craft Datapack
#> This code is protected by the GNU GPLv3 License
#> © 2020 Portyl Studios
#> https://portylstudios.com
#> -----------------------------------------------


#> build (references: ../main)
# this code checks the multiblock structure and prepares it for initialization
# tags:
# - TinkerersCraft (default persisting tag for all entities created by Tinkerer's Craft)
# - TC_smeltery (persisting smeltery tag)
# - TC_<direction> (persisting smeltery direction: north, south, east, west)
# - TC_outputnull (sets the display to show the hint)


# north
execute if block ~1 ~-2 ~1 minecraft:lava if block ~1 ~-2 ~ minecraft:lava if block ~1 ~-2 ~-1 minecraft:lava if block ~ ~-2 ~1 minecraft:lava if block ~ ~-2 ~ minecraft:lava if block ~ ~-2 ~-1 minecraft:lava if block ~-1 ~-2 ~1 minecraft:lava if block ~-1 ~-2 ~ minecraft:lava if block ~-1 ~-2 ~-1 minecraft:lava if block ~1 ~-1 ~1 minecraft:polished_blackstone_bricks if block ~1 ~-1 ~ minecraft:polished_blackstone_bricks if block ~1 ~-1 ~-1 minecraft:polished_blackstone_bricks if block ~ ~-1 ~1 minecraft:polished_blackstone_bricks if block ~ ~-1 ~ minecraft:gilded_blackstone if block ~ ~-1 ~-1 minecraft:polished_blackstone_bricks if block ~-1 ~-1 ~1 minecraft:polished_blackstone_bricks if block ~-1 ~-1 ~ minecraft:polished_blackstone_bricks if block ~-1 ~-1 ~-1 minecraft:polished_blackstone_bricks if block ~1 ~ ~1 minecraft:polished_blackstone_bricks if block ~1 ~ ~ minecraft:polished_blackstone_bricks if block ~1 ~ ~-1 minecraft:polished_blackstone_bricks if block ~ ~ ~1 minecraft:chiseled_polished_blackstone if block ~ ~ ~ minecraft:air if block ~ ~ ~-1 minecraft:polished_blackstone_bricks if block ~-1 ~ ~1 minecraft:polished_blackstone_bricks if block ~-1 ~ ~ minecraft:polished_blackstone_bricks if block ~-1 ~ ~-1 minecraft:polished_blackstone_bricks if block ~1 ~1 ~1 minecraft:polished_blackstone_bricks if block ~1 ~1 ~ minecraft:polished_blackstone_bricks if block ~1 ~1 ~-1 minecraft:polished_blackstone_bricks if block ~ ~1 ~1 minecraft:black_stained_glass if block ~ ~1 ~ minecraft:air if block ~ ~1 ~-1 minecraft:polished_blackstone_bricks if block ~-1 ~1 ~1 minecraft:polished_blackstone_bricks if block ~-1 ~1 ~ minecraft:polished_blackstone_bricks if block ~-1 ~1 ~-1 minecraft:polished_blackstone_bricks if block ~1 ~2 ~1 minecraft:polished_blackstone_brick_slab if block ~1 ~2 ~ minecraft:polished_blackstone_brick_slab if block ~1 ~2 ~-1 minecraft:polished_blackstone_brick_slab if block ~ ~2 ~1 minecraft:polished_blackstone_brick_slab if block ~ ~2 ~ minecraft:air if block ~ ~2 ~-1 minecraft:polished_blackstone_brick_slab if block ~-1 ~2 ~1 minecraft:polished_blackstone_brick_slab if block ~-1 ~2 ~ minecraft:polished_blackstone_brick_slab if block ~-1 ~2 ~-1 minecraft:polished_blackstone_brick_slab run summon minecraft:area_effect_cloud ~0.5 ~ ~0.5 {Tags:["TinkerersCraft","TC_smeltery","TC_north","TC_outputnull"],Rotation:[0f,0f],Age:-2147483648,Duration:-1,WaitTime:-2147483648}

# south
execute if block ~1 ~-2 ~1 minecraft:lava if block ~1 ~-2 ~ minecraft:lava if block ~1 ~-2 ~-1 minecraft:lava if block ~ ~-2 ~1 minecraft:lava if block ~ ~-2 ~ minecraft:lava if block ~ ~-2 ~-1 minecraft:lava if block ~-1 ~-2 ~1 minecraft:lava if block ~-1 ~-2 ~ minecraft:lava if block ~-1 ~-2 ~-1 minecraft:lava if block ~1 ~-1 ~1 minecraft:polished_blackstone_bricks if block ~1 ~-1 ~ minecraft:polished_blackstone_bricks if block ~1 ~-1 ~-1 minecraft:polished_blackstone_bricks if block ~ ~-1 ~1 minecraft:polished_blackstone_bricks if block ~ ~-1 ~ minecraft:gilded_blackstone if block ~ ~-1 ~-1 minecraft:polished_blackstone_bricks if block ~-1 ~-1 ~1 minecraft:polished_blackstone_bricks if block ~-1 ~-1 ~ minecraft:polished_blackstone_bricks if block ~-1 ~-1 ~-1 minecraft:polished_blackstone_bricks if block ~1 ~ ~1 minecraft:polished_blackstone_bricks if block ~1 ~ ~ minecraft:polished_blackstone_bricks if block ~1 ~ ~-1 minecraft:polished_blackstone_bricks if block ~ ~ ~1 minecraft:polished_blackstone_bricks if block ~ ~ ~ minecraft:air if block ~ ~ ~-1 minecraft:chiseled_polished_blackstone if block ~-1 ~ ~1 minecraft:polished_blackstone_bricks if block ~-1 ~ ~ minecraft:polished_blackstone_bricks if block ~-1 ~ ~-1 minecraft:polished_blackstone_bricks if block ~1 ~1 ~1 minecraft:polished_blackstone_bricks if block ~1 ~1 ~ minecraft:polished_blackstone_bricks if block ~1 ~1 ~-1 minecraft:polished_blackstone_bricks if block ~ ~1 ~1 minecraft:polished_blackstone_bricks if block ~ ~1 ~ minecraft:air if block ~ ~1 ~-1 minecraft:black_stained_glass if block ~-1 ~1 ~1 minecraft:polished_blackstone_bricks if block ~-1 ~1 ~ minecraft:polished_blackstone_bricks if block ~-1 ~1 ~-1 minecraft:polished_blackstone_bricks if block ~1 ~2 ~1 minecraft:polished_blackstone_brick_slab if block ~1 ~2 ~ minecraft:polished_blackstone_brick_slab if block ~1 ~2 ~-1 minecraft:polished_blackstone_brick_slab if block ~ ~2 ~1 minecraft:polished_blackstone_brick_slab if block ~ ~2 ~ minecraft:air if block ~ ~2 ~-1 minecraft:polished_blackstone_brick_slab if block ~-1 ~2 ~1 minecraft:polished_blackstone_brick_slab if block ~-1 ~2 ~ minecraft:polished_blackstone_brick_slab if block ~-1 ~2 ~-1 minecraft:polished_blackstone_brick_slab run summon minecraft:area_effect_cloud ~0.5 ~ ~0.5 {Tags:["TinkerersCraft","TC_smeltery","TC_south","TC_outputnull"],Rotation:[180f,0f],Age:-2147483648,Duration:-1,WaitTime:-2147483648}

# east
execute if block ~1 ~-2 ~1 minecraft:lava if block ~1 ~-2 ~ minecraft:lava if block ~1 ~-2 ~-1 minecraft:lava if block ~ ~-2 ~1 minecraft:lava if block ~ ~-2 ~ minecraft:lava if block ~ ~-2 ~-1 minecraft:lava if block ~-1 ~-2 ~1 minecraft:lava if block ~-1 ~-2 ~ minecraft:lava if block ~-1 ~-2 ~-1 minecraft:lava if block ~1 ~-1 ~1 minecraft:polished_blackstone_bricks if block ~1 ~-1 ~ minecraft:polished_blackstone_bricks if block ~1 ~-1 ~-1 minecraft:polished_blackstone_bricks if block ~ ~-1 ~1 minecraft:polished_blackstone_bricks if block ~ ~-1 ~ minecraft:gilded_blackstone if block ~ ~-1 ~-1 minecraft:polished_blackstone_bricks if block ~-1 ~-1 ~1 minecraft:polished_blackstone_bricks if block ~-1 ~-1 ~ minecraft:polished_blackstone_bricks if block ~-1 ~-1 ~-1 minecraft:polished_blackstone_bricks if block ~1 ~ ~1 minecraft:polished_blackstone_bricks if block ~1 ~ ~ minecraft:polished_blackstone_bricks if block ~1 ~ ~-1 minecraft:polished_blackstone_bricks if block ~ ~ ~1 minecraft:polished_blackstone_bricks if block ~ ~ ~ minecraft:air if block ~ ~ ~-1 minecraft:polished_blackstone_bricks if block ~-1 ~ ~1 minecraft:polished_blackstone_bricks if block ~-1 ~ ~ minecraft:chiseled_polished_blackstone if block ~-1 ~ ~-1 minecraft:polished_blackstone_bricks if block ~1 ~1 ~1 minecraft:polished_blackstone_bricks if block ~1 ~1 ~ minecraft:polished_blackstone_bricks if block ~1 ~1 ~-1 minecraft:polished_blackstone_bricks if block ~ ~1 ~1 minecraft:polished_blackstone_bricks if block ~ ~1 ~ minecraft:air if block ~ ~1 ~-1 minecraft:polished_blackstone_bricks if block ~-1 ~1 ~1 minecraft:polished_blackstone_bricks if block ~-1 ~1 ~ minecraft:black_stained_glass if block ~-1 ~1 ~-1 minecraft:polished_blackstone_bricks if block ~1 ~2 ~1 minecraft:polished_blackstone_brick_slab if block ~1 ~2 ~ minecraft:polished_blackstone_brick_slab if block ~1 ~2 ~-1 minecraft:polished_blackstone_brick_slab if block ~ ~2 ~1 minecraft:polished_blackstone_brick_slab if block ~ ~2 ~ minecraft:air if block ~ ~2 ~-1 minecraft:polished_blackstone_brick_slab if block ~-1 ~2 ~1 minecraft:polished_blackstone_brick_slab if block ~-1 ~2 ~ minecraft:polished_blackstone_brick_slab if block ~-1 ~2 ~-1 minecraft:polished_blackstone_brick_slab run summon minecraft:area_effect_cloud ~0.5 ~ ~0.5 {Tags:["TinkerersCraft","TC_smeltery","TC_east","TC_outputnull"],Rotation:[90f,0f],Age:-2147483648,Duration:-1,WaitTime:-2147483648}

# west
execute if block ~1 ~-2 ~1 minecraft:lava if block ~1 ~-2 ~ minecraft:lava if block ~1 ~-2 ~-1 minecraft:lava if block ~ ~-2 ~1 minecraft:lava if block ~ ~-2 ~ minecraft:lava if block ~ ~-2 ~-1 minecraft:lava if block ~-1 ~-2 ~1 minecraft:lava if block ~-1 ~-2 ~ minecraft:lava if block ~-1 ~-2 ~-1 minecraft:lava if block ~1 ~-1 ~1 minecraft:polished_blackstone_bricks if block ~1 ~-1 ~ minecraft:polished_blackstone_bricks if block ~1 ~-1 ~-1 minecraft:polished_blackstone_bricks if block ~ ~-1 ~1 minecraft:polished_blackstone_bricks if block ~ ~-1 ~ minecraft:gilded_blackstone if block ~ ~-1 ~-1 minecraft:polished_blackstone_bricks if block ~-1 ~-1 ~1 minecraft:polished_blackstone_bricks if block ~-1 ~-1 ~ minecraft:polished_blackstone_bricks if block ~-1 ~-1 ~-1 minecraft:polished_blackstone_bricks if block ~1 ~ ~1 minecraft:polished_blackstone_bricks if block ~1 ~ ~ minecraft:chiseled_polished_blackstone if block ~1 ~ ~-1 minecraft:polished_blackstone_bricks if block ~ ~ ~1 minecraft:polished_blackstone_bricks if block ~ ~ ~ minecraft:air if block ~ ~ ~-1 minecraft:polished_blackstone_bricks if block ~-1 ~ ~1 minecraft:polished_blackstone_bricks if block ~-1 ~ ~ minecraft:polished_blackstone_bricks if block ~-1 ~ ~-1 minecraft:polished_blackstone_bricks if block ~1 ~1 ~1 minecraft:polished_blackstone_bricks if block ~1 ~1 ~ minecraft:black_stained_glass if block ~1 ~1 ~-1 minecraft:polished_blackstone_bricks if block ~ ~1 ~1 minecraft:polished_blackstone_bricks if block ~ ~1 ~ minecraft:air if block ~ ~1 ~-1 minecraft:polished_blackstone_bricks if block ~-1 ~1 ~1 minecraft:polished_blackstone_bricks if block ~-1 ~1 ~ minecraft:polished_blackstone_bricks if block ~-1 ~1 ~-1 minecraft:polished_blackstone_bricks if block ~1 ~2 ~1 minecraft:polished_blackstone_brick_slab if block ~1 ~2 ~ minecraft:polished_blackstone_brick_slab if block ~1 ~2 ~-1 minecraft:polished_blackstone_brick_slab if block ~ ~2 ~1 minecraft:polished_blackstone_brick_slab if block ~ ~2 ~ minecraft:air if block ~ ~2 ~-1 minecraft:polished_blackstone_brick_slab if block ~-1 ~2 ~1 minecraft:polished_blackstone_brick_slab if block ~-1 ~2 ~ minecraft:polished_blackstone_brick_slab if block ~-1 ~2 ~-1 minecraft:polished_blackstone_brick_slab run summon minecraft:area_effect_cloud ~0.5 ~ ~0.5 {Tags:["TinkerersCraft","TC_smeltery","TC_west","TC_outputnull"],Rotation:[270f,0f],Age:-2147483648,Duration:-1,WaitTime:-2147483648}

#> init_smeltery
execute as @s at @s as @e[tag=TC_smeltery,distance=..2] run function tinkererscraft:modules/smeltery/initialize


#> End of file
#> -----------