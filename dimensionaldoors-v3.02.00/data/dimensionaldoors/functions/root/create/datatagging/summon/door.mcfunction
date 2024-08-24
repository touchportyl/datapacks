# door type detection
# DD_close: activate door closer

# particle effects (when closed due to size of door window)
# A: full / B: half / C: one third / D: none

execute as @s at @s align xyz if block ~ ~ ~ minecraft:oak_door[open=true] run summon minecraft:area_effect_cloud ~0.5 ~ ~0.5 {Tags:["DimensionalDoors","DD_portal","DD_oak","DD_particle_C","DD_new","DD_close"],Rotation:[0f,0f],Age:-2147483648,Duration:-1,WaitTime:-2147483648}

execute as @s at @s align xyz if block ~ ~ ~ minecraft:spruce_door[open=true] run summon minecraft:area_effect_cloud ~0.5 ~ ~0.5 {Tags:["DimensionalDoors","DD_portal","DD_spruce","DD_particle_D","DD_new","DD_close"],Rotation:[0f,0f],Age:-2147483648,Duration:-1,WaitTime:-2147483648}

execute as @s at @s align xyz if block ~ ~ ~ minecraft:birch_door[open=true] run summon minecraft:area_effect_cloud ~0.5 ~ ~0.5 {Tags:["DimensionalDoors","DD_portal","DD_birch","DD_particle_D","DD_new","DD_close"],Rotation:[0f,0f],Age:-2147483648,Duration:-1,WaitTime:-2147483648}

execute as @s at @s align xyz if block ~ ~ ~ minecraft:jungle_door[open=true] run summon minecraft:area_effect_cloud ~0.5 ~ ~0.5 {Tags:["DimensionalDoors","DD_portal","DD_jungle","DD_particle_C","DD_new","DD_close"],Rotation:[0f,0f],Age:-2147483648,Duration:-1,WaitTime:-2147483648}

execute as @s at @s align xyz if block ~ ~ ~ minecraft:acacia_door[open=true] run summon minecraft:area_effect_cloud ~0.5 ~ ~0.5 {Tags:["DimensionalDoors","DD_portal","DD_acacia","DD_particle_A","DD_new","DD_close"],Rotation:[0f,0f],Age:-2147483648,Duration:-1,WaitTime:-2147483648}

execute as @s at @s align xyz if block ~ ~ ~ minecraft:dark_oak_door[open=true] run summon minecraft:area_effect_cloud ~0.5 ~ ~0.5 {Tags:["DimensionalDoors","DD_portal","DD_dark_oak","DD_particle_D","DD_new","DD_close"],Rotation:[0f,0f],Age:-2147483648,Duration:-1,WaitTime:-2147483648}

execute as @s at @s align xyz if block ~ ~ ~ minecraft:mangrove_door[open=true] run summon minecraft:area_effect_cloud ~0.5 ~ ~0.5 {Tags:["DimensionalDoors","DD_portal","DD_mangrove","DD_particle_D","DD_new","DD_close"],Rotation:[0f,0f],Age:-2147483648,Duration:-1,WaitTime:-2147483648}

execute as @s at @s align xyz if block ~ ~ ~ minecraft:cherry_door[open=true] run summon minecraft:area_effect_cloud ~0.5 ~ ~0.5 {Tags:["DimensionalDoors","DD_portal","DD_cherry","DD_particle_B","DD_new","DD_close"],Rotation:[0f,0f],Age:-2147483648,Duration:-1,WaitTime:-2147483648}

execute as @s at @s align xyz if block ~ ~ ~ minecraft:bamboo_door[open=true] run summon minecraft:area_effect_cloud ~0.5 ~ ~0.5 {Tags:["DimensionalDoors","DD_portal","DD_bamboo","DD_particle_B","DD_new","DD_close"],Rotation:[0f,0f],Age:-2147483648,Duration:-1,WaitTime:-2147483648}

execute as @s at @s align xyz if block ~ ~ ~ minecraft:crimson_door[open=true] run summon minecraft:area_effect_cloud ~0.5 ~ ~0.5 {Tags:["DimensionalDoors","DD_portal","DD_crimson","DD_particle_D","DD_new","DD_close"],Rotation:[0f,0f],Age:-2147483648,Duration:-1,WaitTime:-2147483648}

execute as @s at @s align xyz if block ~ ~ ~ minecraft:warped_door[open=true] run summon minecraft:area_effect_cloud ~0.5 ~ ~0.5 {Tags:["DimensionalDoors","DD_portal","DD_warped","DD_particle_D","DD_new","DD_close"],Rotation:[0f,0f],Age:-2147483648,Duration:-1,WaitTime:-2147483648}

execute as @s at @s align xyz if block ~ ~ ~ minecraft:iron_door[open=true] run summon minecraft:area_effect_cloud ~0.5 ~ ~0.5 {Tags:["DimensionalDoors","DD_portal","DD_iron","DD_particle_C","DD_new","DD_close"],Rotation:[0f,0f],Age:-2147483648,Duration:-1,WaitTime:-2147483648}
