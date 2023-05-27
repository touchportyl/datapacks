#> -----------------------------------------------
#> Tinkerer's Craft Datapack
#> This code is protected by the GNU GPLv3 License
#> © 2020 Portyl Studios
#> https://portylstudios.com
#> -----------------------------------------------


#> custom_items (references: ../modules/casting/drain/..)
# this contains a list of all the items that can be casted
# sorted by:
# - blocks
# - pressure plates
# - nuggets
# - ingots
# - tools
#
# effects:
# copper (weathering)
# - unbreaking 0/1/1
# - efficiency 2/2/0 / sharpness 1/2/1 / -
#
# iron (lightweight)
# - unbreaking 1
# - efficiency 2 / sharpness 1 / -
#
# gold (shiny)
# - unbreaking 3
# - shiny pfx
#
# irgol (prospector)
# - unbreaking 59
# - efficiency 3 & fortune 2 / sharpness 7 & looting 2 / -
#
# obdiam (heated)
# - unbreaking 1
# - efficiency 2 / sharpness 1 & sweeping 2 / -
# - fire_aspect 1
# - flame pfx


#> blocks

# copper block
execute as @s[tag=TC_outputcopper,tag=TC_cauldron,scores={TC_OutputTimer=90..}] at @s run summon minecraft:item ^ ^ ^2 {Motion:[0.0,0.15,0.0],Item:{id:"minecraft:copper_block",Count:1,tag:{TC_Casted:1b,display:{Lore:['{"text":" ➥ Casted","color":"dark_gray","italic":"false"}']}}},Tags:["TinkerersCraft","TC_justcasted"],PickupDelay:70}

# iron block
execute as @s[tag=TC_outputiron,tag=TC_cauldron,scores={TC_OutputTimer=90..}] at @s run summon minecraft:item ^ ^ ^2 {Motion:[0.0,0.15,0.0],Item:{id:"minecraft:iron_block",Count:1,tag:{TC_Casted:1b,display:{Lore:['{"text":" ➥ Casted","color":"dark_gray","italic":"false"}']}}},Tags:["TinkerersCraft","TC_justcasted"],PickupDelay:70}

# gold block
execute as @s[tag=TC_outputgold,tag=TC_cauldron,scores={TC_OutputTimer=90..}] at @s run summon minecraft:item ^ ^ ^2 {Motion:[0.0,0.15,0.0],Item:{id:"minecraft:gold_block",Count:1,tag:{TC_Casted:1b,display:{Lore:['{"text":" ➥ Casted","color":"dark_gray","italic":"false"}']}}},Tags:["TinkerersCraft","TC_justcasted"],PickupDelay:70}

# obsidian block
execute as @s[tag=TC_outputobsidian,tag=TC_cauldron,scores={TC_OutputTimer=50..}] at @s run summon minecraft:item ^ ^ ^2 {Motion:[0.0,0.15,0.0],Item:{id:"minecraft:obsidian",Count:1,tag:{TC_Casted:1b,display:{Lore:['{"text":" ➥ Casted","color":"dark_gray","italic":"false"}']}}},Tags:["TinkerersCraft"],PickupDelay:20}


#> pressure plates

# iron pressure plate
execute as @s[tag=TC_outputiron,tag=TC_anvil,tag=TC_pressureplate,scores={TC_OutputTimer=20..}] at @s run summon minecraft:item ^ ^ ^2 {Motion:[0.0,0.15,0.0],Item:{id:"minecraft:heavy_weighted_pressure_plate",Count:1,tag:{TC_Casted:1b,display:{Lore:['{"text":" ➥ Casted","color":"dark_gray","italic":"false"}']}}},Tags:["TinkerersCraft","TC_justcasted"],PickupDelay:20}

# gold pressure plate
execute as @s[tag=TC_outputgold,tag=TC_anvil,tag=TC_pressureplate,scores={TC_OutputTimer=20..}] at @s run summon minecraft:item ^ ^ ^2 {Motion:[0.0,0.15,0.0],Item:{id:"minecraft:light_weighted_pressure_plate",Count:1,tag:{TC_Casted:1b,display:{Lore:['{"text":" ➥ Casted","color":"dark_gray","italic":"false"}']}}},Tags:["TinkerersCraft","TC_justcasted"],PickupDelay:20}


#> nuggets

# iron nugget
execute as @s[tag=TC_outputiron,tag=TC_anvil,tag=TC_nugget,scores={TC_OutputTimer=10..}] at @s positioned ^ ^ ^2 run data modify entity @e[type=minecraft:item_frame,distance=..0.2,nbt={Item:{id:"minecraft:clay_ball",Count:1b}},limit=1,sort=nearest] Item set value {id:"minecraft:air"}
execute as @s[tag=TC_outputiron,tag=TC_anvil,tag=TC_nugget,scores={TC_OutputTimer=10..}] at @s run summon minecraft:item ^ ^ ^2 {Motion:[0.0,0.15,0.0],Item:{id:"minecraft:iron_nugget",Count:8,tag:{TC_Casted:1b,display:{Lore:['{"text":" ➥ Casted","color":"dark_gray","italic":"false"}']}}},Tags:["TinkerersCraft","TC_justcasted"],PickupDelay:10}

