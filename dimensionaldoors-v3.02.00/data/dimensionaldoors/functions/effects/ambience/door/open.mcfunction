# open door

# north south direction

# minecraft:portal
execute if score CONFIG$performance DimensionalDoors = BOOL$false DatapackManager if entity @s[tag=DD_NS] run particle minecraft:portal ~ ~ ~ 0.12 0.26 0.02 0.7 2 normal


# minecraft:underwater
execute if entity @s[tag=DD_NS] run particle minecraft:underwater ~ ~ ~ 0.12 0.26 0.02 0 50 force

execute if score VERSION$minecraft.current DatapackManager matches 14..15 if entity @s[tag=DD_NS] run particle minecraft:underwater ~ ~ ~ 0.12 0.26 0.02 0 300 normal

execute if score CONFIG$performance DimensionalDoors = BOOL$false DatapackManager if entity @s[tag=DD_NS] run particle minecraft:underwater ~ ~ ~ 0.12 0.26 0.02 0 100 normal


# east west direction

# minecraft:portal
execute if score CONFIG$performance DimensionalDoors = BOOL$false DatapackManager if entity @s[tag=DD_EW] run particle minecraft:portal ~ ~ ~ 0.02 0.26 0.12 0.7 2 normal


# minecraft:underwater
execute if entity @s[tag=DD_EW] run particle minecraft:underwater ~ ~ ~ 0.02 0.26 0.12 0 50 force

execute if score VERSION$minecraft.current DatapackManager matches 14..15 if entity @s[tag=DD_EW] run particle minecraft:underwater ~ ~ ~ 0.02 0.26 0.12 0 300 normal

execute if score CONFIG$performance DimensionalDoors = BOOL$false DatapackManager if entity @s[tag=DD_EW] run particle minecraft:underwater ~ ~ ~ 0.02 0.26 0.12 0 100 normal