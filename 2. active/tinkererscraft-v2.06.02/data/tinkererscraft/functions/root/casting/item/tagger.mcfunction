# tags custom items based on the smeltery's conditions
# executes as the smeltery
# more metadata is always better, helps with item detection in the future

#> tags
# - generic
# - material
# - material > alloy
# - type
# - type > tool
# - quirks
# - enchants


# pfx:smoke
# heat effects for just casted items
# hooks into the heated enchant to provide this effect
scoreboard players set @s[tag=TC_gen_casted] TC_SmeltingTimer 42


# generic

execute as @e[type=minecraft:item,tag=TC_gen_item] run data modify entity @s Item.tag.TC_Casted set value true


# material

execute as @s[tag=TC_outputiron] at @s positioned ^ ^ ^2 run data modify entity @e[type=minecraft:item,tag=TC_gen_item,distance=..0.2,sort=nearest,limit=1] Item.tag.TC_Material set value 'iron'

execute as @s[tag=TC_outputgold] at @s positioned ^ ^ ^2 run data modify entity @e[type=minecraft:item,tag=TC_gen_item,distance=..0.2,sort=nearest,limit=1] Item.tag.TC_Material set value 'gold'

execute as @s[tag=TC_outputirgol] at @s positioned ^ ^ ^2 run data modify entity @e[type=minecraft:item,tag=TC_gen_item,distance=..0.2,sort=nearest,limit=1] Item.tag.TC_Material set value 'irgol'

execute as @s[tag=TC_outputobdiam] at @s positioned ^ ^ ^2 run data modify entity @e[type=minecraft:item,tag=TC_gen_item,distance=..0.2,sort=nearest,limit=1] Item.tag.TC_Material set value 'obdiam'

# material > alloy
execute as @e[type=minecraft:item,tag=TC_gen_item,nbt={Item:{tag:{TC_Material:"irgol"}}}] run data modify entity @s Item.tag.TC_Material_Alloy set value true

execute as @e[type=minecraft:item,tag=TC_gen_item,nbt={Item:{tag:{TC_Material:"obdiam"}}}] run data modify entity @s Item.tag.TC_Material_Alloy set value true


# type

execute as @s[tag=TC_anvil,tag=TC_pressureplate] at @s positioned ^ ^ ^2 run data modify entity @e[type=minecraft:item,tag=TC_gen_item,distance=..0.2,sort=nearest,limit=1] Item.tag.TC_Type set value 'pressureplate'

execute as @s[tag=TC_anvil,tag=TC_nugget] at @s positioned ^ ^ ^2 run data modify entity @e[type=minecraft:item,tag=TC_gen_item,distance=..0.2,sort=nearest,limit=1] Item.tag.TC_Type set value 'nugget'

execute as @s[tag=TC_anvil,tag=TC_ingot] at @s positioned ^ ^ ^2 run data modify entity @e[type=minecraft:item,tag=TC_gen_item,distance=..0.2,sort=nearest,limit=1] Item.tag.TC_Type set value 'ingot'

execute as @s[tag=TC_cauldron] at @s positioned ^ ^ ^2 run data modify entity @e[type=minecraft:item,tag=TC_gen_item,distance=..0.2,sort=nearest,limit=1] Item.tag.TC_Type set value 'block'

execute as @s[tag=TC_anvil,tag=TC_pickaxe] at @s positioned ^ ^ ^2 run data modify entity @e[type=minecraft:item,tag=TC_gen_item,distance=..0.2,sort=nearest,limit=1] Item.tag.TC_Type set value 'pickaxe'

execute as @s[tag=TC_anvil,tag=TC_sword] at @s positioned ^ ^ ^2 run data modify entity @e[type=minecraft:item,tag=TC_gen_item,distance=..0.2,sort=nearest,limit=1] Item.tag.TC_Type set value 'sword'

execute as @s[tag=TC_anvil,tag=TC_axe] at @s positioned ^ ^ ^2 run data modify entity @e[type=minecraft:item,tag=TC_gen_item,distance=..0.2,sort=nearest,limit=1] Item.tag.TC_Type set value 'axe'

execute as @s[tag=TC_anvil,tag=TC_shovel] at @s positioned ^ ^ ^2 run data modify entity @e[type=minecraft:item,tag=TC_gen_item,distance=..0.2,sort=nearest,limit=1] Item.tag.TC_Type set value 'shovel'

execute as @s[tag=TC_anvil,tag=TC_hoe] at @s positioned ^ ^ ^2 run data modify entity @e[type=minecraft:item,tag=TC_gen_item,distance=..0.2,sort=nearest,limit=1] Item.tag.TC_Type set value 'hoe'


# type > tool

execute as @e[type=minecraft:item,tag=TC_gen_item,nbt={Item:{tag:{TC_Type:"pickaxe"}}}] run data modify entity @s Item.tag.TC_Type_Tool set value true

execute as @e[type=minecraft:item,tag=TC_gen_item,nbt={Item:{tag:{TC_Type:"sword"}}}] run data modify entity @s Item.tag.TC_Type_Tool set value true

execute as @e[type=minecraft:item,tag=TC_gen_item,nbt={Item:{tag:{TC_Type:"axe"}}}] run data modify entity @s Item.tag.TC_Type_Tool set value true

execute as @e[type=minecraft:item,tag=TC_gen_item,nbt={Item:{tag:{TC_Type:"shovel"}}}] run data modify entity @s Item.tag.TC_Type_Tool set value true

execute as @e[type=minecraft:item,tag=TC_gen_item,nbt={Item:{tag:{TC_Type:"hoe"}}}] run data modify entity @s Item.tag.TC_Type_Tool set value true


# quirks

execute as @e[type=minecraft:item,tag=TC_gen_item,nbt={Item:{tag:{TC_Material:"iron",TC_Type_Tool:true}}}] run data modify entity @s Item.tag.TC_Lightweight set value true

execute as @e[type=minecraft:item,tag=TC_gen_item,nbt={Item:{tag:{TC_Material:"gold",TC_Type_Tool:true}}}] run data modify entity @s Item.tag.TC_Shiny set value true

execute as @e[type=minecraft:item,tag=TC_gen_item,nbt={Item:{tag:{TC_Material:"irgol",TC_Type_Tool:true}}}] run data modify entity @s Item.tag.TC_Prospector set value true

execute as @e[type=minecraft:item,tag=TC_gen_item,nbt={Item:{tag:{TC_Material:"obdiam",TC_Type_Tool:true}}}] run data modify entity @s Item.tag.TC_Flaming set value true


# enchants
# might be removed in a later update when enchants are its own separate thing
# and thus might be no longer be given out for free

execute as @e[type=minecraft:item,tag=TC_gen_item,nbt={Item:{tag:{TC_Material:"iron",TC_Type_Tool:true,TC_Type:"sword"}}}] run data modify entity @s Item.tag.TC_Lunge set value true

execute as @e[type=minecraft:item,tag=TC_gen_item,nbt={Item:{tag:{TC_Material:"irgol",TC_Type_Tool:true,TC_Type:"sword"}}}] run data modify entity @s Item.tag.TC_Riptide set value true

execute as @e[type=minecraft:item,tag=TC_gen_item,nbt={Item:{tag:{TC_Material:"obdiam",TC_Type_Tool:true}}}] run data modify entity @s Item.tag.TC_Heated set value true