# gold nugget
execute as @s[tag=TC_outputgold,tag=TC_anvil,tag=TC_nugget,scores={TC_OutputTimer=10..}] at @s positioned ^ ^ ^2 run data modify entity @e[type=minecraft:item_frame,distance=..0.2,nbt={Item:{id:"minecraft:clay_ball",Count:1b}},limit=1,sort=nearest] Item set value {id:"minecraft:air"}
execute as @s[tag=TC_outputgold,tag=TC_anvil,tag=TC_nugget,scores={TC_OutputTimer=10..}] at @s run summon minecraft:item ^ ^ ^2 {Motion:[0.0,0.15,0.0],Item:{id:"minecraft:gold_nugget",Count:8,tag:{TC_Casted:1b,display:{Lore:['{"text":" ➥ Casted","color":"dark_gray","italic":"false"}']}}},Tags:["TinkerersCraft","TC_justcasted"],PickupDelay:10}


#> ingots

# copper ingot
execute as @s[tag=TC_outputcopper,tag=TC_anvil,tag=TC_ingot,scores={TC_OutputTimer=10..}] at @s positioned ^ ^ ^2 run data modify entity @e[type=minecraft:item_frame,distance=..0.2,nbt={Item:{id:"minecraft:brick",Count:1b}},limit=1,sort=nearest] Item set value {id:"minecraft:air"}
execute as @s[tag=TC_outputcopper,tag=TC_anvil,tag=TC_ingot,scores={TC_OutputTimer=10..}] at @s run summon minecraft:item ^ ^ ^2 {Motion:[0.0,0.15,0.0],Item:{id:"minecraft:copper_ingot",Count:1,tag:{TC_Casted:1b,display:{Lore:['{"text":" ➥ Casted","color":"dark_gray","italic":"false"}']}}},Tags:["TinkerersCraft","TC_justcasted"],PickupDelay:20}

# iron ingot
execute as @s[tag=TC_outputiron,tag=TC_anvil,tag=TC_ingot,scores={TC_OutputTimer=10..}] at @s positioned ^ ^ ^2 run data modify entity @e[type=minecraft:item_frame,distance=..0.2,nbt={Item:{id:"minecraft:brick",Count:1b}},limit=1,sort=nearest] Item set value {id:"minecraft:air"}
execute as @s[tag=TC_outputiron,tag=TC_anvil,tag=TC_ingot,scores={TC_OutputTimer=10..}] at @s run summon minecraft:item ^ ^ ^2 {Motion:[0.0,0.15,0.0],Item:{id:"minecraft:iron_ingot",Count:1,tag:{TC_Casted:1b,display:{Lore:['{"text":" ➥ Casted","color":"dark_gray","italic":"false"}']}}},Tags:["TinkerersCraft","TC_justcasted"],PickupDelay:20}

# gold ingot
execute as @s[tag=TC_outputgold,tag=TC_anvil,tag=TC_ingot,scores={TC_OutputTimer=10..}] at @s positioned ^ ^ ^2 run data modify entity @e[type=minecraft:item_frame,distance=..0.2,nbt={Item:{id:"minecraft:brick",Count:1b}},limit=1,sort=nearest] Item set value {id:"minecraft:air"}
execute as @s[tag=TC_outputgold,tag=TC_anvil,tag=TC_ingot,scores={TC_OutputTimer=10..}] at @s run summon minecraft:item ^ ^ ^2 {Motion:[0.0,0.15,0.0],Item:{id:"minecraft:gold_ingot",Count:1,tag:{TC_Casted:1b,display:{Lore:['{"text":" ➥ Casted","color":"dark_gray","italic":"false"}']}}},Tags:["TinkerersCraft","TC_justcasted"],PickupDelay:20}


#> -- tools --

#> copper

# copper pickaxe
execute as @s[tag=TC_outputcopper,tag=TC_anvil,tag=TC_pickaxe,scores={TC_OutputTimer=60..}] at @s positioned ^ ^ ^2 run data modify entity @e[type=minecraft:item_frame,distance=..0.2,nbt={Item:{id:"minecraft:wooden_pickaxe",Count:1b}},limit=1,sort=nearest] Item set value {id:"minecraft:air"}
execute as @s[tag=TC_outputcopper,tag=TC_anvil,tag=TC_pickaxe,scores={TC_OutputTimer=60..}] at @s run summon minecraft:item ^ ^ ^2 {Motion:[0.0,0.15,0.0],Item:{id:"minecraft:wooden_pickaxe",Count:1,tag:{TC_Casted:1b,TC_Weathering:1b,TC_WeatheredState:0s,display:{Name:'{"text":"Copper Pickaxe","color":"gold","italic":"false"}',Lore:['','{"text":" ➥ Casted","color":"dark_gray","italic":"false"}','{"text":" ➥ Weathering","color":"dark_gray","italic":"false"}']},Enchantments:[{id:"minecraft:sharpness",lvl:1s},{id:"minecraft:efficiency",lvl:2s}],HideFlags:1,RepairCost:2147483648}},Tags:["TinkerersCraft","TC_justcasted"],PickupDelay:50}

