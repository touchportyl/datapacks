#> -----------------------------------------------
#> Tinkerer's Craft Datapack
#> This code is protected by the GNU GPLv3 License
#> © 2020 Portyl Studios
#> https://portylstudios.com
#> -----------------------------------------------


#> controller (references: ../main)
# this consolidates and controls all the garbage collection code


#> grinded_tools
function tinkererscraft:modules/garbage_collection/grinded_tools

# non-persistent tags
execute as @e[tag=TC_cauldron] run tag @s remove TC_cauldron
execute as @e[tag=TC_anvil] run tag @s remove TC_anvil
execute as @e[tag=TC_ingot] run tag @s remove TC_ingot
execute as @e[tag=TC_nugget] run tag @s remove TC_nugget
execute as @e[tag=TC_pickaxe] run tag @s remove TC_pickaxe
execute as @e[tag=TC_sword] run tag @s remove TC_sword
execute as @e[tag=TC_axe] run tag @s remove TC_axe
execute as @e[tag=TC_shovel] run tag @s remove TC_shovel
execute as @e[tag=TC_hoe] run tag @s remove TC_hoe
execute as @e[tag=TC_pressureplate] run tag @s remove TC_pressureplate


#> End of file
#> -----------
