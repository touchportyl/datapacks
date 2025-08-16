# main game loop


# effect range = 32
execute if score CONFIG$disableparticles DimensionalDoors = BOOL$false DatapackManager as @e[tag=DD_portal] at @s if entity @a[distance=..32] run function dimensionaldoors:effects/ambience/door

execute as @e[tag=DD_particleLink] at @s run function dimensionaldoors:effects/ambience/linkedconduit


# check for destroyed doors
function dimensionaldoors:root/destroy/filter

# check for warping entities
# only check if an entity is close enough to an open door
execute as @e[tag=DD_portal] at @s if block ~ ~ ~ #minecraft:doors[open=true] if entity @e[tag=!DD_portal,distance=..3] run function dimensionaldoors:root/detection/positioner

# close door
execute as @e[tag=DD_portal,tag=DD_close] at @s run function dimensionaldoors:root/closermechanism/main

# reset timers for closed doors
execute as @e[tag=DD_portal] at @s if block ~ ~ ~ #minecraft:doors[open=false] run scoreboard players reset @s DimensionalDoors


# loop
execute if score LOOP$main.isActive DimensionalDoors = BOOL$true DatapackManager run schedule function dimensionaldoors:root/loops/main 1t