# copper sword
execute as @s[tag=TC_outputcopper,tag=TC_anvil,tag=TC_sword,scores={TC_OutputTimer=60..}] at @s positioned ^ ^ ^2 run data modify entity @e[type=minecraft:item_frame,distance=..0.2,nbt={Item:{id:"minecraft:wooden_sword",Count:1b}},limit=1,sort=nearest] Item set value {id:"minecraft:air"}
execute as @s[tag=TC_outputcopper,tag=TC_anvil,tag=TC_sword,scores={TC_OutputTimer=60..}] at @s run summon minecraft:item ^ ^ ^2 {Motion:[0.0,0.15,0.0],Item:{id:"minecraft:wooden_sword",Count:1,tag:{TC_Casted:1b,TC_Weathering:1b,TC_WeatheredState:0s,display:{Name:'{"text":"Copper Sword","color":"gold","italic":"false"}',Lore:['','{"text":" ➥ Casted","color":"dark_gray","italic":"false"}','{"text":" ➥ Weathering","color":"dark_gray","italic":"false"}','{"text":" ➥ Lunge","color":"dark_gray","italic":"false"}']},Enchantments:[{id:"minecraft:sharpness",lvl:1s}],HideFlags:1,RepairCost:2147483648}},Tags:["TinkerersCraft","TC_justcasted"],PickupDelay:50}

# copper axe
execute as @s[tag=TC_outputcopper,tag=TC_anvil,tag=TC_axe,scores={TC_OutputTimer=60..}] at @s positioned ^ ^ ^2 run data modify entity @e[type=minecraft:item_frame,distance=..0.2,nbt={Item:{id:"minecraft:wooden_axe",Count:1b}},limit=1,sort=nearest] Item set value {id:"minecraft:air"}
execute as @s[tag=TC_outputcopper,tag=TC_anvil,tag=TC_axe,scores={TC_OutputTimer=60..}] at @s run summon minecraft:item ^ ^ ^2 {Motion:[0.0,0.15,0.0],Item:{id:"minecraft:wooden_axe",Count:1,tag:{TC_Casted:1b,TC_Weathering:1b,TC_WeatheredState:0s,display:{Name:'{"text":"Copper Axe","color":"gold","italic":"false"}',Lore:['','{"text":" ➥ Casted","color":"dark_gray","italic":"false"}','{"text":" ➥ Weathering","color":"dark_gray","italic":"false"}']},Enchantments:[{id:"minecraft:sharpness",lvl:1s},{id:"minecraft:efficiency",lvl:2s}],HideFlags:1,RepairCost:2147483648}},Tags:["TinkerersCraft","TC_justcasted"],PickupDelay:50}

# copper shovel
execute as @s[tag=TC_outputcopper,tag=TC_anvil,tag=TC_shovel,scores={TC_OutputTimer=60..}] at @s positioned ^ ^ ^2 run data modify entity @e[type=minecraft:item_frame,distance=..0.2,nbt={Item:{id:"minecraft:wooden_shovel",Count:1b}},limit=1,sort=nearest] Item set value {id:"minecraft:air"}
execute as @s[tag=TC_outputcopper,tag=TC_anvil,tag=TC_shovel,scores={TC_OutputTimer=60..}] at @s run summon minecraft:item ^ ^ ^2 {Motion:[0.0,0.15,0.0],Item:{id:"minecraft:wooden_shovel",Count:1,tag:{TC_Casted:1b,TC_Weathering:1b,TC_WeatheredState:0s,display:{Name:'{"text":"Copper Shovel","color":"gold","italic":"false"}',Lore:['','{"text":" ➥ Casted","color":"dark_gray","italic":"false"}','{"text":" ➥ Weathering","color":"dark_gray","italic":"false"}']},Enchantments:[{id:"minecraft:sharpness",lvl:1s},{id:"minecraft:efficiency",lvl:2s}],HideFlags:1,RepairCost:2147483648}},Tags:["TinkerersCraft","TC_justcasted"],PickupDelay:50}

# copper hoe
execute as @s[tag=TC_outputcopper,tag=TC_anvil,tag=TC_hoe,scores={TC_OutputTimer=60..}] at @s positioned ^ ^ ^2 run data modify entity @e[type=minecraft:item_frame,distance=..0.2,nbt={Item:{id:"minecraft:wooden_hoe",Count:1b}},limit=1,sort=nearest] Item set value {id:"minecraft:air"}
execute as @s[tag=TC_outputcopper,tag=TC_anvil,tag=TC_hoe,scores={TC_OutputTimer=60..}] at @s run summon minecraft:item ^ ^ ^2 {Motion:[0.0,0.15,0.0],Item:{id:"minecraft:wooden_hoe",Count:1,tag:{TC_Casted:1b,TC_Weathering:1b,TC_WeatheredState:0s,display:{Name:'{"text":"Copper Hoe","color":"gold","italic":"false"}',Lore:['{"text":" ➥ Casted","color":"dark_gray","italic":"false"}','{"text":" ➥ Weathering","color":"dark_gray","italic":"false"}']},Enchantments:[{id:"minecraft:sharpness",lvl:1s}],HideFlags:1,RepairCost:2147483648}},Tags:["TinkerersCraft","TC_justcasted"],PickupDelay:50}


#> iron

