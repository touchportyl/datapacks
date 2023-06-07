# linked conduit particles

particle minecraft:portal ~ ~0.5 ~ 0 0 0 0.1 1 force

execute if score VERSION$minecraft.current DatapackManager matches 14..15 run particle minecraft:underwater ~ ~0.55 ~ 0.2 0.2 0.2 0 10 normal

execute if score CONFIG$performance DimensionalDoors = BOOL$false DatapackManager run particle minecraft:underwater ~ ~0.55 ~ 0.2 0.2 0.2 0 1 normal