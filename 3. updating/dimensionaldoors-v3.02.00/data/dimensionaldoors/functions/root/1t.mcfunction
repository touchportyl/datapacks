# effect range = 32
execute if score CONFIG$disableparticles DimensionalDoors = BOOL$false DatapackManager as @e[tag=DD_portal] at @s if entity @a[distance=..32] run function dimensionaldoors:effects/ambience/door

execute as @e[tag=DD_particleLink] at @s run function dimensionaldoors:effects/ambience/linkedconduit


# check for destroyed doors
function dimensionaldoors:root/destroy/filter

# check for warping entities
# only check if a player is close enough to an open door
execute at @e[tag=DD_portal] if block ~ ~ ~ #minecraft:doors[open=true] if entity @a[distance=..7] run function dimensionaldoors:root/detection/positioner

# close door
execute as @e[tag=DD_portal,tag=DD_close] at @s run function dimensionaldoors:root/closermechanism/main

# reset timers for closed doors
execute as @e[tag=DD_portal] at @s if block ~ ~ ~ #minecraft:doors[open=false] run scoreboard players reset @s DimensionalDoors


# loop
schedule function dimensionaldoors:root/1t 1t