#> -----------------------------------------------
#> Tinkerer's Craft Datapack
#> This code is protected by the GNU GPLv3 License
#> © 2020 Portyl Studios
#> https://portylstudios.com
#> -----------------------------------------------


#> detection (references: ../main)
# this code sorts items, some categories are inclusive of each other
# - cannot be smelted (tagged with TC_slag)
# - able to be smelted (tagged with TC_smelting and its item name)
# - able to start a reaction (tagged with its item name)
# - able to create a smeltery (tagged with TC_buildsmeltery)


# parse
execute as @s at @s run function tinkererscraft:modules/smelting/filter/parser

# filter out dev command
execute as @e[tag=TC_commandblock] at @s as @e[tag=TC_smeltery,distance=..2] at @s run function tinkererscraft:modules/developer/storage_fill

# filter out upgrade materials
execute as @e[tag=TC_netheriteblock] at @s as @e[tag=TC_smeltery,distance=..2] at @s run function tinkererscraft:modules/smeltery/capacity/upgrade

# filter out reactants
execute as @s at @s run function tinkererscraft:modules/smelting/filter/reactants

# filter out items that are being smelted by a smeltery
execute as @e[tag=TC_smeltery] at @s run tag @e[type=minecraft:item,distance=..2] add TC_smelting

# filter out items that will be building a smeltery
execute as @s at @s run function tinkererscraft:modules/smelting/filter/build

# filter out slag
tag @e[tag=TC_smelting,tag=!TC_copperore,tag=!TC_copper,tag=!TC_copperblock,tag=!TC_exposedcopperblock,tag=!TC_weatheredcopperblock,tag=!TC_oxidizedcopperblock,tag=!TC_cutcopper,tag=!TC_exposedcutcopper,tag=!TC_weatheredcutcopper,tag=!TC_oxidizedcutcopper,tag=!TC_cutcopperstairs,tag=!TC_exposedcutcopperstairs,tag=!TC_weatheredcutcopperstairs,tag=!TC_oxidizedcutcopperstairs,tag=!TC_cutcopperslab,tag=!TC_exposedcutcopperslab,tag=!TC_weatheredcutcopperslab,tag=!TC_oxidizedcutcopperslab,tag=!TC_ironore,tag=!TC_deepslateironore,tag=!TC_iron,tag=!TC_ironblock,tag=!TC_goldore,tag=!TC_deepslategoldore,tag=!TC_nethergoldore,tag=!TC_gold,tag=!TC_goldblock,tag=!TC_obsidian] add TC_slag
tag @e[tag=TC_slag] remove TC_smelting

# display shows recently smelted
function tinkererscraft:modules/smelting/ui/override


#> End of file
#> -----------
