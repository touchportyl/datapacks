#> -----------------------------------------------
#> Tinkerer's Craft Datapack
#> This code is protected by the GNU GPLv3 License
#> © 2020 Portyl Studios
#> https://portylstudios.com
#> -----------------------------------------------


#> controller (references: ../main)
# this code controls the ore display for all the smelteries
# - cycle tags
# - set values based on tag


# tutorial to iron
function tinkererscraft:modules/smeltery/ui/null_iron

# iron to gold
function tinkererscraft:modules/smeltery/ui/iron_gold

# gold to obsidian
function tinkererscraft:modules/smeltery/ui/gold_obsidian

# obsidian to irgol
function tinkererscraft:modules/smeltery/ui/obsidian_irgol

# irgol to obdiam
function tinkererscraft:modules/smeltery/ui/irgol_obdiam

# obdiam to iron
function tinkererscraft:modules/smeltery/ui/obdiam_iron

#> update
function tinkererscraft:modules/smeltery/ui/update

# double run to loop around if iron is 0
execute as @s[tag=TC_outputiron,scores={TC_lIron=0}] at @s run function tinkererscraft:modules/smeltery/ui/controller


#todo:gc
execute as @e[tag=TC_display] at @s run kill @e[type=minecraft:item,name="Black Stained Glass",distance=..1]


#> End of file
#> -----------
