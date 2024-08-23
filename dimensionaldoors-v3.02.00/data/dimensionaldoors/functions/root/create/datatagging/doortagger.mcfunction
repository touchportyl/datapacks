# door data tagger
# rotation / facing / hinge

#data modify entity @s Rotation[0] set value 2.f
execute if block ~ ~ ~ #minecraft:doors[facing=north] run data modify entity @s Rotation[0] set value 0.f
execute if block ~ ~ ~ #minecraft:doors[facing=south] run data modify entity @s Rotation[0] set value 180.f
execute if block ~ ~ ~ #minecraft:doors[facing=east] run data modify entity @s Rotation[0] set value 90.f
execute if block ~ ~ ~ #minecraft:doors[facing=west] run data modify entity @s Rotation[0] set value 270.f

execute if block ~ ~ ~ #minecraft:doors[facing=north] run tp @s ~ ~ ~ 0 0
execute if block ~ ~ ~ #minecraft:doors[facing=south] run tp @s ~ ~ ~ 180 0
execute if block ~ ~ ~ #minecraft:doors[facing=east] run tp @s ~ ~ ~ 90 0
execute if block ~ ~ ~ #minecraft:doors[facing=west] run tp @s ~ ~ ~ 270 0

execute if block ~ ~ ~ #minecraft:doors[facing=north] run tag @s add DD_NS
execute if block ~ ~ ~ #minecraft:doors[facing=south] run tag @s add DD_NS
execute if block ~ ~ ~ #minecraft:doors[facing=east] run tag @s add DD_EW
execute if block ~ ~ ~ #minecraft:doors[facing=west] run tag @s add DD_EW

execute if block ~ ~ ~ #minecraft:doors[hinge=left] run tag @s add DD_left
execute if block ~ ~ ~ #minecraft:doors[hinge=right] run tag @s add DD_right