# iron pickaxe
execute as @s[tag=TC_outputiron,tag=TC_anvil,tag=TC_pickaxe,scores={TC_OutputTimer=60..}] at @s positioned ^ ^ ^2 run data modify entity @e[type=minecraft:item_frame,distance=..0.2,nbt={Item:{id:"minecraft:wooden_pickaxe",Count:1b}},limit=1,sort=nearest] Item set value {id:"minecraft:air"}
execute as @s[tag=TC_outputiron,tag=TC_anvil,tag=TC_pickaxe,scores={TC_OutputTimer=60..}] at @s run summon minecraft:item ^ ^ ^2 {Motion:[0.0,0.15,0.0],Item:{id:"minecraft:iron_pickaxe",Count:1,tag:{TC_Casted:1b,display:{Name:'{"text":"Iron Pickaxe","color":"white","italic":"false"}',Lore:['','{"text":" ➥ Casted","color":"dark_gray","italic":"false"}','{"text":" ➥ Lightweight","color":"dark_gray","italic":"false"}']},Enchantments:[{id:"minecraft:unbreaking",lvl:1s},{id:"minecraft:efficiency",lvl:2s}],HideFlags:1,RepairCost:2147483648}},Tags:["TinkerersCraft","TC_justcasted"],PickupDelay:50}

# iron sword
execute as @s[tag=TC_outputiron,tag=TC_anvil,tag=TC_sword,scores={TC_OutputTimer=60..}] at @s positioned ^ ^ ^2 run data modify entity @e[type=minecraft:item_frame,distance=..0.2,nbt={Item:{id:"minecraft:wooden_sword",Count:1b}},limit=1,sort=nearest] Item set value {id:"minecraft:air"}
execute as @s[tag=TC_outputiron,tag=TC_anvil,tag=TC_sword,scores={TC_OutputTimer=60..}] at @s run summon minecraft:item ^ ^ ^2 {Motion:[0.0,0.15,0.0],Item:{id:"minecraft:iron_sword",Count:1,tag:{TC_Casted:1b,TC_Lunge:1b,display:{Name:'{"text":"Iron Sword","color":"white","italic":"false"}',Lore:['','{"text":" ➥ Casted","color":"dark_gray","italic":"false"}','{"text":" ➥ Lightweight","color":"dark_gray","italic":"false"}','{"text":" ➥ Lunge","color":"dark_gray","italic":"false"}']},Enchantments:[{id:"minecraft:unbreaking",lvl:1s},{id:"minecraft:sharpness",lvl:1s}],HideFlags:1,RepairCost:2147483648}},Tags:["TinkerersCraft","TC_justcasted"],PickupDelay:50}

# iron axe
execute as @s[tag=TC_outputiron,tag=TC_anvil,tag=TC_axe,scores={TC_OutputTimer=60..}] at @s positioned ^ ^ ^2 run data modify entity @e[type=minecraft:item_frame,distance=..0.2,nbt={Item:{id:"minecraft:wooden_axe",Count:1b}},limit=1,sort=nearest] Item set value {id:"minecraft:air"}
execute as @s[tag=TC_outputiron,tag=TC_anvil,tag=TC_axe,scores={TC_OutputTimer=60..}] at @s run summon minecraft:item ^ ^ ^2 {Motion:[0.0,0.15,0.0],Item:{id:"minecraft:iron_axe",Count:1,tag:{TC_Casted:1b,display:{Name:'{"text":"Iron Axe","color":"white","italic":"false"}',Lore:['','{"text":" ➥ Casted","color":"dark_gray","italic":"false"}','{"text":" ➥ Lightweight","color":"dark_gray","italic":"false"}']},Enchantments:[{id:"minecraft:unbreaking",lvl:1s},{id:"minecraft:efficiency",lvl:2s}],HideFlags:1,RepairCost:2147483648}},Tags:["TinkerersCraft","TC_justcasted"],PickupDelay:50}

# iron shovel
execute as @s[tag=TC_outputiron,tag=TC_anvil,tag=TC_shovel,scores={TC_OutputTimer=60..}] at @s positioned ^ ^ ^2 run data modify entity @e[type=minecraft:item_frame,distance=..0.2,nbt={Item:{id:"minecraft:wooden_shovel",Count:1b}},limit=1,sort=nearest] Item set value {id:"minecraft:air"}
execute as @s[tag=TC_outputiron,tag=TC_anvil,tag=TC_shovel,scores={TC_OutputTimer=60..}] at @s run summon minecraft:item ^ ^ ^2 {Motion:[0.0,0.15,0.0],Item:{id:"minecraft:iron_shovel",Count:1,tag:{TC_Casted:1b,display:{Name:'{"text":"Iron Shovel","color":"white","italic":"false"}',Lore:['','{"text":" ➥ Casted","color":"dark_gray","italic":"false"}','{"text":" ➥ Lightweight","color":"dark_gray","italic":"false"}']},Enchantments:[{id:"minecraft:unbreaking",lvl:1s},{id:"minecraft:efficiency",lvl:2s}],HideFlags:1,RepairCost:2147483648}},Tags:["TinkerersCraft","TC_justcasted"],PickupDelay:50}

