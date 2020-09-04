#> south_smeltery.mcfunction
# The script displays a guide of the south orientation of the multi-block smeltery structure
#

# fuel layer
#bottom corners
execute in minecraft:overworld as @e[tag=TC_activateGuideBook,tag=TC_facingSouth] at @s positioned ~-1 ~-1 ~6 align xyz run particle minecraft:flame ~ ~ ~1 0 0 0 0 1 force
execute in minecraft:overworld as @e[tag=TC_activateGuideBook,tag=TC_facingSouth] at @s positioned ~1 ~-1 ~6 align xyz run particle minecraft:flame ~1 ~ ~1 0 0 0 0 1 force
execute in minecraft:overworld as @e[tag=TC_activateGuideBook,tag=TC_facingSouth] at @s positioned ~-1 ~-1 ~4 align xyz run particle minecraft:flame ~ ~ ~ 0 0 0 0 1 force
execute in minecraft:overworld as @e[tag=TC_activateGuideBook,tag=TC_facingSouth] at @s positioned ~1 ~-1 ~4 align xyz run particle minecraft:flame ~1 ~ ~ 0 0 0 0 1 force

#top corners
execute in minecraft:overworld as @e[tag=TC_activateGuideBook,tag=TC_facingSouth] at @s positioned ~-1 ~-1 ~6 align xyz run particle minecraft:flame ~ ~1 ~1 0 0 0 0 1 force
execute in minecraft:overworld as @e[tag=TC_activateGuideBook,tag=TC_facingSouth] at @s positioned ~1 ~-1 ~6 align xyz run particle minecraft:flame ~1 ~1 ~1 0 0 0 0 1 force
execute in minecraft:overworld as @e[tag=TC_activateGuideBook,tag=TC_facingSouth] at @s positioned ~-1 ~-1 ~4 align xyz run particle minecraft:flame ~ ~1 ~ 0 0 0 0 1 force
execute in minecraft:overworld as @e[tag=TC_activateGuideBook,tag=TC_facingSouth] at @s positioned ~1 ~-1 ~4 align xyz run particle minecraft:flame ~1 ~1 ~ 0 0 0 0 1 force

#fill
execute in minecraft:overworld as @e[tag=TC_activateGuideBook,tag=TC_facingSouth] at @s positioned ~ ~-1 ~5 align xyz run particle minecraft:flame ~0.5 ~0.5 ~0.5 0.6 0.2 0.6 0 1 force

# base layer
execute in minecraft:overworld as @e[tag=TC_activateGuideBook,tag=TC_facingSouth] at @s positioned ~-1 ~ ~6 align xyz run summon minecraft:falling_block ~0.5 ~ ~0.5 {BlockState:{Name:polished_blackstone_bricks},Tags:["TinkerersCraft","TC_guideBlock"],NoGravity:1b}
execute in minecraft:overworld as @e[tag=TC_activateGuideBook,tag=TC_facingSouth] at @s positioned ~ ~ ~6 align xyz run summon minecraft:falling_block ~0.5 ~ ~0.5 {BlockState:{Name:polished_blackstone_bricks},Tags:["TinkerersCraft","TC_guideBlock"],NoGravity:1b}
execute in minecraft:overworld as @e[tag=TC_activateGuideBook,tag=TC_facingSouth] at @s positioned ~1 ~ ~6 align xyz run summon minecraft:falling_block ~0.5 ~ ~0.5 {BlockState:{Name:polished_blackstone_bricks},Tags:["TinkerersCraft","TC_guideBlock"],NoGravity:1b}
execute in minecraft:overworld as @e[tag=TC_activateGuideBook,tag=TC_facingSouth] at @s positioned ~-1 ~ ~5 align xyz run summon minecraft:falling_block ~0.5 ~ ~0.5 {BlockState:{Name:polished_blackstone_bricks},Tags:["TinkerersCraft","TC_guideBlock"],NoGravity:1b}
execute in minecraft:overworld as @e[tag=TC_activateGuideBook,tag=TC_facingSouth] at @s positioned ~ ~ ~5 align xyz run summon minecraft:falling_block ~0.5 ~ ~0.5 {BlockState:{Name:gilded_blackstone},Tags:["TinkerersCraft","TC_guideBlock"],NoGravity:1b}
execute in minecraft:overworld as @e[tag=TC_activateGuideBook,tag=TC_facingSouth] at @s positioned ~1 ~ ~5 align xyz run summon minecraft:falling_block ~0.5 ~ ~0.5 {BlockState:{Name:polished_blackstone_bricks},Tags:["TinkerersCraft","TC_guideBlock"],NoGravity:1b}
execute in minecraft:overworld as @e[tag=TC_activateGuideBook,tag=TC_facingSouth] at @s positioned ~-1 ~ ~4 align xyz run summon minecraft:falling_block ~0.5 ~ ~0.5 {BlockState:{Name:polished_blackstone_bricks},Tags:["TinkerersCraft","TC_guideBlock"],NoGravity:1b}
execute in minecraft:overworld as @e[tag=TC_activateGuideBook,tag=TC_facingSouth] at @s positioned ~ ~ ~4 align xyz run summon minecraft:falling_block ~0.5 ~ ~0.5 {BlockState:{Name:polished_blackstone_bricks},Tags:["TinkerersCraft","TC_guideBlock"],NoGravity:1b}
execute in minecraft:overworld as @e[tag=TC_activateGuideBook,tag=TC_facingSouth] at @s positioned ~1 ~ ~4 align xyz run summon minecraft:falling_block ~0.5 ~ ~0.5 {BlockState:{Name:polished_blackstone_bricks},Tags:["TinkerersCraft","TC_guideBlock"],NoGravity:1b}

