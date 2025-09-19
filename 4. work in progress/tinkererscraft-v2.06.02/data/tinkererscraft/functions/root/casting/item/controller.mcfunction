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
# - TC_gen_iron
# - TC_gen_gold
# - TC_gen_irgol
# - TC_gen_obdiam

# type:
# - TC_gen_cauldroncasted
# - TC_gen_anvilcasted
# - TC_gen_tool

# tool type: (requires TC_gen_anvilcasted & TC_gen_tool)
# - TC_gen_pickaxe
# - TC_gen_sword
# - TC_gen_axe
# - TC_gen_shovel
# - TC_gen_hoe

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
function tinkererscraft:root/casting/item/tagger

# writing tags to items
execute as @s at @s positioned ^ ^ ^2 as @e[type=minecraft:item,tag=TC_gen_item,distance=..0.2,sort=nearest,limit=1] at @s run function tinkererscraft:root/casting/item/tagwriter


# remove generate item tag
execute as @s at @s positioned ^ ^ ^2 run tag @e[type=minecraft:item,tag=TC_gen_item,distance=..0.2,sort=nearest,limit=1] remove TC_gen_item