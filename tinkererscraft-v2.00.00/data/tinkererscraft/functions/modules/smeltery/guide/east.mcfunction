#> -----------------------------------------------
#> Tinkerer's Craft Datapack
#> This code is protected by the GNU GPLv3 License
#> © 2020 Portyl Studios
#> https://portylstudios.com
#> -----------------------------------------------


#> east (references: ../modules/smeltery/guide)
# The script displays a guide of the east orientation of the multi-block smeltery structure


# fuel layer
#bottom corners (far right - far left - close right - close left)
execute as @s at @s positioned ~6 ~-1 ~-1 align xyz run particle minecraft:flame ~1 ~ ~ 0 0 0 0 1 force
execute as @s at @s positioned ~6 ~-1 ~1 align xyz run particle minecraft:flame ~1 ~ ~1 0 0 0 0 1 force
execute as @s at @s positioned ~4 ~-1 ~-1 align xyz run particle minecraft:flame ~ ~ ~ 0 0 0 0 1 force
execute as @s at @s positioned ~4 ~-1 ~1 align xyz run particle minecraft:flame ~ ~ ~1 0 0 0 0 1 force

#middle corners (far right - far left - close right - close left)
execute as @s at @s positioned ~6 ~-1 ~-1 align xyz run particle minecraft:flame ~1 ~0.5 ~ 0 0 0 0 1 force
execute as @s at @s positioned ~6 ~-1 ~1 align xyz run particle minecraft:flame ~1 ~0.5 ~1 0 0 0 0 1 force
execute as @s at @s positioned ~4 ~-1 ~-1 align xyz run particle minecraft:flame ~ ~0.5 ~ 0 0 0 0 1 force
execute as @s at @s positioned ~4 ~-1 ~1 align xyz run particle minecraft:flame ~ ~0.5 ~1 0 0 0 0 1 force

#top corners (far right - far left - close right - close left)
execute as @s at @s positioned ~6 ~-1 ~-1 align xyz run particle minecraft:flame ~1 ~1 ~ 0 0 0 0 1 force
execute as @s at @s positioned ~6 ~-1 ~1 align xyz run particle minecraft:flame ~1 ~1 ~1 0 0 0 0 1 force
execute as @s at @s positioned ~4 ~-1 ~-1 align xyz run particle minecraft:flame ~ ~1 ~ 0 0 0 0 1 force
execute as @s at @s positioned ~4 ~-1 ~1 align xyz run particle minecraft:flame ~ ~1 ~1 0 0 0 0 1 force

#bottom left and right lines (far right - far left - close right - close left)
execute as @s at @s positioned ~5 ~-1 ~-1 align xyz run particle minecraft:flame ~1 ~ ~ 0 0 0 0 1 force
execute as @s at @s positioned ~5 ~-1 ~1 align xyz run particle minecraft:flame ~1 ~ ~1 0 0 0 0 1 force
execute as @s at @s positioned ~5 ~-1 ~-1 align xyz run particle minecraft:flame ~ ~ ~ 0 0 0 0 1 force
execute as @s at @s positioned ~5 ~-1 ~1 align xyz run particle minecraft:flame ~ ~ ~1 0 0 0 0 1 force

#top left and right lines (far right - far left - close right - close left)
execute as @s at @s positioned ~5 ~-1 ~-1 align xyz run particle minecraft:flame ~1 ~1 ~ 0 0 0 0 1 force
execute as @s at @s positioned ~5 ~-1 ~1 align xyz run particle minecraft:flame ~1 ~1 ~1 0 0 0 0 1 force
execute as @s at @s positioned ~5 ~-1 ~-1 align xyz run particle minecraft:flame ~ ~1 ~ 0 0 0 0 1 force
execute as @s at @s positioned ~5 ~-1 ~1 align xyz run particle minecraft:flame ~ ~1 ~1 0 0 0 0 1 force

#bottom close and far lines (far right - far left - close right - close left)
execute as @s at @s positioned ~6 ~-1 ~ align xyz run particle minecraft:flame ~1 ~ ~ 0 0 0 0 1 force
execute as @s at @s positioned ~6 ~-1 ~ align xyz run particle minecraft:flame ~1 ~ ~1 0 0 0 0 1 force
execute as @s at @s positioned ~4 ~-1 ~ align xyz run particle minecraft:flame ~ ~ ~ 0 0 0 0 1 force
execute as @s at @s positioned ~4 ~-1 ~ align xyz run particle minecraft:flame ~ ~ ~1 0 0 0 0 1 force

#top close and far lines (far right - far left - close right - close left)
execute as @s at @s positioned ~6 ~-1 ~ align xyz run particle minecraft:flame ~1 ~1 ~ 0 0 0 0 1 force
execute as @s at @s positioned ~6 ~-1 ~ align xyz run particle minecraft:flame ~1 ~1 ~1 0 0 0 0 1 force
execute as @s at @s positioned ~4 ~-1 ~ align xyz run particle minecraft:flame ~ ~1 ~ 0 0 0 0 1 force
execute as @s at @s positioned ~4 ~-1 ~ align xyz run particle minecraft:flame ~ ~1 ~1 0 0 0 0 1 force


