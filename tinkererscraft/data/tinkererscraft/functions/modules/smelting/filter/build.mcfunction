#> -----------------------------------------------
#> Tinkerer's Craft Datapack
#> This code is protected by the GNU GPLv3 License
#> © 2020 Portyl Studios
#> https://portylstudios.com
#> -----------------------------------------------


#> build (references: ../modules/smelting/detection)
# this code sorts items, some categories are inclusive of each other
# - cannot be smelted (tagged with TC_slag)
# - able to be smelted (tagged with TC_smelting and its item name)
# - able to start a reaction (tagged with its item name)
# - able to create a smeltery (tagged with TC_buildsmeltery)


# filter out items that will be building a smeltery
execute as @e[tag=TC_copperore,tag=!TC_smelting] run tag @s add TC_buildsmeltery
execute as @e[tag=TC_deepslatecopperore,tag=!TC_smelting] run tag @s add TC_buildsmeltery
execute as @e[tag=TC_copper,tag=!TC_smelting] run tag @s add TC_buildsmeltery
execute as @e[tag=TC_copperblock,tag=!TC_smelting] run tag @s add TC_buildsmeltery
execute as @e[tag=TC_exposedcopperblock,tag=!TC_smelting] run tag @s add TC_buildsmeltery
execute as @e[tag=TC_weatheredcopperblock,tag=!TC_smelting] run tag @s add TC_buildsmeltery
execute as @e[tag=TC_oxidizedcopperblock,tag=!TC_smelting] run tag @s add TC_buildsmeltery
execute as @e[tag=TC_cutcopper,tag=!TC_smelting] run tag @s add TC_buildsmeltery
execute as @e[tag=TC_exposedcutcopper,tag=!TC_smelting] run tag @s add TC_buildsmeltery
execute as @e[tag=TC_weatheredcutcopper,tag=!TC_smelting] run tag @s add TC_buildsmeltery
execute as @e[tag=TC_oxidizedcutcopper,tag=!TC_smelting] run tag @s add TC_buildsmeltery
execute as @e[tag=TC_cutcopperstairs,tag=!TC_smelting] run tag @s add TC_buildsmeltery
#execute as @e[tag=TC_exposedcutcopperstairs,tag=!TC_smelting] run tag @s add TC_buildsmeltery
#execute as @e[tag=TC_weatheredcutcopperstairs,tag=!TC_smelting] run tag @s add TC_buildsmeltery
#execute as @e[tag=TC_oxidizedcutcopperstairs,tag=!TC_smelting] run tag @s add TC_buildsmeltery
execute as @e[tag=TC_cutcopperslab,tag=!TC_smelting] run tag @s add TC_buildsmeltery
#execute as @e[tag=TC_exposedcutcopperslab,tag=!TC_smelting] run tag @s add TC_buildsmeltery
#execute as @e[tag=TC_weatheredcutcopperslab,tag=!TC_smelting] run tag @s add TC_buildsmeltery
#execute as @e[tag=TC_oxidizedcutcopperslab,tag=!TC_smelting] run tag @s add TC_buildsmeltery

execute as @e[tag=TC_ironore,tag=!TC_smelting] run tag @s add TC_buildsmeltery
execute as @e[tag=TC_deepslateironore,tag=!TC_smelting] run tag @s add TC_buildsmeltery
execute as @e[tag=TC_iron,tag=!TC_smelting] run tag @s add TC_buildsmeltery
execute as @e[tag=TC_ironblock,tag=!TC_smelting] run tag @s add TC_buildsmeltery

execute as @e[tag=TC_goldore,tag=!TC_smelting] run tag @s add TC_buildsmeltery
execute as @e[tag=TC_deepslategoldore,tag=!TC_smelting] run tag @s add TC_buildsmeltery
execute as @e[tag=TC_nethergoldore,tag=!TC_smelting] run tag @s add TC_buildsmeltery
execute as @e[tag=TC_gold,tag=!TC_smelting] run tag @s add TC_buildsmeltery
execute as @e[tag=TC_goldblock,tag=!TC_smelting] run tag @s add TC_buildsmeltery

execute as @e[tag=TC_obsidian,tag=!TC_smelting] run tag @s add TC_buildsmeltery

execute as @e[tag=TC_commandblock,tag=!TC_smelting] run tag @s add TC_buildsmeltery


#> End of file
#> -----------
