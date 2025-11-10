# ambient door particles

# this code only runs if there is a player within 32 blocks of a door
# 32 blocks is the particle render limit, but using "force" causes it to render from further away, so a manual check makes it more performant

# particles are all additive
# if you're in 1.15, the 1.15 particles will be displayed together with the baseline particles

# baseline particles (forced to display)
# minecraft:portal -> always active, 1 particle per tick
# minecraft:underwater -> when closed, 10 particles per tick
# minecraft:underwater -> when open, 50 particles per tick

# for version 1.14 - 1.15, underwater particles disappear nearly instantly in these versions, so more can be spawned without lagging
# minecraft:underwater -> when closed, +70 particles per tick
# minecraft:underwater -> when open, +300 particles per tick

# CONFIG$performance changes (automatically disabled when particles is set to minimal in Minecraft settings)
# minecraft:portal -> when open, +2 particles per tick
# minecraft:underwater -> when closed, +20 particles per tick
# minecraft:underwater -> when open, +100 particles per tick

# particle a, b, c, and d are for the different types of closed doors, based on how much is shown through the door window
# a - full door
# b - half door
# c - 1/3 door
# d - no effect


# ambient particles
execute if entity @s[tag=DD_NS] positioned ^ ^1.1 ^0.425 run particle minecraft:portal ~ ~ ~ 0.12 0.26 0.02 0.35 1 force
execute if entity @s[tag=DD_EW] positioned ^ ^1.1 ^0.425 run particle minecraft:portal ~ ~ ~ 0.02 0.26 0.12 0.35 1 force

# open door
execute positioned ^ ^1.1 ^0.425 if block ~ ~ ~ #minecraft:doors[open=true] run function dimensionaldoors:effects/ambience/door/open

# closed door
execute if block ~ ~ ~ #minecraft:doors[open=false] if entity @s[tag=DD_particle_A] run function dimensionaldoors:effects/ambience/door/a
execute if block ~ ~ ~ #minecraft:doors[open=false] if entity @s[tag=DD_particle_B] run function dimensionaldoors:effects/ambience/door/b
execute if block ~ ~ ~ #minecraft:doors[open=false] if entity @s[tag=DD_particle_C] run function dimensionaldoors:effects/ambience/door/c