#> -----------------------------------------------
#> Tinkerer's Craft Datapack
#> This code is protected by the GNU GPLv3 License
#> © 2020 Portyl Studios
#> https://portylstudios.com
#> -----------------------------------------------


#> override (references: ../modules/smelting/detection)
# this code sorts items, some categories are inclusive of each other
# - cannot be smelted (tagged with TC_slag)
# - able to be smelted (tagged with TC_smelting and its item name)
# - able to start a reaction (tagged with its item name)
# - able to create a smeltery (tagged with TC_buildsmeltery)

# display shows recently smelted
execute as @e[tag=TC_copperore] at @s as @e[tag=TC_smeltery,distance=..2] at @s run function tinkererscraft:modules/smeltery/ui/override/copper
execute as @e[tag=TC_copper] at @s as @e[tag=TC_smeltery,distance=..2] at @s run function tinkererscraft:modules/smeltery/ui/override/copper

execute as @e[tag=TC_copperblock] at @s as @e[tag=TC_smeltery,distance=..2] at @s run function tinkererscraft:modules/smeltery/ui/override/copper
execute as @e[tag=TC_exposedcopperblock] at @s as @e[tag=TC_smeltery,distance=..2] at @s run function tinkererscraft:modules/smeltery/ui/override/copper
execute as @e[tag=TC_weatheredcopperblock] at @s as @e[tag=TC_smeltery,distance=..2] at @s run function tinkererscraft:modules/smeltery/ui/override/copper
execute as @e[tag=TC_oxidizedcopperblock] at @s as @e[tag=TC_smeltery,distance=..2] at @s run function tinkererscraft:modules/smeltery/ui/override/copper

execute as @e[tag=TC_cutcopper] at @s as @e[tag=TC_smeltery,distance=..2] at @s run function tinkererscraft:modules/smeltery/ui/override/copper
execute as @e[tag=TC_exposedcutcopper] at @s as @e[tag=TC_smeltery,distance=..2] at @s run function tinkererscraft:modules/smeltery/ui/override/copper
execute as @e[tag=TC_weatheredcutcopper] at @s as @e[tag=TC_smeltery,distance=..2] at @s run function tinkererscraft:modules/smeltery/ui/override/copper
execute as @e[tag=TC_oxidizedcutcopper] at @s as @e[tag=TC_smeltery,distance=..2] at @s run function tinkererscraft:modules/smeltery/ui/override/copper

execute as @e[tag=TC_cutcopperstairs] at @s as @e[tag=TC_smeltery,distance=..2] at @s run function tinkererscraft:modules/smeltery/ui/override/copper
execute as @e[tag=TC_exposedcutcopperstairs] at @s as @e[tag=TC_smeltery,distance=..2] at @s run function tinkererscraft:modules/smeltery/ui/override/copper
execute as @e[tag=TC_weatheredcutcopperstairs] at @s as @e[tag=TC_smeltery,distance=..2] at @s run function tinkererscraft:modules/smeltery/ui/override/copper
execute as @e[tag=TC_oxidizedcutcopperstairs] at @s as @e[tag=TC_smeltery,distance=..2] at @s run function tinkererscraft:modules/smeltery/ui/override/copper

execute as @e[tag=TC_cutcopperslab] at @s as @e[tag=TC_smeltery,distance=..2] at @s run function tinkererscraft:modules/smeltery/ui/override/copper
execute as @e[tag=TC_exposedcutcopperslab] at @s as @e[tag=TC_smeltery,distance=..2] at @s run function tinkererscraft:modules/smeltery/ui/override/copper
execute as @e[tag=TC_weatheredcutcopperslab] at @s as @e[tag=TC_smeltery,distance=..2] at @s run function tinkererscraft:modules/smeltery/ui/override/copper
execute as @e[tag=TC_oxidizedcutcopperslab] at @s as @e[tag=TC_smeltery,distance=..2] at @s run function tinkererscraft:modules/smeltery/ui/override/copper

execute as @e[tag=TC_ironore] at @s as @e[tag=TC_smeltery,distance=..2] at @s run function tinkererscraft:modules/smeltery/ui/override/iron
execute as @e[tag=TC_deepslateironore] at @s as @e[tag=TC_smeltery,distance=..2] at @s run function tinkererscraft:modules/smeltery/ui/override/iron
execute as @e[tag=TC_iron] at @s as @e[tag=TC_smeltery,distance=..2] at @s run function tinkererscraft:modules/smeltery/ui/override/iron
execute as @e[tag=TC_ironblock] at @s as @e[tag=TC_smeltery,distance=..2] at @s run function tinkererscraft:modules/smeltery/ui/override/iron

execute as @e[tag=TC_goldore] at @s as @e[tag=TC_smeltery,distance=..2] at @s run function tinkererscraft:modules/smeltery/ui/override/gold
execute as @e[tag=TC_deepslategoldore] at @s as @e[tag=TC_smeltery,distance=..2] at @s run function tinkererscraft:modules/smeltery/ui/override/gold
execute as @e[tag=TC_nethergoldore] at @s as @e[tag=TC_smeltery,distance=..2] at @s run function tinkererscraft:modules/smeltery/ui/override/gold
execute as @e[tag=TC_gold] at @s as @e[tag=TC_smeltery,distance=..2] at @s run function tinkererscraft:modules/smeltery/ui/override/gold
execute as @e[tag=TC_goldblock] at @s as @e[tag=TC_smeltery,distance=..2] at @s run function tinkererscraft:modules/smeltery/ui/override/gold

execute as @e[tag=TC_obsidian] at @s as @e[tag=TC_smeltery,distance=..2] at @s run function tinkererscraft:modules/smeltery/ui/override/obsidian


#> End of file
#> -----------
