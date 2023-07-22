# displays a guide of the multi-block smeltery structure


# fuel layer
#bottom corners (far right - far left - close right - close left)
execute as @s at @s positioned ~-1 ~-1 ~-1 align xyz run particle minecraft:flame ~ ~ ~ 0 0 0 0 1 force
execute as @s at @s positioned ~1 ~-1 ~-1 align xyz run particle minecraft:flame ~1 ~ ~ 0 0 0 0 1 force
execute as @s at @s positioned ~-1 ~-1 ~1 align xyz run particle minecraft:flame ~ ~ ~1 0 0 0 0 1 force
execute as @s at @s positioned ~1 ~-1 ~1 align xyz run particle minecraft:flame ~1 ~ ~1 0 0 0 0 1 force

#middle corners (far right - far left - close right - close left)
execute as @s at @s positioned ~-1 ~-1 ~-1 align xyz run particle minecraft:flame ~ ~0.5 ~ 0 0 0 0 1 force
execute as @s at @s positioned ~1 ~-1 ~-1 align xyz run particle minecraft:flame ~1 ~0.5 ~ 0 0 0 0 1 force
execute as @s at @s positioned ~-1 ~-1 ~1 align xyz run particle minecraft:flame ~ ~0.5 ~1 0 0 0 0 1 force
execute as @s at @s positioned ~1 ~-1 ~1 align xyz run particle minecraft:flame ~1 ~0.5 ~1 0 0 0 0 1 force

#top corners (far right - far left - close right - close left)
execute as @s at @s positioned ~-1 ~-1 ~-1 align xyz run particle minecraft:flame ~ ~1 ~ 0 0 0 0 1 force
execute as @s at @s positioned ~1 ~-1 ~-1 align xyz run particle minecraft:flame ~1 ~1 ~ 0 0 0 0 1 force
execute as @s at @s positioned ~-1 ~-1 ~1 align xyz run particle minecraft:flame ~ ~1 ~1 0 0 0 0 1 force
execute as @s at @s positioned ~1 ~-1 ~1 align xyz run particle minecraft:flame ~1 ~1 ~1 0 0 0 0 1 force

#bottom left and right lines (far right - far left - close right - close left)
execute as @s at @s positioned ~-1 ~-1 ~ align xyz run particle minecraft:flame ~ ~ ~ 0 0 0 0 1 force
execute as @s at @s positioned ~1 ~-1 ~ align xyz run particle minecraft:flame ~1 ~ ~ 0 0 0 0 1 force
execute as @s at @s positioned ~-1 ~-1 ~ align xyz run particle minecraft:flame ~ ~ ~1 0 0 0 0 1 force
execute as @s at @s positioned ~1 ~-1 ~ align xyz run particle minecraft:flame ~1 ~ ~1 0 0 0 0 1 force

#top left and right lines (far right - far left - close right - close left)
execute as @s at @s positioned ~-1 ~-1 ~ align xyz run particle minecraft:flame ~ ~1 ~ 0 0 0 0 1 force
execute as @s at @s positioned ~1 ~-1 ~ align xyz run particle minecraft:flame ~1 ~1 ~ 0 0 0 0 1 force
execute as @s at @s positioned ~-1 ~-1 ~ align xyz run particle minecraft:flame ~ ~1 ~1 0 0 0 0 1 force
execute as @s at @s positioned ~1 ~-1 ~ align xyz run particle minecraft:flame ~1 ~1 ~1 0 0 0 0 1 force

#bottom close and far lines (far right - far left - close right - close left)
execute as @s at @s positioned ~ ~-1 ~-1 align xyz run particle minecraft:flame ~ ~ ~ 0 0 0 0 1 force
execute as @s at @s positioned ~ ~-1 ~-1 align xyz run particle minecraft:flame ~1 ~ ~ 0 0 0 0 1 force
execute as @s at @s positioned ~ ~-1 ~1 align xyz run particle minecraft:flame ~ ~ ~1 0 0 0 0 1 force
execute as @s at @s positioned ~ ~-1 ~1 align xyz run particle minecraft:flame ~1 ~ ~1 0 0 0 0 1 force

#top close and far lines (far right - far left - close right - close left)
execute as @s at @s positioned ~ ~-1 ~-1 align xyz run particle minecraft:flame ~ ~1 ~ 0 0 0 0 1 force
execute as @s at @s positioned ~ ~-1 ~-1 align xyz run particle minecraft:flame ~1 ~1 ~ 0 0 0 0 1 force
execute as @s at @s positioned ~ ~-1 ~1 align xyz run particle minecraft:flame ~ ~1 ~1 0 0 0 0 1 force
execute as @s at @s positioned ~ ~-1 ~1 align xyz run particle minecraft:flame ~1 ~1 ~1 0 0 0 0 1 force


