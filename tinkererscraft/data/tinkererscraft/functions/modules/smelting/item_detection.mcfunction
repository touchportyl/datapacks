#> -----------------------------------------------
#> Tinkerer's Craft Datapack
#> This code is protected by the GNU GPLv3 License
#> © 2020 Portyl Studios
#> https://portylstudios.com
#> -----------------------------------------------


#> item_detection (references: ../main)
# this code sorts items, some categories are inclusive of each other
# - cannot be smelted (tagged with TC_slag)
# - able to be smelted (tagged with TC_smelting and its item name)
# - able to start a reaction (tagged with its item name)
# - able to create a smeltery (tagged with TC_buildsmeltery)


# sort all smeltable items and reactants
execute as @s[name="Iron Ore"] run tag @s add TC_ironore
execute as @s[name="Gold Ore"] run tag @s add TC_goldore
execute as @s[name="Nether Gold Ore"] run tag @s add TC_nethergoldore
execute as @s[name="Iron Ingot"] run tag @s add TC_iron
execute as @s[name="Gold Ingot"] run tag @s add TC_gold
execute as @s[name="Block of Iron"] run tag @s add TC_ironblock
execute as @s[name="Block of Gold"] run tag @s add TC_goldblock
execute as @s[name="Obsidian"] run tag @s add TC_obsidian
execute as @s[name="Redstone Dust"] run tag @s add TC_redstone
execute as @s[name="Diamond"] run tag @s add TC_diamond
execute as @s[name="Command Block"] run tag @s add TC_commandblock

# filter dev command
execute as @e[tag=TC_commandblock] at @s as @e[tag=TC_smeltery,distance=..2] run function tinkererscraft:modules/developer/storage_fill

# filter out reactants
execute as @e[tag=TC_redstone] at @s run tag @e[tag=TC_smeltery,scores={TC_lIron=2..,TC_lGold=3..},distance=..2] add TC_irgolreaction
execute as @e[tag=TC_diamond] at @s run tag @e[tag=TC_smeltery,scores={TC_lIron=9..,TC_lObsidian=2..},distance=..2] add TC_obdiamreaction

#todo:gc
execute as @e[tag=TC_irgolreaction] at @s run kill @e[tag=TC_redstone,distance=..2]
execute as @e[tag=TC_obdiamreaction] at @s run kill @e[tag=TC_diamond,distance=..2]

# filter out items that are being smelted by a smeltery
execute as @e[tag=TC_smeltery] at @s run tag @e[type=minecraft:item,distance=..2] add TC_smelting

# filter out items that will be building a smeltery
execute as @e[tag=TC_ironore,tag=!TC_smelting] run tag @s add TC_buildsmeltery
execute as @e[tag=TC_goldore,tag=!TC_smelting] run tag @s add TC_buildsmeltery
execute as @e[tag=TC_nethergoldore,tag=!TC_smelting] run tag @s add TC_buildsmeltery
execute as @e[tag=TC_iron,tag=!TC_smelting] run tag @s add TC_buildsmeltery
execute as @e[tag=TC_gold,tag=!TC_smelting] run tag @s add TC_buildsmeltery
execute as @e[tag=TC_ironblock,tag=!TC_smelting] run tag @s add TC_buildsmeltery
execute as @e[tag=TC_goldblock,tag=!TC_smelting] run tag @s add TC_buildsmeltery
execute as @e[tag=TC_obsidian,tag=!TC_smelting] run tag @s add TC_buildsmeltery

# filter out slag
tag @e[tag=TC_smelting,tag=!TC_ironore,tag=!TC_goldore,tag=!TC_nethergoldore,tag=!TC_iron,tag=!TC_gold,tag=!TC_ironblock,tag=!TC_goldblock,tag=!TC_obsidian] add TC_slag
tag @e[tag=TC_slag] remove TC_smelting

# display shows recently smelted
execute as @e[tag=TC_ironore] at @s as @e[tag=TC_smeltery,distance=..2] at @s run function tinkererscraft:modules/smeltery/ui/override/iron
execute as @e[tag=TC_goldore] at @s as @e[tag=TC_smeltery,distance=..2] at @s run function tinkererscraft:modules/smeltery/ui/override/gold
execute as @e[tag=TC_nethergoldore] at @s as @e[tag=TC_smeltery,distance=..2] at @s run function tinkererscraft:modules/smeltery/ui/override/gold
execute as @e[tag=TC_iron] at @s as @e[tag=TC_smeltery,distance=..2] at @s run function tinkererscraft:modules/smeltery/ui/override/iron
execute as @e[tag=TC_gold] at @s as @e[tag=TC_smeltery,distance=..2] at @s run function tinkererscraft:modules/smeltery/ui/override/gold
execute as @e[tag=TC_ironblock] at @s as @e[tag=TC_smeltery,distance=..2] at @s run function tinkererscraft:modules/smeltery/ui/override/iron
execute as @e[tag=TC_goldblock] at @s as @e[tag=TC_smeltery,distance=..2] at @s run function tinkererscraft:modules/smeltery/ui/override/gold
execute as @e[tag=TC_obsidian] at @s as @e[tag=TC_smeltery,distance=..2] at @s run function tinkererscraft:modules/smeltery/ui/override/obsidian


#> End of file
#> -----------
