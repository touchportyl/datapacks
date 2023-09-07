# ambient door particles

# this code only runs if there is a player within 32 blocks of a door
# 32 blocks is the particle render limit, but using "force" causes it to render from further away, so a manual check makes it more performant

# particles are all additive
# if you're in 1.15, the 1.15 particles will be displayed together with the baseline particles

# baseline particles (forced to display)
# minecraft:portal -> always active, 1 particle per tick
# minecraft:underwater -> when closed, 10 particles per tick
# minecraft:underwater -> when open, 50 particles per tick

# for version 1.14 - 1.15, underwater particles disappear nearly instantly in these versions, so more can be spawned without lagging
# minecraft:underwater -> when closed, +70 particles per tick
# minecraft:underwater -> when open, +300 particles per tick

# CONFIG$performance changes (automatically disabled when particles is set to minimal in Minecraft settings)
# minecraft:portal -> when open, +2 particles per tick
# minecraft:underwater -> when closed, +20 particles per tick
# minecraft:underwater -> when open, +100 particles per tick



# oak door

# north south direction

# minecraft:portal
execute as @e[tag=DD_portal,tag=DD_NS] at @s positioned ^ ^1.1 ^0.425 if block ~ ~ ~ minecraft:oak_door run particle minecraft:portal ~ ~ ~ 0.12 0.26 0.02 0.35 1 force

execute if score CONFIG$performance DimensionalDoors = BOOL$false DatapackManager as @e[tag=DD_portal,tag=DD_NS] at @s positioned ^ ^1.1 ^0.425 if block ~ ~ ~ minecraft:oak_door[open=true] run particle minecraft:portal ~ ~ ~ 0.12 0.26 0.02 0.7 2 normal


# minecraft:underwater
execute as @e[tag=DD_portal,tag=DD_NS] at @s positioned ^ ^1.7 ^0.425 if block ~ ~ ~ minecraft:oak_door[open=false] run particle minecraft:underwater ~ ~ ~ 0.12 0.11 0.02 0 10 force

execute if score VERSION$minecraft.current DatapackManager matches 14..15 as @e[tag=DD_portal,tag=DD_NS] at @s positioned ^ ^1.7 ^0.425 if block ~ ~ ~ minecraft:oak_door[open=false] run particle minecraft:underwater ~ ~ ~ 0.12 0.11 0.02 0 70 normal

execute if score CONFIG$performance DimensionalDoors = BOOL$false DatapackManager as @e[tag=DD_portal,tag=DD_NS] at @s positioned ^ ^1.7 ^0.425 if block ~ ~ ~ minecraft:oak_door[open=false] run particle minecraft:underwater ~ ~ ~ 0.12 0.11 0.02 0 20 normal


# minecraft:underwater
execute as @e[tag=DD_portal,tag=DD_NS] at @s positioned ^ ^1.1 ^0.425 if block ~ ~ ~ minecraft:oak_door[open=true] run particle minecraft:underwater ~ ~ ~ 0.12 0.26 0.02 0 50 force

execute if score VERSION$minecraft.current DatapackManager matches 14..15 as @e[tag=DD_portal,tag=DD_NS] at @s positioned ^ ^1.1 ^0.425 if block ~ ~ ~ minecraft:oak_door[open=true] run particle minecraft:underwater ~ ~ ~ 0.12 0.26 0.02 0 300 normal

execute if score CONFIG$performance DimensionalDoors = BOOL$false DatapackManager as @e[tag=DD_portal,tag=DD_NS] at @s positioned ^ ^1.1 ^0.425 if block ~ ~ ~ minecraft:oak_door[open=true] run particle minecraft:underwater ~ ~ ~ 0.12 0.26 0.02 0 100 normal


# east west direction

# minecraft:portal
execute as @e[tag=DD_portal,tag=DD_EW] at @s positioned ^ ^1.1 ^0.425 if block ~ ~ ~ minecraft:oak_door run particle minecraft:portal ~ ~ ~ 0.02 0.26 0.12 0.35 1 force

execute if score CONFIG$performance DimensionalDoors = BOOL$false DatapackManager as @e[tag=DD_portal,tag=DD_EW] at @s positioned ^ ^1.1 ^0.425 if block ~ ~ ~ minecraft:oak_door[open=true] run particle minecraft:portal ~ ~ ~ 0.02 0.26 0.12 0.7 2 normal


# minecraft:underwater
execute as @e[tag=DD_portal,tag=DD_EW] at @s positioned ^ ^1.7 ^0.425 if block ~ ~ ~ minecraft:oak_door[open=false] run particle minecraft:underwater ~ ~ ~ 0.02 0.11 0.12 0 10 force

execute if score VERSION$minecraft.current DatapackManager matches 14..15 as @e[tag=DD_portal,tag=DD_EW] at @s positioned ^ ^1.7 ^0.425 if block ~ ~ ~ minecraft:oak_door[open=false] run particle minecraft:underwater ~ ~ ~ 0.02 0.11 0.12 0 70 normal

execute if score CONFIG$performance DimensionalDoors = BOOL$false DatapackManager as @e[tag=DD_portal,tag=DD_EW] at @s positioned ^ ^1.7 ^0.425 if block ~ ~ ~ minecraft:oak_door[open=false] run particle minecraft:underwater ~ ~ ~ 0.02 0.11 0.12 0 20 normal


# minecraft:underwater
execute as @e[tag=DD_portal,tag=DD_EW] at @s positioned ^ ^1.1 ^0.425 if block ~ ~ ~ minecraft:oak_door[open=true] run particle minecraft:underwater ~ ~ ~ 0.02 0.26 0.12 0 50 force

execute if score VERSION$minecraft.current DatapackManager matches 14..15 as @e[tag=DD_portal,tag=DD_EW] at @s positioned ^ ^1.1 ^0.425 if block ~ ~ ~ minecraft:oak_door[open=true] run particle minecraft:underwater ~ ~ ~ 0.02 0.26 0.12 0 300 normal

execute if score CONFIG$performance DimensionalDoors = BOOL$false DatapackManager as @e[tag=DD_portal,tag=DD_EW] at @s positioned ^ ^1.1 ^0.425 if block ~ ~ ~ minecraft:oak_door[open=true] run particle minecraft:underwater ~ ~ ~ 0.02 0.26 0.12 0 100 normal