# base layer
execute as @s at @s positioned ~6 ~ ~-1 align xyz run summon minecraft:falling_block ~0.5 ~ ~0.5 {BlockState:{Name:polished_blackstone_bricks},Tags:["TinkerersCraft","TC_guideBlock"],NoGravity:1b}
execute as @s at @s positioned ~6 ~ ~ align xyz run summon minecraft:falling_block ~0.5 ~ ~0.5 {BlockState:{Name:polished_blackstone_bricks},Tags:["TinkerersCraft","TC_guideBlock"],NoGravity:1b}
execute as @s at @s positioned ~6 ~ ~1 align xyz run summon minecraft:falling_block ~0.5 ~ ~0.5 {BlockState:{Name:polished_blackstone_bricks},Tags:["TinkerersCraft","TC_guideBlock"],NoGravity:1b}
execute as @s at @s positioned ~5 ~ ~-1 align xyz run summon minecraft:falling_block ~0.5 ~ ~0.5 {BlockState:{Name:polished_blackstone_bricks},Tags:["TinkerersCraft","TC_guideBlock"],NoGravity:1b}
execute as @s at @s positioned ~5 ~ ~ align xyz run summon minecraft:falling_block ~0.5 ~ ~0.5 {BlockState:{Name:gilded_blackstone},Tags:["TinkerersCraft","TC_guideBlock"],NoGravity:1b}
execute as @s at @s positioned ~5 ~ ~1 align xyz run summon minecraft:falling_block ~0.5 ~ ~0.5 {BlockState:{Name:polished_blackstone_bricks},Tags:["TinkerersCraft","TC_guideBlock"],NoGravity:1b}
execute as @s at @s positioned ~4 ~ ~-1 align xyz run summon minecraft:falling_block ~0.5 ~ ~0.5 {BlockState:{Name:polished_blackstone_bricks},Tags:["TinkerersCraft","TC_guideBlock"],NoGravity:1b}
execute as @s at @s positioned ~4 ~ ~ align xyz run summon minecraft:falling_block ~0.5 ~ ~0.5 {BlockState:{Name:polished_blackstone_bricks},Tags:["TinkerersCraft","TC_guideBlock"],NoGravity:1b}
execute as @s at @s positioned ~4 ~ ~1 align xyz run summon minecraft:falling_block ~0.5 ~ ~0.5 {BlockState:{Name:polished_blackstone_bricks},Tags:["TinkerersCraft","TC_guideBlock"],NoGravity:1b}

# control Layer
execute as @s at @s positioned ~6 ~1 ~-1 align xyz run summon minecraft:falling_block ~0.5 ~ ~0.5 {BlockState:{Name:polished_blackstone_bricks},Tags:["TinkerersCraft","TC_guideBlock"],NoGravity:1b}
execute as @s at @s positioned ~6 ~1 ~ align xyz run summon minecraft:falling_block ~0.5 ~ ~0.5 {BlockState:{Name:polished_blackstone_bricks},Tags:["TinkerersCraft","TC_guideBlock"],NoGravity:1b}
execute as @s at @s positioned ~6 ~1 ~1 align xyz run summon minecraft:falling_block ~0.5 ~ ~0.5 {BlockState:{Name:polished_blackstone_bricks},Tags:["TinkerersCraft","TC_guideBlock"],NoGravity:1b}
execute as @s at @s positioned ~5 ~1 ~-1 align xyz run summon minecraft:falling_block ~0.5 ~ ~0.5 {BlockState:{Name:polished_blackstone_bricks},Tags:["TinkerersCraft","TC_guideBlock"],NoGravity:1b}
execute as @s at @s positioned ~5 ~1 ~1 align xyz run summon minecraft:falling_block ~0.5 ~ ~0.5 {BlockState:{Name:polished_blackstone_bricks},Tags:["TinkerersCraft","TC_guideBlock"],NoGravity:1b}
execute as @s at @s positioned ~4 ~1 ~-1 align xyz run summon minecraft:falling_block ~0.5 ~ ~0.5 {BlockState:{Name:polished_blackstone_bricks},Tags:["TinkerersCraft","TC_guideBlock"],NoGravity:1b}
execute as @s at @s positioned ~4 ~1 ~ align xyz run summon minecraft:falling_block ~0.5 ~ ~0.5 {BlockState:{Name:chiseled_polished_blackstone},Tags:["TinkerersCraft","TC_guideBlock"],NoGravity:1b}
execute as @s at @s positioned ~4 ~1 ~1 align xyz run summon minecraft:falling_block ~0.5 ~ ~0.5 {BlockState:{Name:polished_blackstone_bricks},Tags:["TinkerersCraft","TC_guideBlock"],NoGravity:1b}
execute as @s at @s positioned ~3 ~1 ~ align xyz run summon minecraft:falling_block ~0.5 ~ ~0.5 {BlockState:{Name:lever,Properties:{facing:west}},Tags:["TinkerersCraft","TC_guideBlock"],NoGravity:1b}

