# checks for tool and runs item modify
# for version 1.17+ only

# @todo: add additional rng for "unbreaking" and "unbreakable" enchants/tags

execute if entity @s[tag=HV_wood] run item modify entity @s weapon.mainhand harvester:damage_wood
execute if entity @s[tag=HV_stone] run item modify entity @s weapon.mainhand harvester:damage_stone
execute if entity @s[tag=HV_gold] run item modify entity @s weapon.mainhand harvester:damage_gold
execute if entity @s[tag=HV_iron] run item modify entity @s weapon.mainhand harvester:damage_iron
execute if entity @s[tag=HV_diamond] run item modify entity @s weapon.mainhand harvester:damage_diamond
execute if entity @s[tag=HV_netherite] run item modify entity @s weapon.mainhand harvester:damage_netherite
