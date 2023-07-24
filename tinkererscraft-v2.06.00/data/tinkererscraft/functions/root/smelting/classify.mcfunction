# classifies items by their name, some categories are inclusive of each other
# input items are 1 block above gilded blackstone

#> steps:
# - tag every single known (and expected) item
# - filter out and execute on items in order

#> categories
# - able to be smelted (tagged with TC_smelting and its item name)
# - able to start a reaction (tagged with its item name)
# - able to create a smeltery (tagged with TC_buildsmeltery)
# - cannot be smelted (tagged with TC_slag)



#> step 1: tag every single known (and expected) item
# sort all smeltable items and reactants
# mc1.16
tag @s[nbt={Item:{id:"minecraft:iron_ore"}}] add TC_ironore
tag @s[nbt={Item:{id:"minecraft:gold_ore"}}] add TC_goldore
tag @s[nbt={Item:{id:"minecraft:nether_gold_ore"}}] add TC_nethergoldore
tag @s[nbt={Item:{id:"minecraft:iron_ingot"}}] add TC_iron
tag @s[nbt={Item:{id:"minecraft:gold_ingot"}}] add TC_gold
tag @s[nbt={Item:{id:"minecraft:iron_block"}}] add TC_ironblock
tag @s[nbt={Item:{id:"minecraft:gold_block"}}] add TC_goldblock
tag @s[nbt={Item:{id:"minecraft:obsidian"}}] add TC_obsidian
tag @s[nbt={Item:{id:"minecraft:redstone"}}] add TC_redstone
tag @s[nbt={Item:{id:"minecraft:diamond"}}] add TC_diamond
tag @s[nbt={Item:{id:"minecraft:netherite_scrap"}}] add TC_netheritescrap
tag @s[nbt={Item:{id:"minecraft:netherite_ingot"}}] add TC_netheriteingot
tag @s[nbt={Item:{id:"minecraft:netherite_block"}}] add TC_netheriteblock
tag @s[nbt={Item:{id:"minecraft:command_block"}}] add TC_commandblock
# mc1.17
tag @s[nbt={Item:{id:"minecraft:deepslate_iron_ore"}}] add TC_deepironore
tag @s[nbt={Item:{id:"minecraft:deepslate_gold_ore"}}] add TC_deepgoldore
tag @s[nbt={Item:{id:"minecraft:raw_iron"}}] add TC_rawiron
tag @s[nbt={Item:{id:"minecraft:raw_gold"}}] add TC_rawgold
tag @s[nbt={Item:{id:"minecraft:raw_iron_block"}}] add TC_rawironblock
tag @s[nbt={Item:{id:"minecraft:raw_gold_block"}}] add TC_rawgoldblock
#tag @s[nbt={Item:{id:"minecraft:copper_ore"}}] add TC_copperore
#tag @s[nbt={Item:{id:"minecraft:deepslate_copper_ore"}}] add TC_deepcopperore
#tag @s[nbt={Item:{id:"minecraft:copper_ingot"}}] add TC_copper
#tag @s[nbt={Item:{id:"minecraft:raw_copper"}}] add TC_rawcopper
#tag @s[nbt={Item:{id:"minecraft:raw_copper_block"}}] add TC_rawcopperblock


#> step 2: filter out and execute on items in order
# remember to kill items immediately after being processed

#> filter + execute: dev command
# instantly fills the smeltery to the brim with liquid metal
# Note: does not force upgrade the smeltery
execute as @e[tag=TC_commandblock] at @s as @e[tag=TC_smeltery,distance=..2] at @s run function tinkererscraft:root/others/instafill

#> filter + execute: upgrade materials
# upgrades the smeltery
execute as @e[tag=TC_netheriteingot] at @s as @e[tag=TC_smeltery,distance=..2] at @s run function tinkererscraft:root/smeltery/capacity/upgrade


#> filter: reactants
# requires an upgrade to create alloys
# ui update is done in execute

# irgol
execute as @e[tag=TC_redstone] at @s run tag @e[tag=TC_smeltery,scores={TC_lIron=2..,TC_lGold=3..},distance=..2] add TC_irgolreaction
execute as @e[tag=TC_irgolreaction] at @s run kill @e[tag=TC_redstone,distance=..2]

# obdiam
execute as @e[tag=TC_diamond] at @s run tag @e[tag=TC_smeltery,scores={TC_lIrgol=3..,TC_lObsidian=8..,TC_lCapacity=512..4096},distance=..2] add TC_obdiamreaction
execute as @e[tag=TC_obdiamreaction] at @s run kill @e[tag=TC_diamond,distance=..2]

#> execute: reactants

# irgol
execute as @e[tag=TC_irgolreaction] at @s unless score @s TC_lIrgol >= @s TC_lCapacity run function tinkererscraft:root/smelting/reacting/irgol

# obdiam
execute as @e[tag=TC_obdiamreaction] at @s unless score @s TC_lObdiam >= @s TC_lCapacity run function tinkererscraft:root/smelting/reacting/obdiam


#> filter: items that are being smelted by a smeltery
# the smeltery will tag items to be smelted
# the execute for this filter comes after the smeltery is built so that the item will build the smeltery first, then get processed by the same smeltery it created
# this is important to prevent a bug where the UI controller causes an infinite loop (which soft crashes the datapack) if everything is 0
execute as @e[tag=TC_smeltery] at @s run tag @e[type=minecraft:item,distance=..2] add TC_smelting

#> filter: items that will be building a smeltery
# this only tags items if the previous tagger did not tag the item
# it means that there is no smeltery and one should be built
tag @e[tag=TC_ironore,tag=!TC_smelting] add TC_buildsmeltery
tag @e[tag=TC_goldore,tag=!TC_smelting] add TC_buildsmeltery
tag @e[tag=TC_nethergoldore,tag=!TC_smelting] add TC_buildsmeltery
tag @e[tag=TC_iron,tag=!TC_smelting] add TC_buildsmeltery
tag @e[tag=TC_gold,tag=!TC_smelting] add TC_buildsmeltery
tag @e[tag=TC_ironblock,tag=!TC_smelting] add TC_buildsmeltery
tag @e[tag=TC_goldblock,tag=!TC_smelting] add TC_buildsmeltery
tag @e[tag=TC_obsidian,tag=!TC_smelting] add TC_buildsmeltery

#> execute: build smeltery
execute as @e[tag=TC_buildsmeltery] at @s align xyz positioned ~ ~-1 ~ unless entity @e[tag=TC_smeltery,distance=..15] run function tinkererscraft:root/smeltery/structure/build/controller
# only remove item after smelt is done
#kill @e[tag=TC_buildsmeltery]

# smelt after building
tag @e[tag=TC_buildsmeltery] add TC_smelting

#> execute: smelt item
# running smelt later, reason is explained in [filter: items that are being smelted by a smeltery]
execute as @e[tag=TC_smelting] at @s as @e[tag=TC_smeltery,distance=..2] at @s align xyz run function tinkererscraft:root/smelting/smelt
# cleanup happens in the smelt function
#kill @e[tag=TC_smelting]

# cleanup
execute as @e[tag=TC_smeltery] at @s run kill @e[tag=TC_buildsmeltery,distance=..2]


#> filter: slag
# 'else' filter that will tag any other item that missed cleanup during smelting
execute as @e[tag=TC_smeltery] at @s run tag @e[tag=TC_smelting] add TC_slag

#> execute: slag
execute as @e[tag=TC_slag] at @s run function tinkererscraft:effects/smelting/slag
execute as @e[tag=TC_smeltery] at @s run kill @e[tag=TC_slag,distance=..2]