# display Layer
execute as @s at @s positioned ~6 ~2 ~-1 align xyz run summon minecraft:falling_block ~0.5 ~ ~0.5 {BlockState:{Name:polished_blackstone_bricks},Tags:["TinkerersCraft","TC_guideBlock"],NoGravity:1b}
execute as @s at @s positioned ~6 ~2 ~ align xyz run summon minecraft:falling_block ~0.5 ~ ~0.5 {BlockState:{Name:polished_blackstone_bricks},Tags:["TinkerersCraft","TC_guideBlock"],NoGravity:1b}
execute as @s at @s positioned ~6 ~2 ~1 align xyz run summon minecraft:falling_block ~0.5 ~ ~0.5 {BlockState:{Name:polished_blackstone_bricks},Tags:["TinkerersCraft","TC_guideBlock"],NoGravity:1b}
execute as @s at @s positioned ~5 ~2 ~-1 align xyz run summon minecraft:falling_block ~0.5 ~ ~0.5 {BlockState:{Name:polished_blackstone_bricks},Tags:["TinkerersCraft","TC_guideBlock"],NoGravity:1b}
execute as @s at @s positioned ~5 ~2 ~1 align xyz run summon minecraft:falling_block ~0.5 ~ ~0.5 {BlockState:{Name:polished_blackstone_bricks},Tags:["TinkerersCraft","TC_guideBlock"],NoGravity:1b}
execute as @s at @s positioned ~4 ~2 ~-1 align xyz run summon minecraft:falling_block ~0.5 ~ ~0.5 {BlockState:{Name:polished_blackstone_bricks},Tags:["TinkerersCraft","TC_guideBlock"],NoGravity:1b}
execute as @s at @s positioned ~4 ~2 ~ align xyz run summon minecraft:area_effect_cloud ~0.5 ~-0.3 ~0.5 {CustomName:"{\"text\":\"Guide\"}",CustomNameVisible:1b,Tags:["TinkerersCraft","TC_guideBlock"],Rotation:[0f,0f],Duration:10}
execute as @s at @s positioned ~4 ~2 ~1 align xyz run summon minecraft:falling_block ~0.5 ~ ~0.5 {BlockState:{Name:polished_blackstone_bricks},Tags:["TinkerersCraft","TC_guideBlock"],NoGravity:1b}

# cap layer
execute as @s at @s positioned ~6 ~3 ~-1 align xyz run summon minecraft:falling_block ~0.5 ~ ~0.5 {BlockState:{Name:polished_blackstone_brick_slab},Tags:["TinkerersCraft","TC_guideBlock"],NoGravity:1b}
execute as @s at @s positioned ~6 ~3 ~ align xyz run summon minecraft:falling_block ~0.5 ~ ~0.5 {BlockState:{Name:polished_blackstone_brick_slab},Tags:["TinkerersCraft","TC_guideBlock"],NoGravity:1b}
execute as @s at @s positioned ~6 ~3 ~1 align xyz run summon minecraft:falling_block ~0.5 ~ ~0.5 {BlockState:{Name:polished_blackstone_brick_slab},Tags:["TinkerersCraft","TC_guideBlock"],NoGravity:1b}
execute as @s at @s positioned ~5 ~3 ~-1 align xyz run summon minecraft:falling_block ~0.5 ~ ~0.5 {BlockState:{Name:polished_blackstone_brick_slab},Tags:["TinkerersCraft","TC_guideBlock"],NoGravity:1b}
execute as @s at @s positioned ~5 ~3 ~1 align xyz run summon minecraft:falling_block ~0.5 ~ ~0.5 {BlockState:{Name:polished_blackstone_brick_slab},Tags:["TinkerersCraft","TC_guideBlock"],NoGravity:1b}
execute as @s at @s positioned ~4 ~3 ~-1 align xyz run summon minecraft:falling_block ~0.5 ~ ~0.5 {BlockState:{Name:polished_blackstone_brick_slab},Tags:["TinkerersCraft","TC_guideBlock"],NoGravity:1b}
execute as @s at @s positioned ~4 ~3 ~ align xyz run summon minecraft:falling_block ~0.5 ~ ~0.5 {BlockState:{Name:polished_blackstone_brick_slab},Tags:["TinkerersCraft","TC_guideBlock"],NoGravity:1b}
execute as @s at @s positioned ~4 ~3 ~1 align xyz run summon minecraft:falling_block ~0.5 ~ ~0.5 {BlockState:{Name:polished_blackstone_brick_slab},Tags:["TinkerersCraft","TC_guideBlock"],NoGravity:1b}


#todo:gc
kill @e[tag=TC_guideBlock]


#> End of file
#> -----------