# control Layer
execute in minecraft:overworld as @e[tag=TC_activateGuideBook,tag=TC_facingSouth] at @s positioned ~-1 ~1 ~6 align xyz run summon minecraft:falling_block ~0.5 ~ ~0.5 {BlockState:{Name:polished_blackstone_bricks},Tags:["TinkerersCraft","TC_guideBlock"],NoGravity:1b}
execute in minecraft:overworld as @e[tag=TC_activateGuideBook,tag=TC_facingSouth] at @s positioned ~ ~1 ~6 align xyz run summon minecraft:falling_block ~0.5 ~ ~0.5 {BlockState:{Name:polished_blackstone_bricks},Tags:["TinkerersCraft","TC_guideBlock"],NoGravity:1b}
execute in minecraft:overworld as @e[tag=TC_activateGuideBook,tag=TC_facingSouth] at @s positioned ~1 ~1 ~6 align xyz run summon minecraft:falling_block ~0.5 ~ ~0.5 {BlockState:{Name:polished_blackstone_bricks},Tags:["TinkerersCraft","TC_guideBlock"],NoGravity:1b}
execute in minecraft:overworld as @e[tag=TC_activateGuideBook,tag=TC_facingSouth] at @s positioned ~-1 ~1 ~5 align xyz run summon minecraft:falling_block ~0.5 ~ ~0.5 {BlockState:{Name:polished_blackstone_bricks},Tags:["TinkerersCraft","TC_guideBlock"],NoGravity:1b}
execute in minecraft:overworld as @e[tag=TC_activateGuideBook,tag=TC_facingSouth] at @s positioned ~1 ~1 ~5 align xyz run summon minecraft:falling_block ~0.5 ~ ~0.5 {BlockState:{Name:polished_blackstone_bricks},Tags:["TinkerersCraft","TC_guideBlock"],NoGravity:1b}
execute in minecraft:overworld as @e[tag=TC_activateGuideBook,tag=TC_facingSouth] at @s positioned ~-1 ~1 ~4 align xyz run summon minecraft:falling_block ~0.5 ~ ~0.5 {BlockState:{Name:polished_blackstone_bricks},Tags:["TinkerersCraft","TC_guideBlock"],NoGravity:1b}
execute in minecraft:overworld as @e[tag=TC_activateGuideBook,tag=TC_facingSouth] at @s positioned ~ ~1 ~4 align xyz run summon minecraft:falling_block ~0.5 ~ ~0.5 {BlockState:{Name:chiseled_polished_blackstone},Tags:["TinkerersCraft","TC_guideBlock"],NoGravity:1b}
execute in minecraft:overworld as @e[tag=TC_activateGuideBook,tag=TC_facingSouth] at @s positioned ~1 ~1 ~4 align xyz run summon minecraft:falling_block ~0.5 ~ ~0.5 {BlockState:{Name:polished_blackstone_bricks},Tags:["TinkerersCraft","TC_guideBlock"],NoGravity:1b}
execute in minecraft:overworld as @e[tag=TC_activateGuideBook,tag=TC_facingSouth] at @s positioned ~ ~1 ~3 align xyz run summon minecraft:falling_block ~0.5 ~ ~0.5 {BlockState:{Name:lever,Properties:{facing:north}},Tags:["TinkerersCraft","TC_guideBlock"],NoGravity:1b}

