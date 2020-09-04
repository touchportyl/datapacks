#> -----------------------------------------------
#> Tinkerer's Craft Datapack
#> This code is protected by the GNU GPLv3 License
#> © 2020 Portyl Studios
#> https://portylstudios.com
#> -----------------------------------------------


#> furnace vanilla
# this contains a list of all the vanilla items that are smeltable in a furnace
# updated for version 1.16.2
#
# note:
# cobblestone turns into stone, which turns into smooth stone
# they have been placed on top in reverse order to prevent the cobble from instantly transforming into smooth stone


# special case
data modify entity @s[nbt={Item:{id:"minecraft:stone"}}] Item merge value {id:"minecraft:smooth_stone"}
data modify entity @s[nbt={Item:{id:"minecraft:cobblestone"}}] Item merge value {id:"minecraft:stone"}

# food items
data modify entity @s[nbt={Item:{id:"minecraft:porkchop"}}] Item merge value {id:"minecraft:cooked_porkchop"}
data modify entity @s[nbt={Item:{id:"minecraft:beef"}}] Item merge value {id:"minecraft:cooked_beef"}
data modify entity @s[nbt={Item:{id:"minecraft:chicken"}}] Item merge value {id:"minecraft:cooked_chicken"}
data modify entity @s[nbt={Item:{id:"minecraft:cod"}}] Item merge value {id:"minecraft:cooked_cod"}
data modify entity @s[nbt={Item:{id:"minecraft:salmon"}}] Item merge value {id:"minecraft:cooked_salmon"}
data modify entity @s[nbt={Item:{id:"minecraft:potato"}}] Item merge value {id:"minecraft:baked_potato"}
data modify entity @s[nbt={Item:{id:"minecraft:mutton"}}] Item merge value {id:"minecraft:cooked_mutton"}
data modify entity @s[nbt={Item:{id:"minecraft:rabbit"}}] Item merge value {id:"minecraft:cooked_rabbit"}
data modify entity @s[nbt={Item:{id:"minecraft:kelp"}}] Item merge value {id:"minecraft:dried_kelp"}