# base layer
execute as @s at @s positioned ~-1 ~ ~-1 align xyz run summon minecraft:falling_block ~0.5 ~ ~0.5 {BlockState:{Name:"polished_blackstone_bricks"},Tags:["TinkerersCraft","TC_guideBlock"],NoGravity:1b}
execute as @s at @s positioned ~ ~ ~-1 align xyz run summon minecraft:falling_block ~0.5 ~ ~0.5 {BlockState:{Name:"polished_blackstone_bricks"},Tags:["TinkerersCraft","TC_guideBlock"],NoGravity:1b}
execute as @s at @s positioned ~1 ~ ~-1 align xyz run summon minecraft:falling_block ~0.5 ~ ~0.5 {BlockState:{Name:"polished_blackstone_bricks"},Tags:["TinkerersCraft","TC_guideBlock"],NoGravity:1b}
execute as @s at @s positioned ~-1 ~ ~ align xyz run summon minecraft:falling_block ~0.5 ~ ~0.5 {BlockState:{Name:"polished_blackstone_bricks"},Tags:["TinkerersCraft","TC_guideBlock"],NoGravity:1b}
execute as @s at @s positioned ~ ~ ~ align xyz run summon minecraft:falling_block ~0.5 ~ ~0.5 {BlockState:{Name:"gilded_blackstone"},Tags:["TinkerersCraft","TC_guideBlock"],NoGravity:1b}
execute as @s at @s positioned ~1 ~ ~ align xyz run summon minecraft:falling_block ~0.5 ~ ~0.5 {BlockState:{Name:"polished_blackstone_bricks"},Tags:["TinkerersCraft","TC_guideBlock"],NoGravity:1b}
execute as @s at @s positioned ~-1 ~ ~1 align xyz run summon minecraft:falling_block ~0.5 ~ ~0.5 {BlockState:{Name:"polished_blackstone_bricks"},Tags:["TinkerersCraft","TC_guideBlock"],NoGravity:1b}
execute as @s at @s positioned ~ ~ ~1 align xyz run summon minecraft:falling_block ~0.5 ~ ~0.5 {BlockState:{Name:"polished_blackstone_bricks"},Tags:["TinkerersCraft","TC_guideBlock"],NoGravity:1b}
execute as @s at @s positioned ~1 ~ ~1 align xyz run summon minecraft:falling_block ~0.5 ~ ~0.5 {BlockState:{Name:"polished_blackstone_bricks"},Tags:["TinkerersCraft","TC_guideBlock"],NoGravity:1b}


# cap layer
execute as @s at @s positioned ~-1 ~3 ~-1 align xyz run summon minecraft:falling_block ~0.5 ~ ~0.5 {BlockState:{Name:"polished_blackstone_brick_slab"},Tags:["TinkerersCraft","TC_guideBlock"],NoGravity:1b}
execute as @s at @s positioned ~ ~3 ~-1 align xyz run summon minecraft:falling_block ~0.5 ~ ~0.5 {BlockState:{Name:"polished_blackstone_brick_slab"},Tags:["TinkerersCraft","TC_guideBlock"],NoGravity:1b}
execute as @s at @s positioned ~1 ~3 ~-1 align xyz run summon minecraft:falling_block ~0.5 ~ ~0.5 {BlockState:{Name:"polished_blackstone_brick_slab"},Tags:["TinkerersCraft","TC_guideBlock"],NoGravity:1b}
execute as @s at @s positioned ~-1 ~3 ~ align xyz run summon minecraft:falling_block ~0.5 ~ ~0.5 {BlockState:{Name:"polished_blackstone_brick_slab"},Tags:["TinkerersCraft","TC_guideBlock"],NoGravity:1b}
execute as @s at @s positioned ~1 ~3 ~ align xyz run summon minecraft:falling_block ~0.5 ~ ~0.5 {BlockState:{Name:"polished_blackstone_brick_slab"},Tags:["TinkerersCraft","TC_guideBlock"],NoGravity:1b}
execute as @s at @s positioned ~-1 ~3 ~1 align xyz run summon minecraft:falling_block ~0.5 ~ ~0.5 {BlockState:{Name:"polished_blackstone_brick_slab"},Tags:["TinkerersCraft","TC_guideBlock"],NoGravity:1b}
execute as @s at @s positioned ~ ~3 ~1 align xyz run summon minecraft:falling_block ~0.5 ~ ~0.5 {BlockState:{Name:"polished_blackstone_brick_slab"},Tags:["TinkerersCraft","TC_guideBlock"],NoGravity:1b}
execute as @s at @s positioned ~1 ~3 ~1 align xyz run summon minecraft:falling_block ~0.5 ~ ~0.5 {BlockState:{Name:"polished_blackstone_brick_slab"},Tags:["TinkerersCraft","TC_guideBlock"],NoGravity:1b}