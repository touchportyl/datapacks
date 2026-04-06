# displays a guide of the north orientation of the multi-block smeltery structure


# control Layer
execute as @s at @s positioned ~-1 ~1 ~-1 align xyz run summon minecraft:falling_block ~0.5 ~ ~0.5 {BlockState:{Name:"polished_blackstone_bricks"},Tags:["TinkerersCraft","TC_guideBlock"],NoGravity:1b}
execute as @s at @s positioned ~ ~1 ~-1 align xyz run summon minecraft:falling_block ~0.5 ~ ~0.5 {BlockState:{Name:"polished_blackstone_bricks"},Tags:["TinkerersCraft","TC_guideBlock"],NoGravity:1b}
execute as @s at @s positioned ~1 ~1 ~-1 align xyz run summon minecraft:falling_block ~0.5 ~ ~0.5 {BlockState:{Name:"polished_blackstone_bricks"},Tags:["TinkerersCraft","TC_guideBlock"],NoGravity:1b}
execute as @s at @s positioned ~-1 ~1 ~ align xyz run summon minecraft:falling_block ~0.5 ~ ~0.5 {BlockState:{Name:"polished_blackstone_bricks"},Tags:["TinkerersCraft","TC_guideBlock"],NoGravity:1b}
execute as @s at @s positioned ~1 ~1 ~ align xyz run summon minecraft:falling_block ~0.5 ~ ~0.5 {BlockState:{Name:"polished_blackstone_bricks"},Tags:["TinkerersCraft","TC_guideBlock"],NoGravity:1b}
execute as @s at @s positioned ~-1 ~1 ~1 align xyz run summon minecraft:falling_block ~0.5 ~ ~0.5 {BlockState:{Name:"polished_blackstone_bricks"},Tags:["TinkerersCraft","TC_guideBlock"],NoGravity:1b}
execute as @s at @s positioned ~ ~1 ~1 align xyz run summon minecraft:falling_block ~0.5 ~ ~0.5 {BlockState:{Name:"chiseled_polished_blackstone"},Tags:["TinkerersCraft","TC_guideBlock"],NoGravity:1b}
execute as @s at @s positioned ~1 ~1 ~1 align xyz run summon minecraft:falling_block ~0.5 ~ ~0.5 {BlockState:{Name:"polished_blackstone_bricks"},Tags:["TinkerersCraft","TC_guideBlock"],NoGravity:1b}
execute as @s at @s positioned ~ ~1 ~2 align xyz run summon minecraft:falling_block ~0.5 ~ ~0.5 {BlockState:{Name:"lever",Properties:{facing:south}},Tags:["TinkerersCraft","TC_guideBlock"],NoGravity:1b}

# display Layer
execute as @s at @s positioned ~-1 ~2 ~-1 align xyz run summon minecraft:falling_block ~0.5 ~ ~0.5 {BlockState:{Name:"polished_blackstone_bricks"},Tags:["TinkerersCraft","TC_guideBlock"],NoGravity:1b}
execute as @s at @s positioned ~ ~2 ~-1 align xyz run summon minecraft:falling_block ~0.5 ~ ~0.5 {BlockState:{Name:"polished_blackstone_bricks"},Tags:["TinkerersCraft","TC_guideBlock"],NoGravity:1b}
execute as @s at @s positioned ~1 ~2 ~-1 align xyz run summon minecraft:falling_block ~0.5 ~ ~0.5 {BlockState:{Name:"polished_blackstone_bricks"},Tags:["TinkerersCraft","TC_guideBlock"],NoGravity:1b}
execute as @s at @s positioned ~-1 ~2 ~ align xyz run summon minecraft:falling_block ~0.5 ~ ~0.5 {BlockState:{Name:"polished_blackstone_bricks"},Tags:["TinkerersCraft","TC_guideBlock"],NoGravity:1b}
execute as @s at @s positioned ~1 ~2 ~ align xyz run summon minecraft:falling_block ~0.5 ~ ~0.5 {BlockState:{Name:"polished_blackstone_bricks"},Tags:["TinkerersCraft","TC_guideBlock"],NoGravity:1b}
execute as @s at @s positioned ~-1 ~2 ~1 align xyz run summon minecraft:falling_block ~0.5 ~ ~0.5 {BlockState:{Name:"polished_blackstone_bricks"},Tags:["TinkerersCraft","TC_guideBlock"],NoGravity:1b}
execute as @s at @s positioned ~ ~2 ~1 align xyz run summon minecraft:area_effect_cloud ~0.5 ~-0.3 ~0.5 {CustomName:'{"text":"Guide"}',CustomNameVisible:1b,Tags:["TinkerersCraft","TC_guideBlock"],Rotation:[0f,0f],Duration:10}
execute as @s at @s positioned ~1 ~2 ~1 align xyz run summon minecraft:falling_block ~0.5 ~ ~0.5 {BlockState:{Name:"polished_blackstone_bricks"},Tags:["TinkerersCraft","TC_guideBlock"],NoGravity:1b}