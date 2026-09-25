# 1.21.4 pale oak door (Winter Drop)
# kept apart from 1.21: an unknown block id drops the whole file, which disabled copper doors on 1.21 to 1.21.3

execute as @s at @s align xyz if block ~ ~ ~ minecraft:pale_oak_door run summon minecraft:armor_stand ~0.5 ~ ~0.5 {Tags:["DimensionalDoors","DD_portal","DD_pale_oak","DD_particle_D","DD_new","DD_close"],Rotation:[0f,0f],Marker:1b,Invisible:1b}
