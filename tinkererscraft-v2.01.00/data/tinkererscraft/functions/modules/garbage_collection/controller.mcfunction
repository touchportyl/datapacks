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
tag @e[tag=TC_cauldron] remove TC_cauldron
tag @e[tag=TC_anvil] remove TC_anvil
tag @e[tag=TC_ingot] remove TC_ingot
tag @e[tag=TC_nugget] remove TC_nugget
tag @e[tag=TC_pickaxe] remove TC_pickaxe
tag @e[tag=TC_sword] remove TC_sword
tag @e[tag=TC_axe] remove TC_axe
tag @e[tag=TC_shovel] remove TC_shovel
tag @e[tag=TC_hoe] remove TC_hoe
tag @e[tag=TC_pressureplate] remove TC_pressureplate


#> End of file
#> -----------
