# door particles



# oak door
# north south direction
execute as @e[tag=DD_portal,tag=DD_NS] at @s positioned ^ ^1.1 ^0.425 if block ~ ~ ~ minecraft:oak_door run particle minecraft:portal ~ ~ ~ 0.12 0.26 0.02 0.35 1 force
execute if score CONFIG$performance DimensionalDoors = BOOL$false DatapackManager as @e[tag=DD_portal,tag=DD_NS] at @s positioned ^ ^1.1 ^0.425 if block ~ ~ ~ minecraft:oak_door[open=true] run particle minecraft:portal ~ ~ ~ 0.12 0.26 0.02 0.7 2 normal

execute as @e[tag=DD_portal,tag=DD_NS] at @s positioned ^ ^1.7 ^0.425 if block ~ ~ ~ minecraft:oak_door[open=false] run particle minecraft:underwater ~ ~ ~ 0.12 0.11 0.02 0 10 force
execute if score CONFIG$performance DimensionalDoors = BOOL$false DatapackManager as @e[tag=DD_portal,tag=DD_NS] at @s positioned ^ ^1.7 ^0.425 if block ~ ~ ~ minecraft:oak_door[open=false] run particle minecraft:underwater ~ ~ ~ 0.12 0.11 0.02 0 20 normal

execute as @e[tag=DD_portal,tag=DD_NS] at @s positioned ^ ^1.1 ^0.425 if block ~ ~ ~ minecraft:oak_door[open=true] run particle minecraft:underwater ~ ~ ~ 0.12 0.26 0.02 0 50 force
execute if score CONFIG$performance DimensionalDoors = BOOL$false DatapackManager as @e[tag=DD_portal,tag=DD_NS] at @s positioned ^ ^1.1 ^0.425 if block ~ ~ ~ minecraft:oak_door[open=true] run particle minecraft:underwater ~ ~ ~ 0.12 0.26 0.02 0 100 normal


# east west direction
execute as @e[tag=DD_portal,tag=DD_EW] at @s positioned ^ ^1.1 ^0.425 if block ~ ~ ~ minecraft:oak_door run particle minecraft:portal ~ ~ ~ 0.02 0.26 0.12 0.35 1 force
execute if score CONFIG$performance DimensionalDoors = BOOL$false DatapackManager as @e[tag=DD_portal,tag=DD_EW] at @s positioned ^ ^1.1 ^0.425 if block ~ ~ ~ minecraft:oak_door[open=true] run particle minecraft:portal ~ ~ ~ 0.02 0.26 0.12 0.7 2 normal

execute as @e[tag=DD_portal,tag=DD_EW] at @s positioned ^ ^1.7 ^0.425 if block ~ ~ ~ minecraft:oak_door[open=false] run particle minecraft:underwater ~ ~ ~ 0.02 0.11 0.12 0 10 force
execute if score CONFIG$performance DimensionalDoors = BOOL$false DatapackManager as @e[tag=DD_portal,tag=DD_EW] at @s positioned ^ ^1.7 ^0.425 if block ~ ~ ~ minecraft:oak_door[open=false] run particle minecraft:underwater ~ ~ ~ 0.02 0.11 0.12 0 20 normal

execute as @e[tag=DD_portal,tag=DD_EW] at @s positioned ^ ^1.1 ^0.425 if block ~ ~ ~ minecraft:oak_door[open=true] run particle minecraft:underwater ~ ~ ~ 0.02 0.26 0.12 0 50 force
execute if score CONFIG$performance DimensionalDoors = BOOL$false DatapackManager as @e[tag=DD_portal,tag=DD_EW] at @s positioned ^ ^1.1 ^0.425 if block ~ ~ ~ minecraft:oak_door[open=true] run particle minecraft:underwater ~ ~ ~ 0.02 0.26 0.12 0 100 normal



# linking conduit particles
execute as @e[tag=DD_particleLink] at @s run particle minecraft:portal ~ ~0.5 ~ 0 0 0 0.1 1 force
execute if score CONFIG$performance DimensionalDoors = BOOL$false DatapackManager as @e[tag=DD_particleLink] at @s run particle minecraft:underwater ~ ~0.55 ~ 0.2 0.2 0.2 0 1 normal