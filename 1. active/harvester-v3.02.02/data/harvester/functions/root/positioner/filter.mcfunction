# this filters positioners by tag

# due to farmland being slightly shorter than full blocks
# if the player stands on a full block, the lower layer is checked


execute if entity @s[tag=HV_1x1] if block ~ ~ ~ minecraft:farmland run function harvester:root/positioner/1x1

execute if entity @s[tag=HV_3x3_star] if block ~ ~ ~ minecraft:farmland run function harvester:root/positioner/3x3_star
execute if entity @s[tag=HV_3x3_star] unless block ~ ~ ~ minecraft:farmland positioned ~ ~-1 ~ run function harvester:root/positioner/3x3_star

execute if entity @s[tag=HV_3x3] if block ~ ~ ~ minecraft:farmland run function harvester:root/positioner/3x3
execute if entity @s[tag=HV_3x3] unless block ~ ~ ~ minecraft:farmland positioned ~ ~-1 ~ run function harvester:root/positioner/3x3

execute if entity @s[tag=HV_5x5_star] if block ~ ~ ~ minecraft:farmland run function harvester:root/positioner/5x5_star
execute if entity @s[tag=HV_5x5_star] unless block ~ ~ ~ minecraft:farmland positioned ~ ~-1 ~ run function harvester:root/positioner/5x5_star

execute if entity @s[tag=HV_5x5] if block ~ ~ ~ minecraft:farmland run function harvester:root/positioner/5x5
execute if entity @s[tag=HV_5x5] unless block ~ ~ ~ minecraft:farmland positioned ~ ~-1 ~ run function harvester:root/positioner/5x5