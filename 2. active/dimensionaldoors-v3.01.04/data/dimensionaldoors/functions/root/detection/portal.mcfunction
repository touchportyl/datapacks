# tag
tag @e[tag=!DD_portal,distance=..0.3] add DD_enter

# visualizer
execute if entity @a[tag=dd_debug] run particle minecraft:small_flame ~ ~ ~ 0 0 0 0 1 force

# success
execute as @e[tag=DD_enter] at @s run function dimensionaldoors:root/activation/main