# half door

# north south direction

# minecraft:underwater
execute if entity @s[tag=DD_NS] positioned ^ ^1.55 ^0.425 run particle minecraft:underwater ~ ~ ~ 0.12 0.15 0.02 0 10 force

execute if score VERSION$minecraft.current DatapackManager matches 14..15 if entity @s[tag=DD_NS] positioned ^ ^1.55 ^0.425 run particle minecraft:underwater ~ ~ ~ 0.12 0.15 0.02 0 70 normal

execute if score CONFIG$performance DimensionalDoors = BOOL$false DatapackManager if entity @s[tag=DD_NS] positioned ^ ^1.55 ^0.425 run particle minecraft:underwater ~ ~ ~ 0.12 0.15 0.02 0 20 normal

# east west direction

# minecraft:underwater
execute if entity @s[tag=DD_EW] positioned ^ ^1.55 ^0.425 run particle minecraft:underwater ~ ~ ~ 0.02 0.15 0.12 0 10 force

execute if score VERSION$minecraft.current DatapackManager matches 14..15 if entity @s[tag=DD_EW] positioned ^ ^1.55 ^0.425 run particle minecraft:underwater ~ ~ ~ 0.02 0.15 0.12 0 70 normal

execute if score CONFIG$performance DimensionalDoors = BOOL$false DatapackManager if entity @s[tag=DD_EW] positioned ^ ^1.55 ^0.425 run particle minecraft:underwater ~ ~ ~ 0.02 0.15 0.12 0 20 normal