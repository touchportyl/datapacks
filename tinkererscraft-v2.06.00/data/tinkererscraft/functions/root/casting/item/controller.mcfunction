# handles the construction of custom items
# executes as the smeltery

#> steps:
# - base: create the base item
# - smelterytagger: tag the base item
# - tagwriter: execute on all the tags based on priority

#> tags

# generic:
# - TC_gen_item (To track as a newly generated item)
# - TC_gen_casted (Add motion & casted lore)

# material:
# - TC_gen_item_iron
# - TC_gen_item_gold
# - TC_gen_item_irgol
# - TC_gen_item_obdiam

# type:
# - TC_gen_item_cauldroncasted
# - TC_gen_item_anvilcasted

# tool type: (requires TC_gen_item_anvilcasted)
# - TC_gen_item_pickaxe
# - TC_gen_item_sword
# - TC_gen_item_axe
# - TC_gen_item_shovel
# - TC_gen_item_hoe

# quirks:
# - TC_gen_lightweight
# - TC_gen_shiny
# - TC_gen_prospector
# - TC_gen_flaming

# enchants:
# - TC_gen_lunge
# - TC_gen_riptide
# - TC_gen_heated



# create base items
function tinkererscraft:root/casting/item/base

# classifying tags
function tinkererscraft:root/casting/item/smelterytagger

# writing tags to items
execute as @e[tag=TC_gen_item] at @s run function tinkererscraft:root/casting/item/tagwriter