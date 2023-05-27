# this code assigns tags based on the player's selected items


execute if entity @s[nbt={SelectedItem:{id:"minecraft:wooden_hoe"}}] run tag @s add HV_wood
execute if entity @s[nbt={SelectedItem:{id:"minecraft:stone_hoe"}}] run tag @s add HV_stone

execute if entity @s[nbt={SelectedItem:{id:"minecraft:golden_hoe"}}] run tag @s add HV_gold
execute if entity @s[nbt={SelectedItem:{id:"minecraft:iron_hoe"}}] run tag @s add HV_iron

execute if entity @s[nbt={SelectedItem:{id:"minecraft:diamond_hoe"}}] run tag @s add HV_diamond

execute if entity @s[nbt={SelectedItem:{id:"minecraft:netherite_hoe"}}] run tag @s add HV_netherite

# success
tag @a[tag=HV_wood] add HV_isHoldingHoe
tag @a[tag=HV_stone] add HV_isHoldingHoe
tag @a[tag=HV_gold] add HV_isHoldingHoe
tag @a[tag=HV_iron] add HV_isHoldingHoe
tag @a[tag=HV_diamond] add HV_isHoldingHoe
tag @a[tag=HV_netherite] add HV_isHoldingHoe