# blocks
data modify entity @s[nbt={Item:{id:"minecraft:iron_ore"}}] Item merge value {id:"minecraft:iron_ingot"}
data modify entity @s[nbt={Item:{id:"minecraft:gold_ore"}}] Item merge value {id:"minecraft:gold_ingot"}
data modify entity @s[nbt={Item:{id:"minecraft:nether_gold_ore"}}] Item merge value {id:"minecraft:gold_ingot"}
data modify entity @s[nbt={Item:{id:"minecraft:ancient_debris"}}] Item merge value {id:"minecraft:netherite_scrap"}
data modify entity @s[nbt={Item:{id:"minecraft:sand"}}] Item merge value {id:"minecraft:glass"}
data modify entity @s[nbt={Item:{id:"minecraft:red_sand"}}] Item merge value {id:"minecraft:glass"}
data modify entity @s[nbt={Item:{id:"minecraft:sandstone"}}] Item merge value {id:"minecraft:smooth_sandstone"}
data modify entity @s[nbt={Item:{id:"minecraft:red_sandstone"}}] Item merge value {id:"minecraft:smooth_red_sandstone"}
data modify entity @s[nbt={Item:{id:"minecraft:quartz_block"}}] Item merge value {id:"minecraft:smooth_quartz"}
data modify entity @s[nbt={Item:{id:"minecraft:clay_ball"}}] Item merge value {id:"minecraft:brick"}
data modify entity @s[nbt={Item:{id:"minecraft:netherrack"}}] Item merge value {id:"minecraft:nether_brick"}
data modify entity @s[nbt={Item:{id:"minecraft:nether_bricks"}}] Item merge value {id:"minecraft:cracked_nether_bricks"}
data modify entity @s[nbt={Item:{id:"minecraft:clay"}}] Item merge value {id:"minecraft:terracotta"}
data modify entity @s[nbt={Item:{id:"minecraft:stone_bricks"}}] Item merge value {id:"minecraft:cracked_stone_bricks"}
data modify entity @s[nbt={Item:{id:"minecraft:white_terracotta"}}] Item merge value {id:"minecraft:white_glazed_terracotta"}
data modify entity @s[nbt={Item:{id:"minecraft:orange_terracotta"}}] Item merge value {id:"minecraft:orange_glazed_terracotta"}
data modify entity @s[nbt={Item:{id:"minecraft:magenta_terracotta"}}] Item merge value {id:"minecraft:magenta_glazed_terracotta"}
data modify entity @s[nbt={Item:{id:"minecraft:light_blue_terracotta"}}] Item merge value {id:"minecraft:light_blue_glazed_terracotta"}
data modify entity @s[nbt={Item:{id:"minecraft:yellow_terracotta"}}] Item merge value {id:"minecraft:yellow_glazed_terracotta"}
data modify entity @s[nbt={Item:{id:"minecraft:lime_terracotta"}}] Item merge value {id:"minecraft:lime_glazed_terracotta"}
data modify entity @s[nbt={Item:{id:"minecraft:pink_terracotta"}}] Item merge value {id:"minecraft:pink_glazed_terracotta"}
data modify entity @s[nbt={Item:{id:"minecraft:gray_terracotta"}}] Item merge value {id:"minecraft:gray_glazed_terracotta"}
data modify entity @s[nbt={Item:{id:"minecraft:light_gray_terracotta"}}] Item merge value {id:"minecraft:light_gray_glazed_terracotta"}
data modify entity @s[nbt={Item:{id:"minecraft:cyan_terracotta"}}] Item merge value {id:"minecraft:cyan_glazed_terracotta"}
data modify entity @s[nbt={Item:{id:"minecraft:purple_terracotta"}}] Item merge value {id:"minecraft:purple_glazed_terracotta"}
data modify entity @s[nbt={Item:{id:"minecraft:blue_terracotta"}}] Item merge value {id:"minecraft:blue_glazed_terracotta"}
data modify entity @s[nbt={Item:{id:"minecraft:brown_terracotta"}}] Item merge value {id:"minecraft:brown_glazed_terracotta"}
data modify entity @s[nbt={Item:{id:"minecraft:green_terracotta"}}] Item merge value {id:"minecraft:green_glazed_terracotta"}
data modify entity @s[nbt={Item:{id:"minecraft:red_terracotta"}}] Item merge value {id:"minecraft:red_glazed_terracotta"}
data modify entity @s[nbt={Item:{id:"minecraft:black_terracotta"}}] Item merge value {id:"minecraft:black_glazed_terracotta"}
data modify entity @s[nbt={Item:{id:"minecraft:cactus"}}] Item merge value {id:"minecraft:green_dye"}
data modify entity @s[nbt={Item:{id:"minecraft:oak_log"}}] Item merge value {id:"minecraft:charcoal"}
data modify entity @s[nbt={Item:{id:"minecraft:spruce_log"}}] Item merge value {id:"minecraft:charcoal"}
data modify entity @s[nbt={Item:{id:"minecraft:birch_log"}}] Item merge value {id:"minecraft:charcoal"}
data modify entity @s[nbt={Item:{id:"minecraft:jungle_log"}}] Item merge value {id:"minecraft:charcoal"}
data modify entity @s[nbt={Item:{id:"minecraft:acacia_log"}}] Item merge value {id:"minecraft:charcoal"}
data modify entity @s[nbt={Item:{id:"minecraft:dark_oak_log"}}] Item merge value {id:"minecraft:charcoal"}
data modify entity @s[nbt={Item:{id:"minecraft:stripped_oak_log"}}] Item merge value {id:"minecraft:charcoal"}
data modify entity @s[nbt={Item:{id:"minecraft:stripped_spruce_log"}}] Item merge value {id:"minecraft:charcoal"}
data modify entity @s[nbt={Item:{id:"minecraft:stripped_birch_log"}}] Item merge value {id:"minecraft:charcoal"}
data modify entity @s[nbt={Item:{id:"minecraft:stripped_jungle_log"}}] Item merge value {id:"minecraft:charcoal"}
data modify entity @s[nbt={Item:{id:"minecraft:stripped_acacia_log"}}] Item merge value {id:"minecraft:charcoal"}
data modify entity @s[nbt={Item:{id:"minecraft:stripped_dark_oak_log"}}] Item merge value {id:"minecraft:charcoal"}
data modify entity @s[nbt={Item:{id:"minecraft:oak_wood"}}] Item merge value {id:"minecraft:charcoal"}
data modify entity @s[nbt={Item:{id:"minecraft:spruce_wood"}}] Item merge value {id:"minecraft:charcoal"}
data modify entity @s[nbt={Item:{id:"minecraft:birch_wood"}}] Item merge value {id:"minecraft:charcoal"}
data modify entity @s[nbt={Item:{id:"minecraft:jungle_wood"}}] Item merge value {id:"minecraft:charcoal"}
data modify entity @s[nbt={Item:{id:"minecraft:acacia_wood"}}] Item merge value {id:"minecraft:charcoal"}
data modify entity @s[nbt={Item:{id:"minecraft:dark_oak_wood"}}] Item merge value {id:"minecraft:charcoal"}
data modify entity @s[nbt={Item:{id:"minecraft:stripped_oak_wood"}}] Item merge value {id:"minecraft:charcoal"}
data modify entity @s[nbt={Item:{id:"minecraft:stripped_spruce_wood"}}] Item merge value {id:"minecraft:charcoal"}
data modify entity @s[nbt={Item:{id:"minecraft:stripped_birch_wood"}}] Item merge value {id:"minecraft:charcoal"}
data modify entity @s[nbt={Item:{id:"minecraft:stripped_jungle_wood"}}] Item merge value {id:"minecraft:charcoal"}
data modify entity @s[nbt={Item:{id:"minecraft:stripped_acacia_wood"}}] Item merge value {id:"minecraft:charcoal"}
data modify entity @s[nbt={Item:{id:"minecraft:stripped_dark_oak_wood"}}] Item merge value {id:"minecraft:charcoal"}
data modify entity @s[nbt={Item:{id:"minecraft:chorus_fruit"}}] Item merge value {id:"minecraft:popped_chorus_fruit"}
data modify entity @s[nbt={Item:{id:"minecraft:wet_sponge"}}] Item merge value {id:"minecraft:sponge"}
data modify entity @s[nbt={Item:{id:"minecraft:sea_pickle"}}] Item merge value {id:"minecraft:lime_dye"}

