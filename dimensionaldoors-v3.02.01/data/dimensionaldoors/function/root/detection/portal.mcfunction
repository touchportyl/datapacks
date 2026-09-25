# tag
execute as @e[tag=!DD_portal,distance=..0.3] unless score @s DD_warpcooldown matches 0.. run tag @s add DD_enter

# visualizer
# the particle lives in its own file: small_flame exists only from 1.17, and an unknown particle here
# dropped this whole function on 1.14 to 1.16, so no door ever teleported there
execute if entity @a[tag=DD_debug] run function dimensionaldoors:compatibility/debug/samplepoint

# success
execute as @e[tag=DD_enter] at @s run function dimensionaldoors:root/activation/main