# display Layer
execute in minecraft:overworld as @e[tag=TC_activateGuideBook,tag=TC_facingSouth] at @s positioned ~-1 ~2 ~6 align xyz run summon minecraft:falling_block ~0.5 ~ ~0.5 {BlockState:{Name:polished_blackstone_bricks},Tags:["TinkerersCraft","TC_guideBlock"],NoGravity:1b}
execute in minecraft:overworld as @e[tag=TC_activateGuideBook,tag=TC_facingSouth] at @s positioned ~ ~2 ~6 align xyz run summon minecraft:falling_block ~0.5 ~ ~0.5 {BlockState:{Name:polished_blackstone_bricks},Tags:["TinkerersCraft","TC_guideBlock"],NoGravity:1b}
execute in minecraft:overworld as @e[tag=TC_activateGuideBook,tag=TC_facingSouth] at @s positioned ~1 ~2 ~6 align xyz run summon minecraft:falling_block ~0.5 ~ ~0.5 {BlockState:{Name:polished_blackstone_bricks},Tags:["TinkerersCraft","TC_guideBlock"],NoGravity:1b}
execute in minecraft:overworld as @e[tag=TC_activateGuideBook,tag=TC_facingSouth] at @s positioned ~-1 ~2 ~5 align xyz run summon minecraft:falling_block ~0.5 ~ ~0.5 {BlockState:{Name:polished_blackstone_bricks},Tags:["TinkerersCraft","TC_guideBlock"],NoGravity:1b}
execute in minecraft:overworld as @e[tag=TC_activateGuideBook,tag=TC_facingSouth] at @s positioned ~1 ~2 ~5 align xyz run summon minecraft:falling_block ~0.5 ~ ~0.5 {BlockState:{Name:polished_blackstone_bricks},Tags:["TinkerersCraft","TC_guideBlock"],NoGravity:1b}
execute in minecraft:overworld as @e[tag=TC_activateGuideBook,tag=TC_facingSouth] at @s positioned ~-1 ~2 ~4 align xyz run summon minecraft:falling_block ~0.5 ~ ~0.5 {BlockState:{Name:polished_blackstone_bricks},Tags:["TinkerersCraft","TC_guideBlock"],NoGravity:1b}
execute in minecraft:overworld as @e[tag=TC_activateGuideBook,tag=TC_facingSouth] at @s positioned ~ ~2 ~4 align xyz run summon minecraft:area_effect_cloud ~0.5 ~-0.3 ~0.5 {CustomName:"{\"text\":\"Guide\"}",CustomNameVisible:1b,Tags:["TinkerersCraft","TC_guideBlock"],Rotation:[0f,0f],Duration:10}
execute in minecraft:overworld as @e[tag=TC_activateGuideBook,tag=TC_facingSouth] at @s positioned ~1 ~2 ~4 align xyz run summon minecraft:falling_block ~0.5 ~ ~0.5 {BlockState:{Name:polished_blackstone_bricks},Tags:["TinkerersCraft","TC_guideBlock"],NoGravity:1b}

# cap layer
execute in minecraft:overworld as @e[tag=TC_activateGuideBook,tag=TC_facingSouth] at @s positioned ~-1 ~3 ~6 align xyz run summon minecraft:falling_block ~0.5 ~ ~0.5 {BlockState:{Name:polished_blackstone_brick_slab},Tags:["TinkerersCraft","TC_guideBlock"],NoGravity:1b}
execute in minecraft:overworld as @e[tag=TC_activateGuideBook,tag=TC_facingSouth] at @s positioned ~ ~3 ~6 align xyz run summon minecraft:falling_block ~0.5 ~ ~0.5 {BlockState:{Name:polished_blackstone_brick_slab},Tags:["TinkerersCraft","TC_guideBlock"],NoGravity:1b}
execute in minecraft:overworld as @e[tag=TC_activateGuideBook,tag=TC_facingSouth] at @s positioned ~1 ~3 ~6 align xyz run summon minecraft:falling_block ~0.5 ~ ~0.5 {BlockState:{Name:polished_blackstone_brick_slab},Tags:["TinkerersCraft","TC_guideBlock"],NoGravity:1b}
execute in minecraft:overworld as @e[tag=TC_activateGuideBook,tag=TC_facingSouth] at @s positioned ~-1 ~3 ~5 align xyz run summon minecraft:falling_block ~0.5 ~ ~0.5 {BlockState:{Name:polished_blackstone_brick_slab},Tags:["TinkerersCraft","TC_guideBlock"],NoGravity:1b}
execute in minecraft:overworld as @e[tag=TC_activateGuideBook,tag=TC_facingSouth] at @s positioned ~1 ~3 ~5 align xyz run summon minecraft:falling_block ~0.5 ~ ~0.5 {BlockState:{Name:polished_blackstone_brick_slab},Tags:["TinkerersCraft","TC_guideBlock"],NoGravity:1b}
execute in minecraft:overworld as @e[tag=TC_activateGuideBook,tag=TC_facingSouth] at @s positioned ~-1 ~3 ~4 align xyz run summon minecraft:falling_block ~0.5 ~ ~0.5 {BlockState:{Name:polished_blackstone_brick_slab},Tags:["TinkerersCraft","TC_guideBlock"],NoGravity:1b}
execute in minecraft:overworld as @e[tag=TC_activateGuideBook,tag=TC_facingSouth] at @s positioned ~ ~3 ~4 align xyz run summon minecraft:falling_block ~0.5 ~ ~0.5 {BlockState:{Name:polished_blackstone_brick_slab},Tags:["TinkerersCraft","TC_guideBlock"],NoGravity:1b}
execute in minecraft:overworld as @e[tag=TC_activateGuideBook,tag=TC_facingSouth] at @s positioned ~1 ~3 ~4 align xyz run summon minecraft:falling_block ~0.5 ~ ~0.5 {BlockState:{Name:polished_blackstone_brick_slab},Tags:["TinkerersCraft","TC_guideBlock"],NoGravity:1b}


execute in minecraft:overworld as @e[tag=TC_guideBlock] run kill @s
