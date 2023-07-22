# converts tags into item data


# data groups
# - add persistent tags
# - append lore
# - append actual enchantments


# pfx:smoke
# heat effects for just casted items
# hooks into the heated enchant to provide this effect
scoreboard players set @s[tag=TC_gen_casted] TC_SmeltingTimer 42


#> add persistent tags

# generic
data modify entity @s[tag=TC_gen_casted] Item.tag.TC_Casted set value true

# material
data modify entity @s[tag=TC_gen_iron] Item.tag.TC_Material set value 'iron'
data modify entity @s[tag=TC_gen_gold] Item.tag.TC_Material set value 'gold'
data modify entity @s[tag=TC_gen_irgol] Item.tag.TC_Material set value 'irgol'
data modify entity @s[tag=TC_gen_obdiam] Item.tag.TC_Material set value 'obdiam'

# alloy
data modify entity @s[tag=TC_gen_irgol] Item.tag.TC_Alloy set value true
data modify entity @s[tag=TC_gen_obdiam] Item.tag.TC_Alloy set value true

# tool type
data modify entity @s[tag=TC_gen_pickaxe] Item.tag.TC_Tool set value 'pickaxe'
data modify entity @s[tag=TC_gen_sword] Item.tag.TC_Tool set value 'sword'
data modify entity @s[tag=TC_gen_axe] Item.tag.TC_Tool set value 'axe'
data modify entity @s[tag=TC_gen_shovel] Item.tag.TC_Tool set value 'shovel'
data modify entity @s[tag=TC_gen_hoe] Item.tag.TC_Tool set value 'hoe'

# qualities
tag @s[tag=TC_gen_item,tag=TC_gen_iron] add TC_gen_lightweight
tag @s[tag=TC_gen_item,tag=TC_gen_gold] add TC_gen_shiny
tag @s[tag=TC_gen_item,tag=TC_gen_irgol] add TC_gen_prospector
tag @s[tag=TC_gen_item,tag=TC_gen_obdiam] add TC_gen_heated

# quirks
data modify entity @s[tag=TC_gen_lightweight] Item.tag.TC_Lightweight set value true
data modify entity @s[tag=TC_gen_shiny] Item.tag.TC_Shiny set value true
data modify entity @s[tag=TC_gen_prospector] Item.tag.TC_Prospector set value true
data modify entity @s[tag=TC_gen_flaming] Item.tag.TC_Flaming set value true

# enchants
data modify entity @s[tag=TC_gen_lunge] Item.tag.TC_Lunge set value true
data modify entity @s[tag=TC_gen_riptide] Item.tag.TC_Riptide set value true
data modify entity @s[tag=TC_gen_heated] Item.tag.TC_Heated set value true

data modify entity @s[tag=TC_gen_heated] Item.tag.TC_Flaming set value true



#> append lore

# general
#data modify entity @s[tag=TC_gen_casted] Item.tag.display.Lore append value '{"text":"Casted by @p","color":"gray","italic":false}'
execute as @e[tag=TC_smeltery,distance=..3,limit=1,sort=nearest] at @s run function tinkererscraft:root/casting/item/parseplayername

# quirks
data modify entity @s[tag=TC_gen_lightweight] Item.tag.display.Lore append value '{"text":" ➥ Lightweight","color":"gray","italic":false}'
data modify entity @s[tag=TC_gen_shiny] Item.tag.display.Lore append value '{"text":" ➥ Shiny","color":"gray","italic":false}'
data modify entity @s[tag=TC_gen_prospector] Item.tag.display.Lore append value '{"text":" ➥ Prospector","color":"gray","italic":false}'

# enchants
data modify entity @s[tag=TC_gen_lunge] Item.tag.display.Lore append value '{"text":" ➥ Lunge","color":"gray","italic":false}'
data modify entity @s[tag=TC_gen_riptide] Item.tag.display.Lore append value '{"text":" ➥ Riptide","color":"gray","italic":false}'
data modify entity @s[tag=TC_gen_heated] Item.tag.display.Lore append value '{"text":" ➥ Heated","color":"gray","italic":false}'



#> append actual enchantments

# iron
data modify entity @s[tag=TC_gen_iron,tag=!TC_gen_sword] Item.tag.Enchantments set value [{id:"minecraft:unbreaking",lvl:1s},{id:"minecraft:efficiency",lvl:2s}]
data modify entity @s[tag=TC_gen_iron,tag=TC_gen_sword] Item.tag.Enchantments set value [{id:"minecraft:unbreaking",lvl:1s},{id:"minecraft:sharpness",lvl:1s}]

# gold
data modify entity @s[tag=TC_gen_gold] Item.tag.Enchantments set value [{id:"minecraft:unbreaking",lvl:3s}]

# irgol
data modify entity @s[tag=TC_gen_irgol,tag=!TC_gen_sword,tag=!TC_gen_axe] Item.tag.Enchantments set value [{id:"minecraft:unbreaking",lvl:59s},{id:"minecraft:efficiency",lvl:3s},{id:"minecraft:fortune",lvl:2s},{id:"minecraft:sharpness",lvl:7s}]
data modify entity @s[tag=TC_gen_irgol,tag=TC_gen_sword] Item.tag.Enchantments set value [{id:"minecraft:unbreaking",lvl:3s},{id:"minecraft:looting",lvl:2s},{id:"minecraft:sharpness",lvl:7s}]
data modify entity @s[tag=TC_gen_irgol,tag=TC_gen_axe] Item.tag.Enchantments set value [{id:"minecraft:unbreaking",lvl:59s},{id:"minecraft:efficiency",lvl:3s},{id:"minecraft:fortune",lvl:2s},{id:"minecraft:sharpness",lvl:5s}]

# obdiam
data modify entity @s[tag=TC_gen_obdiam,tag=!TC_gen_sword] Item.tag.Enchantments set value [{id:"minecraft:unbreaking",lvl:1s},{id:"minecraft:efficiency",lvl:2s},{id:"minecraft:fire_aspect",lvl:1s}]
data modify entity @s[tag=TC_gen_obdiam,tag=TC_gen_sword] Item.tag.Enchantments set value [{id:"minecraft:unbreaking",lvl:1s},{id:"minecraft:sharpness",lvl:1s},{id:"minecraft:sweeping",lvl:2s},{id:"minecraft:fire_aspect",lvl:1s}]