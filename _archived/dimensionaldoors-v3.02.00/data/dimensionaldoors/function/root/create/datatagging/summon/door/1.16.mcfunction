# 1.16

execute as @s at @s align xyz if block ~ ~ ~ minecraft:crimson_door[open=true] run summon minecraft:area_effect_cloud ~0.5 ~ ~0.5 {Tags:["DimensionalDoors","DD_portal","DD_crimson","DD_particle_D","DD_new","DD_close"],Rotation:[0f,0f],Age:-2147483648,Duration:-1,WaitTime:-2147483648}

execute as @s at @s align xyz if block ~ ~ ~ minecraft:warped_door[open=true] run summon minecraft:area_effect_cloud ~0.5 ~ ~0.5 {Tags:["DimensionalDoors","DD_portal","DD_warped","DD_particle_D","DD_new","DD_close"],Rotation:[0f,0f],Age:-2147483648,Duration:-1,WaitTime:-2147483648}