# iron hoe
execute as @s[tag=TC_outputiron,tag=TC_anvil,tag=TC_hoe,scores={TC_OutputTimer=60..}] at @s positioned ^ ^ ^2 run data modify entity @e[type=minecraft:item_frame,distance=..0.2,nbt={Item:{id:"minecraft:wooden_hoe",Count:1b}},limit=1,sort=nearest] Item set value {id:"minecraft:air"}
execute as @s[tag=TC_outputiron,tag=TC_anvil,tag=TC_hoe,scores={TC_OutputTimer=60..}] at @s run summon minecraft:item ^ ^ ^2 {Motion:[0.0,0.15,0.0],Item:{id:"minecraft:iron_hoe",Count:1,tag:{TC_Casted:1b,display:{Name:'{"text":"Iron Hoe","color":"white","italic":"false"}',Lore:['{"text":" ➥ Casted","color":"dark_gray","italic":"false"}','{"text":" ➥ Lightweight","color":"dark_gray","italic":"false"}']},Enchantments:[{id:"minecraft:unbreaking",lvl:1s}],HideFlags:1,RepairCost:2147483648}},Tags:["TinkerersCraft","TC_justcasted"],PickupDelay:50}


#> gold

# gold pickaxe
execute as @s[tag=TC_outputgold,tag=TC_anvil,tag=TC_pickaxe,scores={TC_OutputTimer=60..}] at @s positioned ^ ^ ^2 run data modify entity @e[type=minecraft:item_frame,distance=..0.2,nbt={Item:{id:"minecraft:wooden_pickaxe",Count:1b}},limit=1,sort=nearest] Item set value {id:"minecraft:air"}
execute as @s[tag=TC_outputgold,tag=TC_anvil,tag=TC_pickaxe,scores={TC_OutputTimer=60..}] at @s run summon minecraft:item ^ ^ ^2 {Motion:[0.0,0.15,0.0],Item:{id:"minecraft:golden_pickaxe",Count:1,tag:{TC_Casted:1b,TC_Shiny:1b,display:{Name:'{"text":"Golden Pickaxe","color":"white","italic":"false"}',Lore:['','{"text":" ➥ Casted","color":"dark_gray","italic":"false"}','{"text":" ➥ Shiny","color":"dark_gray","italic":"false"}']},Enchantments:[{id:"minecraft:unbreaking",lvl:3s}],HideFlags:1,RepairCost:2147483648}},Tags:["TC_justcasted","TC_generateunique"],PickupDelay:50}

# gold sword
execute as @s[tag=TC_outputgold,tag=TC_anvil,tag=TC_sword,scores={TC_OutputTimer=60..}] at @s positioned ^ ^ ^2 run data modify entity @e[type=minecraft:item_frame,distance=..0.2,nbt={Item:{id:"minecraft:wooden_sword",Count:1b}},limit=1,sort=nearest] Item set value {id:"minecraft:air"}
execute as @s[tag=TC_outputgold,tag=TC_anvil,tag=TC_sword,scores={TC_OutputTimer=60..}] at @s run summon minecraft:item ^ ^ ^2 {Motion:[0.0,0.15,0.0],Item:{id:"minecraft:golden_sword",Count:1,tag:{TC_Casted:1b,TC_Shiny:1b,display:{Name:'{"text":"Golden Sword","color":"white","italic":"false"}',Lore:['','{"text":" ➥ Casted","color":"dark_gray","italic":"false"}','{"text":" ➥ Shiny","color":"dark_gray","italic":"false"}']},Enchantments:[{id:"minecraft:unbreaking",lvl:3s}],HideFlags:1,RepairCost:2147483648}},Tags:["TC_justcasted","TC_generateunique"],PickupDelay:50}

# gold axe
execute as @s[tag=TC_outputgold,tag=TC_anvil,tag=TC_axe,scores={TC_OutputTimer=60..}] at @s positioned ^ ^ ^2 run data modify entity @e[type=minecraft:item_frame,distance=..0.2,nbt={Item:{id:"minecraft:wooden_axe",Count:1b}},limit=1,sort=nearest] Item set value {id:"minecraft:air"}
execute as @s[tag=TC_outputgold,tag=TC_anvil,tag=TC_axe,scores={TC_OutputTimer=60..}] at @s run summon minecraft:item ^ ^ ^2 {Motion:[0.0,0.15,0.0],Item:{id:"minecraft:golden_axe",Count:1,tag:{TC_Casted:1b,TC_Shiny:1b,display:{Name:'{"text":"Golden Axe","color":"white","italic":"false"}',Lore:['','{"text":" ➥ Casted","color":"dark_gray","italic":"false"}','{"text":" ➥ Shiny","color":"dark_gray","italic":"false"}']},Enchantments:[{id:"minecraft:unbreaking",lvl:3s}],HideFlags:1,RepairCost:2147483648}},Tags:["TC_justcasted","TC_generateunique"],PickupDelay:50}

# gold shovel
execute as @s[tag=TC_outputgold,tag=TC_anvil,tag=TC_shovel,scores={TC_OutputTimer=60..}] at @s positioned ^ ^ ^2 run data modify entity @e[type=minecraft:item_frame,distance=..0.2,nbt={Item:{id:"minecraft:wooden_shovel",Count:1b}},limit=1,sort=nearest] Item set value {id:"minecraft:air"}
execute as @s[tag=TC_outputgold,tag=TC_anvil,tag=TC_shovel,scores={TC_OutputTimer=60..}] at @s run summon minecraft:item ^ ^ ^2 {Motion:[0.0,0.15,0.0],Item:{id:"minecraft:golden_shovel",Count:1,tag:{TC_Casted:1b,TC_Shiny:1b,display:{Name:'{"text":"Golden Shovel","color":"white","italic":"false"}',Lore:['{"text":" ➥ Casted","color":"dark_gray","italic":"false"}','{"text":" ➥ Shiny","color":"dark_gray","italic":"false"}']},Enchantments:[{id:"minecraft:unbreaking",lvl:3s}],HideFlags:1,RepairCost:2147483648}},Tags:["TC_justcasted","TC_generateunique"],PickupDelay:50}

