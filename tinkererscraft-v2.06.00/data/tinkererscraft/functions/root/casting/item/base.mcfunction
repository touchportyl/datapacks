# contains a list of all the items that can be casted
# this just creates the base item and tags everything accordingly
# the next script will convert those tags into enchantments

# sorted by:
# - blocks
# - pressure plates
# - nuggets
# - ingots
# - tools

#> blocks

# iron block
execute as @s[tag=TC_outputiron,tag=TC_cauldron,scores={TC_OutputTimer=90..}] at @s run summon minecraft:item ^ ^ ^2 {Motion:[0.0,0.15,0.0],Item:{id:"minecraft:iron_block",Count:1},Tags:["TinkerersCraft","TC_gen_item","TC_gen_casted"],PickupDelay:60}

# gold block
execute as @s[tag=TC_outputgold,tag=TC_cauldron,scores={TC_OutputTimer=90..}] at @s run summon minecraft:item ^ ^ ^2 {Motion:[0.0,0.15,0.0],Item:{id:"minecraft:gold_block",Count:1},Tags:["TinkerersCraft","TC_gen_item","TC_gen_casted"],PickupDelay:60}

# obsidian block
execute as @s[tag=TC_outputobsidian,tag=TC_cauldron,scores={TC_OutputTimer=50..}] at @s run summon minecraft:item ^ ^ ^2 {Motion:[0.0,0.15,0.0],Item:{id:"minecraft:obsidian",Count:1},Tags:["TinkerersCraft","TC_gen_item","TC_gen_casted"],PickupDelay:20}


#> pressure plates

# iron pressure plate
execute as @s[tag=TC_outputiron,tag=TC_anvil,tag=TC_pressureplate,scores={TC_OutputTimer=30..}] at @s run summon minecraft:item ^ ^ ^2 {Motion:[0.0,0.15,0.0],Item:{id:"minecraft:heavy_weighted_pressure_plate",Count:1},Tags:["TinkerersCraft","TC_gen_item","TC_gen_casted"],PickupDelay:20}

# gold pressure plate
execute as @s[tag=TC_outputgold,tag=TC_anvil,tag=TC_pressureplate,scores={TC_OutputTimer=30..}] at @s run summon minecraft:item ^ ^ ^2 {Motion:[0.0,0.15,0.0],Item:{id:"minecraft:light_weighted_pressure_plate",Count:1},Tags:["TinkerersCraft","TC_gen_item","TC_gen_casted"],PickupDelay:20}


#> nuggets

# iron nugget
execute as @s[tag=TC_outputiron,tag=TC_anvil,tag=TC_nugget,scores={TC_OutputTimer=30..}] at @s positioned ^ ^ ^2 run function tinkererscraft:root/casting/item/clearitemframe/clayball
execute as @s[tag=TC_outputiron,tag=TC_anvil,tag=TC_nugget,scores={TC_OutputTimer=30..}] at @s run summon minecraft:item ^ ^ ^2 {Motion:[0.0,0.15,0.0],Item:{id:"minecraft:iron_nugget",Count:8},Tags:["TinkerersCraft","TC_gen_item","TC_gen_casted"],PickupDelay:20}

# gold nugget
execute as @s[tag=TC_outputgold,tag=TC_anvil,tag=TC_nugget,scores={TC_OutputTimer=30..}] at @s positioned ^ ^ ^2 run function tinkererscraft:root/casting/item/clearitemframe/clayball
execute as @s[tag=TC_outputgold,tag=TC_anvil,tag=TC_nugget,scores={TC_OutputTimer=30..}] at @s run summon minecraft:item ^ ^ ^2 {Motion:[0.0,0.15,0.0],Item:{id:"minecraft:gold_nugget",Count:8},Tags:["TinkerersCraft","TC_gen_item","TC_gen_casted"],PickupDelay:20}


#> ingots

# iron ingot
execute as @s[tag=TC_outputiron,tag=TC_anvil,tag=TC_ingot,scores={TC_OutputTimer=30..}] at @s positioned ^ ^ ^2 run function tinkererscraft:root/casting/item/clearitemframe/brick
execute as @s[tag=TC_outputiron,tag=TC_anvil,tag=TC_ingot,scores={TC_OutputTimer=30..}] at @s run summon minecraft:item ^ ^ ^2 {Motion:[0.0,0.15,0.0],Item:{id:"minecraft:iron_ingot",Count:1},Tags:["TinkerersCraft","TC_gen_item","TC_gen_casted"],PickupDelay:20}