# wasted ores
data modify entity @s[nbt={Item:{id:"minecraft:diamond_ore"}}] Item merge value {id:"minecraft:diamond"}
data modify entity @s[nbt={Item:{id:"minecraft:lapis_ore"}}] Item merge value {id:"minecraft:lapis_lazuli"}
data modify entity @s[nbt={Item:{id:"minecraft:redstone_ore"}}] Item merge value {id:"minecraft:redstone"}
data modify entity @s[nbt={Item:{id:"minecraft:coal_ore"}}] Item merge value {id:"minecraft:coal"}
data modify entity @s[nbt={Item:{id:"minecraft:emerald_ore"}}] Item merge value {id:"minecraft:emerald"}
data modify entity @s[nbt={Item:{id:"minecraft:nether_quartz_ore"}}] Item merge value {id:"minecraft:nether_quartz"}

# iron items
data modify entity @s[nbt={Item:{id:"minecraft:iron_sword"}}] Item merge value {id:"minecraft:iron_nugget"}
data modify entity @s[nbt={Item:{id:"minecraft:iron_pickaxe"}}] Item merge value {id:"minecraft:iron_nugget"}
data modify entity @s[nbt={Item:{id:"minecraft:iron_axe"}}] Item merge value {id:"minecraft:iron_nugget"}
data modify entity @s[nbt={Item:{id:"minecraft:iron_shovel"}}] Item merge value {id:"minecraft:iron_nugget"}
data modify entity @s[nbt={Item:{id:"minecraft:iron_hoe"}}] Item merge value {id:"minecraft:iron_nugget"}
data modify entity @s[nbt={Item:{id:"minecraft:chainmail_helmet"}}] Item merge value {id:"minecraft:iron_nugget"}
data modify entity @s[nbt={Item:{id:"minecraft:chainmail_chestplate"}}] Item merge value {id:"minecraft:iron_nugget"}
data modify entity @s[nbt={Item:{id:"minecraft:chainmail_leggings"}}] Item merge value {id:"minecraft:iron_nugget"}
data modify entity @s[nbt={Item:{id:"minecraft:chainmail_boots"}}] Item merge value {id:"minecraft:iron_nugget"}
data modify entity @s[nbt={Item:{id:"minecraft:iron_helmet"}}] Item merge value {id:"minecraft:iron_nugget"}
data modify entity @s[nbt={Item:{id:"minecraft:iron_chestplate"}}] Item merge value {id:"minecraft:iron_nugget"}
data modify entity @s[nbt={Item:{id:"minecraft:iron_leggings"}}] Item merge value {id:"minecraft:iron_nugget"}
data modify entity @s[nbt={Item:{id:"minecraft:iron_boots"}}] Item merge value {id:"minecraft:iron_nugget"}
data modify entity @s[nbt={Item:{id:"minecraft:iron_horse_armor"}}] Item merge value {id:"minecraft:iron_nugget"}

# gold items
data modify entity @s[nbt={Item:{id:"minecraft:golden_sword"}}] Item merge value {id:"minecraft:gold_nugget"}
data modify entity @s[nbt={Item:{id:"minecraft:golden_pickaxe"}}] Item merge value {id:"minecraft:gold_nugget"}
data modify entity @s[nbt={Item:{id:"minecraft:golden_axe"}}] Item merge value {id:"minecraft:gold_nugget"}
data modify entity @s[nbt={Item:{id:"minecraft:golden_shovel"}}] Item merge value {id:"minecraft:gold_nugget"}
data modify entity @s[nbt={Item:{id:"minecraft:golden_hoe"}}] Item merge value {id:"minecraft:gold_nugget"}
data modify entity @s[nbt={Item:{id:"minecraft:golden_helmet"}}] Item merge value {id:"minecraft:gold_nugget"}
data modify entity @s[nbt={Item:{id:"minecraft:golden_chestplate"}}] Item merge value {id:"minecraft:gold_nugget"}
data modify entity @s[nbt={Item:{id:"minecraft:golden_leggings"}}] Item merge value {id:"minecraft:gold_nugget"}
data modify entity @s[nbt={Item:{id:"minecraft:golden_boots"}}] Item merge value {id:"minecraft:gold_nugget"}
data modify entity @s[nbt={Item:{id:"minecraft:golden_horse_armor"}}] Item merge value {id:"minecraft:gold_nugget"}


#> End of file
#> -----------