# gold hoe
execute as @s[tag=TC_outputgold,tag=TC_anvil,tag=TC_hoe,scores={TC_OutputTimer=60..}] at @s positioned ^ ^ ^2 run data modify entity @e[type=minecraft:item_frame,distance=..0.2,nbt={Item:{id:"minecraft:wooden_hoe",Count:1b}},limit=1,sort=nearest] Item set value {id:"minecraft:air"}
execute as @s[tag=TC_outputgold,tag=TC_anvil,tag=TC_hoe,scores={TC_OutputTimer=60..}] at @s run summon minecraft:item ^ ^ ^2 {Motion:[0.0,0.15,0.0],Item:{id:"minecraft:golden_hoe",Count:1,tag:{TC_Casted:1b,display:{Name:'{"text":"Golden Hoe","color":"white","italic":"false"}',Lore:['{"text":" ➥ Casted","color":"dark_gray","italic":"false"}','{"text":" ➥ Shiny","color":"dark_gray","italic":"false"}']},Enchantments:[{id:"minecraft:unbreaking",lvl:3s}],HideFlags:1,RepairCost:2147483648}},Tags:["TC_justcasted","TC_generateunique"],PickupDelay:50}


#> irgol

# irgol pickaxe
execute as @s[tag=TC_outputirgol,tag=TC_anvil,tag=TC_pickaxe,scores={TC_OutputTimer=80..}] at @s positioned ^ ^ ^2 run data modify entity @e[type=minecraft:item_frame,distance=..0.2,nbt={Item:{id:"minecraft:wooden_pickaxe",Count:1b}},limit=1,sort=nearest] Item set value {id:"minecraft:air"}
execute as @s[tag=TC_outputirgol,tag=TC_anvil,tag=TC_pickaxe,scores={TC_OutputTimer=80..}] at @s run summon minecraft:item ^ ^ ^2 {Motion:[0.0,0.15,0.0],Item:{id:"minecraft:golden_pickaxe",Count:1,tag:{TC_Casted:1b,TC_Alloy:1b,display:{Name:'{"text":"Irgol Pickaxe","color":"yellow","italic":"false"}',Lore:['','{"text":" ➥ Casted","color":"dark_gray","italic":"false"}','{"text":" ➥ Prospector","color":"dark_gray","italic":"false"}']},Enchantments:[{id:"minecraft:unbreaking",lvl:59s},{id:"minecraft:efficiency",lvl:3s},{id:"minecraft:fortune",lvl:2s},{id:"minecraft:sharpness",lvl:7s}],HideFlags:1,RepairCost:2147483648}},Tags:["TinkerersCraft","TC_justcasted"],PickupDelay:50}

# irgol sword
execute as @s[tag=TC_outputirgol,tag=TC_anvil,tag=TC_sword,scores={TC_OutputTimer=80..}] at @s positioned ^ ^ ^2 run data modify entity @e[type=minecraft:item_frame,distance=..0.2,nbt={Item:{id:"minecraft:wooden_sword",Count:1b}},limit=1,sort=nearest] Item set value {id:"minecraft:air"}
execute as @s[tag=TC_outputirgol,tag=TC_anvil,tag=TC_sword,scores={TC_OutputTimer=80..}] at @s run summon minecraft:item ^ ^ ^2 {Motion:[0.0,0.15,0.0],Item:{id:"minecraft:golden_sword",Count:1,tag:{TC_Casted:1b,TC_Alloy:1b,TC_Riptide:1b,display:{Name:'{"text":"Irgol Sword","color":"yellow","italic":"false"}',Lore:['','{"text":" ➥ Casted","color":"dark_gray","italic":"false"}','{"text":" ➥ Prospector","color":"dark_gray","italic":"false"}','{"text":" ➥ Riptide","color":"dark_gray","italic":"false"}']},Enchantments:[{id:"minecraft:unbreaking",lvl:59s},{id:"minecraft:sharpness",lvl:7s},{id:"minecraft:looting",lvl:2s}],HideFlags:1,RepairCost:2147483648}},Tags:["TinkerersCraft","TC_justcasted"],PickupDelay:50}