# gold ingot
execute as @s[tag=TC_outputgold,tag=TC_anvil,tag=TC_ingot,scores={TC_OutputTimer=30..}] at @s positioned ^ ^ ^2 run function tinkererscraft:root/casting/item/clearitemframe/brick
execute as @s[tag=TC_outputgold,tag=TC_anvil,tag=TC_ingot,scores={TC_OutputTimer=30..}] at @s run summon minecraft:item ^ ^ ^2 {Motion:[0.0,0.15,0.0],Item:{id:"minecraft:gold_ingot",Count:1},Tags:["TinkerersCraft","TC_gen_item","TC_gen_casted"],PickupDelay:20}


#> tools

# iron pickaxe
execute as @s[tag=TC_outputiron,tag=TC_anvil,tag=TC_pickaxe,scores={TC_OutputTimer=60..}] at @s positioned ^ ^ ^2 run function tinkererscraft:root/casting/item/clearitemframe/pickaxe
execute as @s[tag=TC_outputiron,tag=TC_anvil,tag=TC_pickaxe,scores={TC_OutputTimer=60..}] at @s run summon minecraft:item ^ ^ ^2 {Motion:[0.0,0.15,0.0],Item:{id:"minecraft:iron_pickaxe",Count:1,tag:{display:{Name:'{"text":"Iron Pickaxe","color":"white","italic":false}'},HideFlags:1,RepairCost:2147483647}},Tags:["TinkerersCraft","TC_gen_item","TC_gen_casted"],PickupDelay:50}

# iron sword
execute as @s[tag=TC_outputiron,tag=TC_anvil,tag=TC_sword,scores={TC_OutputTimer=60..}] at @s positioned ^ ^ ^2 run function tinkererscraft:root/casting/item/clearitemframe/sword
execute as @s[tag=TC_outputiron,tag=TC_anvil,tag=TC_sword,scores={TC_OutputTimer=60..}] at @s run summon minecraft:item ^ ^ ^2 {Motion:[0.0,0.15,0.0],Item:{id:"minecraft:iron_sword",Count:1,tag:{display:{Name:'{"text":"Iron Sword","color":"white","italic":false}'},HideFlags:1,RepairCost:2147483647}},Tags:["TinkerersCraft","TC_gen_item","TC_gen_casted"],PickupDelay:50}

# iron axe
execute as @s[tag=TC_outputiron,tag=TC_anvil,tag=TC_axe,scores={TC_OutputTimer=60..}] at @s positioned ^ ^ ^2 run function tinkererscraft:root/casting/item/clearitemframe/axe
execute as @s[tag=TC_outputiron,tag=TC_anvil,tag=TC_axe,scores={TC_OutputTimer=60..}] at @s run summon minecraft:item ^ ^ ^2 {Motion:[0.0,0.15,0.0],Item:{id:"minecraft:iron_axe",Count:1,tag:{display:{Name:'{"text":"Iron Axe","color":"white","italic":false}'},HideFlags:1,RepairCost:2147483647}},Tags:["TinkerersCraft","TC_gen_item","TC_gen_casted"],PickupDelay:50}

# iron shovel
execute as @s[tag=TC_outputiron,tag=TC_anvil,tag=TC_shovel,scores={TC_OutputTimer=60..}] at @s positioned ^ ^ ^2 run function tinkererscraft:root/casting/item/clearitemframe/shovel
execute as @s[tag=TC_outputiron,tag=TC_anvil,tag=TC_shovel,scores={TC_OutputTimer=60..}] at @s run summon minecraft:item ^ ^ ^2 {Motion:[0.0,0.15,0.0],Item:{id:"minecraft:iron_shovel",Count:1,tag:{display:{Name:'{"text":"Iron Shovel","color":"white","italic":false}'},HideFlags:1,RepairCost:2147483647}},Tags:["TinkerersCraft","TC_gen_item","TC_gen_casted"],PickupDelay:50}

