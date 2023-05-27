#> -----------------------------------------------
#> Tinkerer's_craft Datapack
#> This code is protected by the GNU GPLv3 License
#> © 2020 Portyl Studios
#> https://portylstudios.com
#> -----------------------------------------------


#> parser (references: ../modules/smelting/detection)
# this code tags items for processing
#
# the list is sorted by type
# - copper
# - iron
# - gold
# - obdisian
# - reactants
# - developer items
# - upgrade items
# - others

# copper
execute as @s[nbt={Item:{id:"minecraft:copper_ore"}}] run tag @s add TC_copperore
execute if score $tc.smelting.copper.deepslate TP_config matches 1 as @s[nbt={Item:{id:"minecraft:deepslate_copper_ore"}}] run tag @s add TC_deepslatecopperore
execute as @s[nbt={Item:{id:"minecraft:raw_copper"}}] run tag @s add TC_copper
execute as @s[nbt={Item:{id:"minecraft:copper_ingot"}}] run tag @s add TC_copper

execute as @s[nbt={Item:{id:"minecraft:raw_copper_block"}}] run tag @s add TC_copperblock
execute as @s[nbt={Item:{id:"minecraft:copper_block"}}] run tag @s add TC_copperblock
execute as @s[nbt={Item:{id:"minecraft:exposed_copper"}}] run tag @s add TC_exposedcopperblock
execute as @s[nbt={Item:{id:"minecraft:weathered_copper"}}] run tag @s add TC_weatheredcopperblock
execute as @s[nbt={Item:{id:"minecraft:oxidized_copper"}}] run tag @s add TC_oxidizedcopperblock
execute as @s[nbt={Item:{id:"minecraft:waxed_copper_block"}}] run tag @s add TC_copperblock
execute as @s[nbt={Item:{id:"minecraft:waxed_exposed_copper"}}] run tag @s add TC_exposedcopperblock
execute as @s[nbt={Item:{id:"minecraft:waxed_weathered_copper"}}] run tag @s add TC_weatheredcopperblock

execute as @s[nbt={Item:{id:"minecraft:cut_copper"}}] run tag @s add TC_cutcopper
execute as @s[nbt={Item:{id:"minecraft:exposed_cut_copper"}}] run tag @s add TC_exposedcutcopper
execute as @s[nbt={Item:{id:"minecraft:weathered_cut_copper"}}] run tag @s add TC_weatheredcutcopper
execute as @s[nbt={Item:{id:"minecraft:oxidized_cut_copper"}}] run tag @s add TC_oxidizedcutcopper
execute as @s[nbt={Item:{id:"minecraft:waxed_cut_copper"}}] run tag @s add TC_cutcopper
execute as @s[nbt={Item:{id:"minecraft:waxed_exposed_cut_copper"}}] run tag @s add TC_exposedcutcopper
execute as @s[nbt={Item:{id:"minecraft:waxed_weathered_cut_copper"}}] run tag @s add TC_weatheredcutcopper

execute as @s[nbt={Item:{id:"minecraft:cut_copper_stairs"}}] run tag @s add TC_cutcopperstairs
#execute as @s[nbt={Item:{id:"minecraft:exposed_cut_copper_stairs"}}] run tag @s add TC_exposedcutcopperstairs
#execute as @s[nbt={Item:{id:"minecraft:weathered_cut_copper_stairs"}}] run tag @s add TC_weatheredcutcopperstairs
#execute as @s[nbt={Item:{id:"minecraft:oxidized_cut_copper_stairs"}}] run tag @s add TC_oxidizedcutcopperstairs
execute as @s[nbt={Item:{id:"minecraft:waxed_cut_copper_stairs"}}] run tag @s add TC_cutcopperstairs
#execute as @s[nbt={Item:{id:"minecraft:waxed_exposed_cut_copper_stairs"}}] run tag @s add TC_exposedcutcopperstairs
#execute as @s[nbt={Item:{id:"minecraft:waxed_weathered_cut_copper_stairs"}}] run tag @s add TC_weatheredcutcopperstairs

execute as @s[nbt={Item:{id:"minecraft:cut_copper_slab"}}] run tag @s add TC_cutcopperslab
#execute as @s[nbt={Item:{id:"minecraft:exposed_cut_copper_slab"}}] run tag @s add TC_exposedcutcopperslab
#execute as @s[nbt={Item:{id:"minecraft:weathered_cut_copper_slab"}}] run tag @s add TC_weatheredcutcopperslab
#execute as @s[nbt={Item:{id:"minecraft:oxidized_cut_copper_slab"}}] run tag @s add TC_oxidizedcutcopperslab
execute as @s[nbt={Item:{id:"minecraft:waxed_cut_copper_slab"}}] run tag @s add TC_cutcopperslab
#execute as @s[nbt={Item:{id:"minecraft:waxed_exposed_cut_copper_slab"}}] run tag @s add TC_exposedcutcopperslab
#execute as @s[nbt={Item:{id:"minecraft:waxed_weathered_cut_copper_slab"}}] run tag @s add TC_weatheredcutcopperslab

# iron
execute as @s[nbt={Item:{id:"minecraft:iron_ore"}}] run tag @s add TC_ironore
execute as @s[nbt={Item:{id:"minecraft:deepslate_iron_ore"}}] run tag @s add TC_deepslateironore
execute as @s[nbt={Item:{id:"minecraft:raw_iron"}}] run tag @s add TC_iron
execute as @s[nbt={Item:{id:"minecraft:iron_ingot"}}] run tag @s add TC_iron
execute as @s[nbt={Item:{id:"minecraft:raw_iron_block"}}] run tag @s add TC_ironblock
execute as @s[nbt={Item:{id:"minecraft:iron_block"}}] run tag @s add TC_ironblock

# gold
execute as @s[nbt={Item:{id:"minecraft:gold_ore"}}] run tag @s add TC_goldore
execute as @s[nbt={Item:{id:"minecraft:deepslate_gold_ore"}}] run tag @s add TC_deepslategoldore
execute if score $tc.smelting.gold.nether TP_config matches 1 as @s[nbt={Item:{id:"minecraft:nether_gold_ore"}}] run tag @s add TC_nethergoldore
execute as @s[nbt={Item:{id:"minecraft:raw_gold"}}] run tag @s add TC_gold
execute as @s[nbt={Item:{id:"minecraft:gold_ingot"}}] run tag @s add TC_gold
execute as @s[nbt={Item:{id:"minecraft:raw_gold_block"}}] run tag @s add TC_goldblock
execute as @s[nbt={Item:{id:"minecraft:gold_block"}}] run tag @s add TC_goldblock

# obdisian
execute as @s[nbt={Item:{id:"minecraft:obsidian"}}] run tag @s add TC_obsidian

# reactants
execute as @s[nbt={Item:{id:"minecraft:redstone"}}] run tag @s add TC_redstone
execute as @s[nbt={Item:{id:"minecraft:diamond"}}] run tag @s add TC_diamond

# upgrade items
execute as @s[nbt={Item:{id:"minecraft:netherite_block"}}] run tag @s add TC_netheriteblock

# developer items
execute as @s[nbt={Item:{id:"minecraft:command_block"}}] run tag @s add TC_commandblock


#> End of file
#> -----------
