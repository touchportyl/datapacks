# this filters positioners by tag


execute if entity @s[tag=HV_1x1,x_rotation=0..90] if block ~ ~ ~ minecraft:farmland run function harvester:root/positioner/1x1
execute if entity @s[tag=HV_1x1,x_rotation=0..90] unless block ~ ~ ~ minecraft:farmland positioned ~ ~-1 ~ run function harvester:root/positioner/1x1

execute if entity @s[tag=HV_3x3_star,x_rotation=0..90] if block ~ ~ ~ minecraft:farmland run function harvester:root/positioner/3x3_star
execute if entity @s[tag=HV_3x3_star,x_rotation=0..90] unless block ~ ~ ~ minecraft:farmland positioned ~ ~-1 ~ run function harvester:root/positioner/3x3_star

execute if entity @s[tag=HV_3x3,x_rotation=0..90] if block ~ ~ ~ minecraft:farmland run function harvester:root/positioner/3x3
execute if entity @s[tag=HV_3x3,x_rotation=0..90] unless block ~ ~ ~ minecraft:farmland positioned ~ ~-1 ~ run function harvester:root/positioner/3x3

execute if entity @s[tag=HV_3x3_netherwart,x_rotation=0..90] if block ~ ~ ~ minecraft:farmland run function harvester:root/positioner/3x3
execute if entity @s[tag=HV_3x3_netherwart,x_rotation=0..90] unless block ~ ~ ~ minecraft:farmland positioned ~ ~-1 ~ run function harvester:root/positioner/3x3
