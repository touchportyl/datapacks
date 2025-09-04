# feedback for tool breaking
playsound minecraft:entity.item.break block @a[distance=..16] ~ ~ ~ 0.7 1 0

# break particles
execute if entity @s[tag=HV_wood] run particle minecraft:item{"item":"minecraft:wooden_hoe"} ~ ~1.35 ~ 0 0 0 0.12 7 normal
execute if entity @s[tag=HV_gold] run particle minecraft:item{"item":"minecraft:golden_hoe"} ~ ~1.35 ~ 0 0 0 0.12 7 normal
execute if entity @s[tag=HV_stone] run particle minecraft:item{"item":"minecraft:stone_hoe"} ~ ~1.35 ~ 0 0 0 0.12 7 normal
execute if entity @s[tag=HV_iron] run particle minecraft:item{"item":"minecraft:iron_hoe"} ~ ~1.35 ~ 0 0 0 0.12 7 normal
execute if entity @s[tag=HV_diamond] run particle minecraft:item{"item":"minecraft:diamond_hoe"} ~ ~1.35 ~ 0 0 0 0.12 7 normal
execute if entity @s[tag=HV_netherite] run particle minecraft:item{"item":"minecraft:netherite_hoe"} ~ ~1.35 ~ 0 0 0 0.12 7 normal

# remove tool
item replace entity @s weapon.mainhand with minecraft:air

# clear tags
execute as @s at @s run function harvester:root/garbage_collection