# irgol axe
execute as @s[tag=TC_outputirgol,tag=TC_anvil,tag=TC_axe,scores={TC_OutputTimer=80..}] at @s positioned ^ ^ ^2 run data modify entity @e[type=minecraft:item_frame,distance=..0.2,nbt={Item:{id:"minecraft:wooden_axe",Count:1b}},limit=1,sort=nearest] Item set value {id:"minecraft:air"}
execute as @s[tag=TC_outputirgol,tag=TC_anvil,tag=TC_axe,scores={TC_OutputTimer=80..}] at @s run summon minecraft:item ^ ^ ^2 {Motion:[0.0,0.15,0.0],Item:{id:"minecraft:golden_axe",Count:1,tag:{TC_Casted:1b,TC_Alloy:1b,display:{Name:'{"text":"Irgol Axe","color":"yellow","italic":"false"}',Lore:['','{"text":" ➥ Casted","color":"dark_gray","italic":"false"}','{"text":" ➥ Prospector","color":"dark_gray","italic":"false"}']},Enchantments:[{id:"minecraft:unbreaking",lvl:59s},{id:"minecraft:efficiency",lvl:3s},{id:"minecraft:fortune",lvl:2s},{id:"minecraft:sharpness",lvl:5s}],HideFlags:1,RepairCost:2147483648}},Tags:["TinkerersCraft","TC_justcasted"],PickupDelay:50}

# irgol shovel
execute as @s[tag=TC_outputirgol,tag=TC_anvil,tag=TC_shovel,scores={TC_OutputTimer=80..}] at @s positioned ^ ^ ^2 run data modify entity @e[type=minecraft:item_frame,distance=..0.2,nbt={Item:{id:"minecraft:wooden_shovel",Count:1b}},limit=1,sort=nearest] Item set value {id:"minecraft:air"}
execute as @s[tag=TC_outputirgol,tag=TC_anvil,tag=TC_shovel,scores={TC_OutputTimer=80..}] at @s run summon minecraft:item ^ ^ ^2 {Motion:[0.0,0.15,0.0],Item:{id:"minecraft:golden_shovel",Count:1,tag:{TC_Casted:1b,TC_Alloy:1b,display:{Name:'{"text":"Irgol Shovel","color":"yellow","italic":"false"}',Lore:['','{"text":" ➥ Casted","color":"dark_gray","italic":"false"}','{"text":" ➥ Prospector","color":"dark_gray","italic":"false"}']},Enchantments:[{id:"minecraft:unbreaking",lvl:59s},{id:"minecraft:efficiency",lvl:3s},{id:"minecraft:fortune",lvl:2s},{id:"minecraft:sharpness",lvl:7s}],HideFlags:1,RepairCost:2147483648}},Tags:["TinkerersCraft","TC_justcasted"],PickupDelay:50}

# irgol hoe
execute as @s[tag=TC_outputirgol,tag=TC_anvil,tag=TC_hoe,scores={TC_OutputTimer=80..}] at @s positioned ^ ^ ^2 run data modify entity @e[type=minecraft:item_frame,distance=..0.2,nbt={Item:{id:"minecraft:wooden_hoe",Count:1b}},limit=1,sort=nearest] Item set value {id:"minecraft:air"}
execute as @s[tag=TC_outputirgol,tag=TC_anvil,tag=TC_hoe,scores={TC_OutputTimer=80..}] at @s run summon minecraft:item ^ ^ ^2 {Motion:[0.0,0.15,0.0],Item:{id:"minecraft:golden_hoe",Count:1,tag:{TC_Casted:1b,TC_Alloy:1b,display:{Name:'{"text":"Irgol Hoe","color":"yellow","italic":"false"}',Lore:['','{"text":" ➥ Casted","color":"dark_gray","italic":"false"}','{"text":" ➥ Prospector","color":"dark_gray","italic":"false"}']},Enchantments:[{id:"minecraft:unbreaking",lvl:59s}],HideFlags:1,RepairCost:2147483648}},Tags:["TinkerersCraft","TC_justcasted"],PickupDelay:50}


#> obdiam

# obdiam pickaxe
execute as @s[tag=TC_outputobdiam,tag=TC_anvil,tag=TC_pickaxe,scores={TC_OutputTimer=100..}] at @s positioned ^ ^ ^2 run data modify entity @e[type=minecraft:item_frame,distance=..0.2,nbt={Item:{id:"minecraft:wooden_pickaxe",Count:1b}},limit=1,sort=nearest] Item set value {id:"minecraft:air"}
execute as @s[tag=TC_outputobdiam,tag=TC_anvil,tag=TC_pickaxe,scores={TC_OutputTimer=100..}] at @s run summon minecraft:item ^ ^ ^2 {Motion:[0.0,0.15,0.0],Item:{id:"minecraft:netherite_pickaxe",Count:1,tag:{TC_Casted:1b,TC_Alloy:1b,TC_Flaming:1b,TC_Heated:1b,display:{Name:'{"text":"Obdiam Pickaxe","color":"dark_red","italic":"false"}',Lore:['','{"text":" ➥ Casted","color":"dark_gray","italic":"false"}','{"text":" ➥ Heated","color":"dark_gray","italic":"false"}']},Enchantments:[{id:"minecraft:unbreaking",lvl:1s},{id:"minecraft:efficiency",lvl:2s},{id:"minecraft:fire_aspect",lvl:1s}],HideFlags:1,RepairCost:2147483648}},Tags:["TinkerersCraft","TC_justcasted"],PickupDelay:20}

