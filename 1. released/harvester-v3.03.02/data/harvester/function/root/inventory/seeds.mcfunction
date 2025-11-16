# this code assigns tags based on the player's inventory items


execute if entity @s[nbt={Inventory:[{id:"minecraft:wheat_seeds"}]}] run tag @s add HV_wheat
execute if entity @s[nbt={Inventory:[{id:"minecraft:potato"}]}] run tag @s add HV_potato
execute if entity @s[nbt={Inventory:[{id:"minecraft:carrot"}]}] run tag @s add HV_carrot
execute if entity @s[nbt={Inventory:[{id:"minecraft:beetroot_seeds"}]}] run tag @s add HV_beetroot
execute if entity @s[nbt={Inventory:[{id:"minecraft:nether_wart"}]}] run tag @s add HV_netherwart