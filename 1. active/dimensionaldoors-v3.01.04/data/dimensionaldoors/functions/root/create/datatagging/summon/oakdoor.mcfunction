# todo: this can be improved when adding support for other doors
# make each tag detectable seperately
# door type / facing / hinge / rotation

execute as @s at @s align xyz if block ~ ~ ~ minecraft:oak_door[open=true,facing=north,hinge=left] run summon minecraft:area_effect_cloud ~0.5 ~ ~0.5 {Tags:["DimensionalDoors","DD_portal","DD_oak","DD_left","DD_NS","DD_new","DD_close"],Rotation:[0f,0f],Age:-2147483648,Duration:-1,WaitTime:-2147483648}
execute as @s at @s align xyz if block ~ ~ ~ minecraft:oak_door[open=true,facing=south,hinge=left] run summon minecraft:area_effect_cloud ~0.5 ~ ~0.5 {Tags:["DimensionalDoors","DD_portal","DD_oak","DD_left","DD_NS","DD_new","DD_close"],Rotation:[180f,0f],Age:-2147483648,Duration:-1,WaitTime:-2147483648}

execute as @s at @s align xyz if block ~ ~ ~ minecraft:oak_door[open=true,facing=east,hinge=left] run summon minecraft:area_effect_cloud ~0.5 ~ ~0.5 {Tags:["DimensionalDoors","DD_portal","DD_oak","DD_left","DD_EW","DD_new","DD_close"],Rotation:[90f,0f],Age:-2147483648,Duration:-1,WaitTime:-2147483648}
execute as @s at @s align xyz if block ~ ~ ~ minecraft:oak_door[open=true,facing=west,hinge=left] run summon minecraft:area_effect_cloud ~0.5 ~ ~0.5 {Tags:["DimensionalDoors","DD_portal","DD_oak","DD_left","DD_EW","DD_new","DD_close"],Rotation:[270f,0f],Age:-2147483648,Duration:-1,WaitTime:-2147483648}

execute as @s at @s align xyz if block ~ ~ ~ minecraft:oak_door[open=true,facing=north,hinge=right] run summon minecraft:area_effect_cloud ~0.5 ~ ~0.5 {Tags:["DimensionalDoors","DD_portal","DD_oak","DD_right","DD_NS","DD_new","DD_close"],Rotation:[0f,0f],Age:-2147483648,Duration:-1,WaitTime:-2147483648}
execute as @s at @s align xyz if block ~ ~ ~ minecraft:oak_door[open=true,facing=south,hinge=right] run summon minecraft:area_effect_cloud ~0.5 ~ ~0.5 {Tags:["DimensionalDoors","DD_portal","DD_oak","DD_right","DD_NS","DD_new","DD_close"],Rotation:[180f,0f],Age:-2147483648,Duration:-1,WaitTime:-2147483648}

execute as @s at @s align xyz if block ~ ~ ~ minecraft:oak_door[open=true,facing=east,hinge=right] run summon minecraft:area_effect_cloud ~0.5 ~ ~0.5 {Tags:["DimensionalDoors","DD_portal","DD_oak","DD_right","DD_EW","DD_new","DD_close"],Rotation:[90f,0f],Age:-2147483648,Duration:-1,WaitTime:-2147483648}
execute as @s at @s align xyz if block ~ ~ ~ minecraft:oak_door[open=true,facing=west,hinge=right] run summon minecraft:area_effect_cloud ~0.5 ~ ~0.5 {Tags:["DimensionalDoors","DD_portal","DD_oak","DD_right","DD_EW","DD_new","DD_close"],Rotation:[270f,0f],Age:-2147483648,Duration:-1,WaitTime:-2147483648}