# iron hoe
execute as @s[tag=TC_outputiron,tag=TC_anvil,tag=TC_hoe,scores={TC_OutputTimer=60..}] at @s positioned ^ ^ ^2 run function tinkererscraft:root/casting/item/clearitemframe/hoe
execute as @s[tag=TC_outputiron,tag=TC_anvil,tag=TC_hoe,scores={TC_OutputTimer=60..}] at @s run summon minecraft:item ^ ^ ^2 {Motion:[0.0,0.15,0.0],Item:{id:"minecraft:iron_hoe",Count:1,tag:{display:{Name:'{"text":"Iron Hoe","color":"white","italic":false}'},HideFlags:1,RepairCost:2147483647}},Tags:["TinkerersCraft","TC_gen_item","TC_gen_casted"],PickupDelay:50}


# gold pickaxe
execute as @s[tag=TC_outputgold,tag=TC_anvil,tag=TC_pickaxe,scores={TC_OutputTimer=60..}] at @s positioned ^ ^ ^2 run function tinkererscraft:root/casting/item/clearitemframe/pickaxe
execute as @s[tag=TC_outputgold,tag=TC_anvil,tag=TC_pickaxe,scores={TC_OutputTimer=60..}] at @s run summon minecraft:item ^ ^ ^2 {Motion:[0.0,0.15,0.0],Item:{id:"minecraft:golden_pickaxe",Count:1,tag:{display:{Name:'{"text":"Golden Pickaxe","color":"white","italic":false}'},HideFlags:1,RepairCost:2147483647}},Tags:["TinkerersCraft","TC_gen_item","TC_gen_casted"],PickupDelay:50}

# gold sword
execute as @s[tag=TC_outputgold,tag=TC_anvil,tag=TC_sword,scores={TC_OutputTimer=60..}] at @s positioned ^ ^ ^2 run function tinkererscraft:root/casting/item/clearitemframe/sword
execute as @s[tag=TC_outputgold,tag=TC_anvil,tag=TC_sword,scores={TC_OutputTimer=60..}] at @s run summon minecraft:item ^ ^ ^2 {Motion:[0.0,0.15,0.0],Item:{id:"minecraft:golden_sword",Count:1,tag:{display:{Name:'{"text":"Golden Sword","color":"white","italic":false}'},HideFlags:1,RepairCost:2147483647}},Tags:["TinkerersCraft","TC_gen_item","TC_gen_casted"],PickupDelay:50}

# gold axe
execute as @s[tag=TC_outputgold,tag=TC_anvil,tag=TC_axe,scores={TC_OutputTimer=60..}] at @s positioned ^ ^ ^2 run function tinkererscraft:root/casting/item/clearitemframe/axe
execute as @s[tag=TC_outputgold,tag=TC_anvil,tag=TC_axe,scores={TC_OutputTimer=60..}] at @s run summon minecraft:item ^ ^ ^2 {Motion:[0.0,0.15,0.0],Item:{id:"minecraft:golden_axe",Count:1,tag:{display:{Name:'{"text":"Golden Axe","color":"white","italic":false}'},HideFlags:1,RepairCost:2147483647}},Tags:["TinkerersCraft","TC_gen_item","TC_gen_casted"],PickupDelay:50}

# gold shovel
execute as @s[tag=TC_outputgold,tag=TC_anvil,tag=TC_shovel,scores={TC_OutputTimer=60..}] at @s positioned ^ ^ ^2 run function tinkererscraft:root/casting/item/clearitemframe/shovel
execute as @s[tag=TC_outputgold,tag=TC_anvil,tag=TC_shovel,scores={TC_OutputTimer=60..}] at @s run summon minecraft:item ^ ^ ^2 {Motion:[0.0,0.15,0.0],Item:{id:"minecraft:golden_shovel",Count:1,tag:{display:{Name:'{"text":"Golden Shovel","color":"white","italic":false}'},HideFlags:1,RepairCost:2147483647}},Tags:["TinkerersCraft","TC_gen_item","TC_gen_casted"],PickupDelay:50}

# gold hoe
execute as @s[tag=TC_outputgold,tag=TC_anvil,tag=TC_hoe,scores={TC_OutputTimer=60..}] at @s positioned ^ ^ ^2 run function tinkererscraft:root/casting/item/clearitemframe/hoe
execute as @s[tag=TC_outputgold,tag=TC_anvil,tag=TC_hoe,scores={TC_OutputTimer=60..}] at @s run summon minecraft:item ^ ^ ^2 {Motion:[0.0,0.15,0.0],Item:{id:"minecraft:golden_hoe",Count:1,tag:{display:{Name:'{"text":"Golden Hoe","color":"white","italic":false}'},HideFlags:1,RepairCost:2147483647}},Tags:["TinkerersCraft","TC_gen_item","TC_gen_casted"],PickupDelay:50}


