# converts persistent item tags into actual item data

#> notes
# the first line will always be a "set" to clear the previous lore of the item
# tagwriter requires a smeltery to run because it uses a sign parser
# enchants are done by setting a base value to all tools for a material, then any specific changes for tools (like swords) are done through overrides

# data groups
# - append lore
# - append actual enchantments



#> append lore

# general
#data modify entity @s[tag=TC_gen_casted] Item.tag.display.Lore set value '{"text":"Casted by @p","color":"gray","italic":false}'
execute as @e[tag=TC_smeltery,distance=..3,limit=1,sort=nearest] at @s run function tinkererscraft:root/casting/item/parseplayername

# quirks
data modify entity @s[nbt={Item:{tag:{TC_Lightweight:true}}}] Item.tag.display.Lore append value '{"text":" ➥ Lightweight","color":"gold","italic":false}'
data modify entity @s[nbt={Item:{tag:{TC_Shiny:true}}}] Item.tag.display.Lore append value '{"text":" ➥ Shiny","color":"gold","italic":false}'
data modify entity @s[nbt={Item:{tag:{TC_Prospector:true}}}] Item.tag.display.Lore append value '{"text":" ➥ Prospector","color":"gold","italic":false}'
data modify entity @s[nbt={Item:{tag:{TC_Flaming:true}}}] Item.tag.display.Lore append value '{"text":" ➥ Flaming","color":"gold","italic":false}'

# enchants
data modify entity @s[nbt={Item:{tag:{TC_Lunge:true}}}] Item.tag.display.Lore append value '{"text":" ➥ Lunge","color":"light_purple","italic":false}'
data modify entity @s[nbt={Item:{tag:{TC_Riptide:true}}}] Item.tag.display.Lore append value '{"text":" ➥ Riptide","color":"light_purple","italic":false}'
data modify entity @s[nbt={Item:{tag:{TC_Heated:true}}}] Item.tag.display.Lore append value '{"text":" ➥ Heated","color":"light_purple","italic":false}'



#> append actual enchantments

# iron
data modify entity @s[nbt={Item:{tag:{TC_Material:"iron",TC_Type_Tool:true}}}] Item.tag.Enchantments set value [{id:"minecraft:unbreaking",lvl:1s},{id:"minecraft:efficiency",lvl:2s}]

data modify entity @s[nbt={Item:{tag:{TC_Material:"iron",TC_Type:"sword"}}}] Item.tag.Enchantments set value [{id:"minecraft:unbreaking",lvl:1s},{id:"minecraft:sharpness",lvl:1s}]


# gold
data modify entity @s[nbt={Item:{tag:{TC_Material:"gold",TC_Type_Tool:true}}}] Item.tag.Enchantments set value [{id:"minecraft:unbreaking",lvl:3s}]


# irgol
data modify entity @s[nbt={Item:{tag:{TC_Material:"irgol",TC_Type_Tool:true}}}] Item.tag.Enchantments set value [{id:"minecraft:unbreaking",lvl:59s},{id:"minecraft:efficiency",lvl:3s},{id:"minecraft:fortune",lvl:2s},{id:"minecraft:sharpness",lvl:7s}]

data modify entity @s[nbt={Item:{tag:{TC_Material:"irgol",TC_Type:"sword"}}}] Item.tag.Enchantments set value [{id:"minecraft:unbreaking",lvl:3s},{id:"minecraft:looting",lvl:2s},{id:"minecraft:sharpness",lvl:7s}]

data modify entity @s[nbt={Item:{tag:{TC_Material:"irgol",TC_Type:"axe"}}}] Item.tag.Enchantments set value [{id:"minecraft:unbreaking",lvl:59s},{id:"minecraft:efficiency",lvl:3s},{id:"minecraft:fortune",lvl:2s},{id:"minecraft:sharpness",lvl:5s}]


# obdiam
data modify entity @s[nbt={Item:{tag:{TC_Material:"obdiam",TC_Type_Tool:true}}}] Item.tag.Enchantments set value [{id:"minecraft:unbreaking",lvl:1s},{id:"minecraft:efficiency",lvl:2s},{id:"minecraft:fire_aspect",lvl:1s}]

data modify entity @s[nbt={Item:{tag:{TC_Material:"obdiam",TC_Type:"sword"}}}] Item.tag.Enchantments set value [{id:"minecraft:unbreaking",lvl:1s},{id:"minecraft:sharpness",lvl:1s},{id:"minecraft:sweeping",lvl:2s},{id:"minecraft:fire_aspect",lvl:1s}]