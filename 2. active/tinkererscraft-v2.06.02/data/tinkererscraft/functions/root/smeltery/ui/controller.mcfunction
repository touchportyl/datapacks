# controls the ore display for all the smelteries
# - cycle tags
# - set values based on tag


# tutorial to iron
function tinkererscraft:root/smeltery/ui/null_iron

# iron to gold
function tinkererscraft:root/smeltery/ui/iron_gold

# gold to obsidian
function tinkererscraft:root/smeltery/ui/gold_obsidian

# obsidian to irgol
function tinkererscraft:root/smeltery/ui/obsidian_irgol

# irgol to obdiam
function tinkererscraft:root/smeltery/ui/irgol_obdiam

# obdiam to iron
function tinkererscraft:root/smeltery/ui/obdiam_iron

#> update
function tinkererscraft:root/smeltery/ui/update

# double run to loop around if iron is 0
# causes infinite loop (which soft crashes the datapack) if everything is 0
execute as @s[tag=TC_outputiron,scores={TC_lIron=0}] at @s run function tinkererscraft:root/smeltery/ui/controller


# cleanup
# just in case the UI glass was broken with a silk touch tool
execute as @e[tag=TC_display] at @s run kill @e[type=item,distance=..1,nbt={Item:{id:"minecraft:black_stained_glass"}}]