# irgol pickaxe
execute as @s[tag=TC_outputirgol,tag=TC_anvil,tag=TC_pickaxe,scores={TC_OutputTimer=80..}] at @s positioned ^ ^ ^2 run function tinkererscraft:root/casting/item/clearitemframe/pickaxe
execute as @s[tag=TC_outputirgol,tag=TC_anvil,tag=TC_pickaxe,scores={TC_OutputTimer=80..}] at @s run summon minecraft:item ^ ^ ^2 {Motion:[0.0,0.15,0.0],Item:{id:"minecraft:golden_pickaxe",Count:1,tag:{display:{Name:'{"text":"Irgol Pickaxe","color":"gold","italic":false}'},HideFlags:1,RepairCost:2147483647}},Tags:["TinkerersCraft","TC_gen_item","TC_gen_casted"],PickupDelay:50}

# irgol sword
execute as @s[tag=TC_outputirgol,tag=TC_anvil,tag=TC_sword,scores={TC_OutputTimer=80..}] at @s positioned ^ ^ ^2 run function tinkererscraft:root/casting/item/clearitemframe/sword
execute as @s[tag=TC_outputirgol,tag=TC_anvil,tag=TC_sword,scores={TC_OutputTimer=80..}] at @s run summon minecraft:item ^ ^ ^2 {Motion:[0.0,0.15,0.0],Item:{id:"minecraft:golden_sword",Count:1,tag:{display:{Name:'{"text":"Irgol Sword","color":"gold","italic":false}'},HideFlags:1,RepairCost:2147483647}},Tags:["TinkerersCraft","TC_gen_item","TC_gen_casted"],PickupDelay:50}

# irgol axe
execute as @s[tag=TC_outputirgol,tag=TC_anvil,tag=TC_axe,scores={TC_OutputTimer=80..}] at @s positioned ^ ^ ^2 run function tinkererscraft:root/casting/item/clearitemframe/axe
execute as @s[tag=TC_outputirgol,tag=TC_anvil,tag=TC_axe,scores={TC_OutputTimer=80..}] at @s run summon minecraft:item ^ ^ ^2 {Motion:[0.0,0.15,0.0],Item:{id:"minecraft:golden_axe",Count:1,tag:{display:{Name:'{"text":"Irgol Axe","color":"gold","italic":false}'},HideFlags:1,RepairCost:2147483647}},Tags:["TinkerersCraft","TC_gen_item","TC_gen_casted"],PickupDelay:50}

# irgol shovel
execute as @s[tag=TC_outputirgol,tag=TC_anvil,tag=TC_shovel,scores={TC_OutputTimer=80..}] at @s positioned ^ ^ ^2 run function tinkererscraft:root/casting/item/clearitemframe/shovel
execute as @s[tag=TC_outputirgol,tag=TC_anvil,tag=TC_shovel,scores={TC_OutputTimer=80..}] at @s run summon minecraft:item ^ ^ ^2 {Motion:[0.0,0.15,0.0],Item:{id:"minecraft:golden_shovel",Count:1,tag:{display:{Name:'{"text":"Irgol Shovel","color":"gold","italic":false}'},HideFlags:1,RepairCost:2147483647}},Tags:["TinkerersCraft","TC_gen_item","TC_gen_casted"],PickupDelay:50}

# irgol hoe
execute as @s[tag=TC_outputirgol,tag=TC_anvil,tag=TC_hoe,scores={TC_OutputTimer=80..}] at @s positioned ^ ^ ^2 run function tinkererscraft:root/casting/item/clearitemframe/hoe
execute as @s[tag=TC_outputirgol,tag=TC_anvil,tag=TC_hoe,scores={TC_OutputTimer=80..}] at @s run summon minecraft:item ^ ^ ^2 {Motion:[0.0,0.15,0.0],Item:{id:"minecraft:golden_hoe",Count:1,tag:{display:{Name:'{"text":"Irgol Hoe","color":"gold","italic":false}'},HideFlags:1,RepairCost:2147483647}},Tags:["TinkerersCraft","TC_gen_item","TC_gen_casted"],PickupDelay:50}


