# remove gold radar entities that are too far from players
tag @e[tag=RE_goldradar] add RE_goldradar_destroy
execute in minecraft:the_nether positioned 0 0 0 as @a[distance=0..] at @s run tag @e[tag=RE_goldradar,distance=..8] remove RE_goldradar_destroy

# remove gold radar entities that aren't in a gold block
execute as @e[tag=RE_goldradar] at @s unless block ~ ~ ~ minecraft:gold_block run tag @s add RE_goldradar_destroy

# despawn all tagged gold radar entities
execute as @e[tag=RE_goldradar_destroy] at @s run function racetotheend:goldradar/despawn

# only run the positioner for players in the nether
# the positioner is generated using a python script
execute in minecraft:the_nether positioned 0 0 0 as @a[distance=0..] at @s align xyz run function racetotheend:goldradar/positioner