# obdiam sword
execute as @s[tag=TC_outputobdiam,tag=TC_anvil,tag=TC_sword,scores={TC_OutputTimer=100..}] at @s positioned ^ ^ ^2 run data modify entity @e[type=minecraft:item_frame,distance=..0.2,nbt={Item:{id:"minecraft:wooden_sword",Count:1b}},limit=1,sort=nearest] Item set value {id:"minecraft:air"}
execute as @s[tag=TC_outputobdiam,tag=TC_anvil,tag=TC_sword,scores={TC_OutputTimer=100..}] at @s run summon minecraft:item ^ ^ ^2 {Motion:[0.0,0.15,0.0],Item:{id:"minecraft:netherite_sword",Count:1,tag:{TC_Casted:1b,TC_Alloy:1b,TC_Flaming:1b,TC_Heated:1b,display:{Name:'{"text":"Obdiam Sword","color":"dark_red","italic":"false"}',Lore:['','{"text":" ➥ Casted","color":"dark_gray","italic":"false"}','{"text":" ➥ Heated","color":"dark_gray","italic":"false"}']},Enchantments:[{id:"minecraft:unbreaking",lvl:1s},{id:"minecraft:sharpness",lvl:1s},{id:"minecraft:sweeping",lvl:2s},{id:"minecraft:fire_aspect",lvl:1s}],HideFlags:1,RepairCost:2147483648}},Tags:["TinkerersCraft","TC_justcasted"],PickupDelay:20}

# obdiam axe
execute as @s[tag=TC_outputobdiam,tag=TC_anvil,tag=TC_axe,scores={TC_OutputTimer=100..}] at @s positioned ^ ^ ^2 run data modify entity @e[type=minecraft:item_frame,distance=..0.2,nbt={Item:{id:"minecraft:wooden_axe",Count:1b}},limit=1,sort=nearest] Item set value {id:"minecraft:air"}
execute as @s[tag=TC_outputobdiam,tag=TC_anvil,tag=TC_axe,scores={TC_OutputTimer=100..}] at @s run summon minecraft:item ^ ^ ^2 {Motion:[0.0,0.15,0.0],Item:{id:"minecraft:netherite_axe",Count:1,tag:{TC_Casted:1b,TC_Alloy:1b,TC_Flaming:1b,TC_Heated:1b,display:{Name:'{"text":"Obdiam Axe","color":"dark_red","italic":"false"}',Lore:['','{"text":" ➥ Casted","color":"dark_gray","italic":"false"}','{"text":" ➥ Heated","color":"dark_gray","italic":"false"}']},Enchantments:[{id:"minecraft:unbreaking",lvl:1s},{id:"minecraft:efficiency",lvl:2s},{id:"minecraft:fire_aspect",lvl:1s}],HideFlags:1,RepairCost:2147483648}},Tags:["TinkerersCraft","TC_justcasted"],PickupDelay:20}

# obdiam shovel
execute as @s[tag=TC_outputobdiam,tag=TC_anvil,tag=TC_shovel,scores={TC_OutputTimer=100..}] at @s positioned ^ ^ ^2 run data modify entity @e[type=minecraft:item_frame,distance=..0.2,nbt={Item:{id:"minecraft:wooden_shovel",Count:1b}},limit=1,sort=nearest] Item set value {id:"minecraft:air"}
execute as @s[tag=TC_outputobdiam,tag=TC_anvil,tag=TC_shovel,scores={TC_OutputTimer=100..}] at @s run summon minecraft:item ^ ^ ^2 {Motion:[0.0,0.15,0.0],Item:{id:"minecraft:netherite_shovel",Count:1,tag:{TC_Casted:1b,TC_Alloy:1b,TC_Flaming:1b,TC_Heated:1b,display:{Name:'{"text":"Obdiam Shovel","color":"dark_red","italic":"false"}',Lore:['','{"text":" ➥ Casted","color":"dark_gray","italic":"false"}','{"text":" ➥ Heated","color":"dark_gray","italic":"false"}']},Enchantments:[{id:"minecraft:unbreaking",lvl:1s},{id:"minecraft:efficiency",lvl:2s},{id:"minecraft:fire_aspect",lvl:1s}],HideFlags:1,RepairCost:2147483648}},Tags:["TinkerersCraft","TC_justcasted"],PickupDelay:20}

# obdiam hoe
execute as @s[tag=TC_outputobdiam,tag=TC_anvil,tag=TC_hoe,scores={TC_OutputTimer=100..}] at @s positioned ^ ^ ^2 run data modify entity @e[type=minecraft:item_frame,distance=..0.2,nbt={Item:{id:"minecraft:wooden_hoe",Count:1b}},limit=1,sort=nearest] Item set value {id:"minecraft:air"}
execute as @s[tag=TC_outputobdiam,tag=TC_anvil,tag=TC_hoe,scores={TC_OutputTimer=100..}] at @s run summon minecraft:item ^ ^ ^2 {Motion:[0.0,0.15,0.0],Item:{id:"minecraft:netherite_hoe",Count:1,tag:{TC_Casted:1b,TC_Alloy:1b,TC_Flaming:1b,TC_Heated:1b,display:{Name:'{"text":"Obdiam Hoe","color":"dark_red","italic":"false"}',Lore:['','{"text":" ➥ Casted","color":"dark_gray","italic":"false"}','{"text":" ➥ Heated","color":"dark_gray","italic":"false"}']},Enchantments:[{id:"minecraft:unbreaking",lvl:1s},{id:"minecraft:fire_aspect",lvl:1s}],HideFlags:1,RepairCost:2147483648}},Tags:["TinkerersCraft","TC_justcasted"],PickupDelay:20}


#> End of file
#> -----------