# obdiam pickaxe
execute as @s[tag=TC_outputobdiam,tag=TC_anvil,tag=TC_pickaxe,scores={TC_OutputTimer=100..}] at @s positioned ^ ^ ^2 run function tinkererscraft:root/casting/item/clearitemframe/pickaxe
execute as @s[tag=TC_outputobdiam,tag=TC_anvil,tag=TC_pickaxe,scores={TC_OutputTimer=100..}] at @s run summon minecraft:item ^ ^ ^2 {Motion:[0.0,0.15,0.0],Item:{id:"minecraft:netherite_pickaxe",Count:1,tag:{display:{Name:'{"text":"Obdiam Pickaxe","color":"dark_red","italic":false}'},HideFlags:1,RepairCost:2147483647}},Tags:["TinkerersCraft","TC_gen_item","TC_gen_casted"],PickupDelay:20}

# obdiam sword
execute as @s[tag=TC_outputobdiam,tag=TC_anvil,tag=TC_sword,scores={TC_OutputTimer=100..}] at @s positioned ^ ^ ^2 run function tinkererscraft:root/casting/item/clearitemframe/sword
execute as @s[tag=TC_outputobdiam,tag=TC_anvil,tag=TC_sword,scores={TC_OutputTimer=100..}] at @s run summon minecraft:item ^ ^ ^2 {Motion:[0.0,0.15,0.0],Item:{id:"minecraft:netherite_sword",Count:1,tag:{display:{Name:'{"text":"Obdiam Sword","color":"dark_red","italic":false}'},HideFlags:1,RepairCost:2147483647}},Tags:["TinkerersCraft","TC_gen_item","TC_gen_casted"],PickupDelay:20}

# obdiam axe
execute as @s[tag=TC_outputobdiam,tag=TC_anvil,tag=TC_axe,scores={TC_OutputTimer=100..}] at @s positioned ^ ^ ^2 run function tinkererscraft:root/casting/item/clearitemframe/axe
execute as @s[tag=TC_outputobdiam,tag=TC_anvil,tag=TC_axe,scores={TC_OutputTimer=100..}] at @s run summon minecraft:item ^ ^ ^2 {Motion:[0.0,0.15,0.0],Item:{id:"minecraft:netherite_axe",Count:1,tag:{display:{Name:'{"text":"Obdiam Axe","color":"dark_red","italic":false}'},HideFlags:1,RepairCost:2147483647}},Tags:["TinkerersCraft","TC_gen_item","TC_gen_casted"],PickupDelay:20}

# obdiam shovel
execute as @s[tag=TC_outputobdiam,tag=TC_anvil,tag=TC_shovel,scores={TC_OutputTimer=100..}] at @s positioned ^ ^ ^2 run function tinkererscraft:root/casting/item/clearitemframe/shovel
execute as @s[tag=TC_outputobdiam,tag=TC_anvil,tag=TC_shovel,scores={TC_OutputTimer=100..}] at @s run summon minecraft:item ^ ^ ^2 {Motion:[0.0,0.15,0.0],Item:{id:"minecraft:netherite_shovel",Count:1,tag:{display:{Name:'{"text":"Obdiam Shovel","color":"dark_red","italic":false}'},HideFlags:1,RepairCost:2147483647}},Tags:["TinkerersCraft","TC_gen_item","TC_gen_casted"],PickupDelay:20}

# obdiam hoe
execute as @s[tag=TC_outputobdiam,tag=TC_anvil,tag=TC_hoe,scores={TC_OutputTimer=100..}] at @s positioned ^ ^ ^2 run function tinkererscraft:root/casting/item/clearitemframe/hoe
execute as @s[tag=TC_outputobdiam,tag=TC_anvil,tag=TC_hoe,scores={TC_OutputTimer=100..}] at @s run summon minecraft:item ^ ^ ^2 {Motion:[0.0,0.15,0.0],Item:{id:"minecraft:netherite_hoe",Count:1,tag:{display:{Name:'{"text":"Obdiam Hoe","color":"dark_red","italic":false}'},HideFlags:1,RepairCost:2147483647}},Tags:["TinkerersCraft","TC_gen_item","TC_gen_casted"],PickupDelay:20}