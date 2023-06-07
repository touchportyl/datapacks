tellraw @a[tag=dd_debug] [{"text":"DD","color":"light_purple"},{"text":" > root/closermechanism/v1/oakdoor.mcfunction","color":"gray"}]

# door closer mechanism

# tested on versions
# 1.14.4 / 1.15.2

# not working on
# 1.16.2 / 1.19

execute at @s if block ~ ~ ~ minecraft:oak_door[open=true,facing=north,hinge=left] run setblock ~ ~ ~ minecraft:oak_door[open=false,facing=north,hinge=left] replace
execute at @s if block ~ ~ ~ minecraft:oak_door[open=true,facing=south,hinge=left] run setblock ~ ~ ~ minecraft:oak_door[open=false,facing=south,hinge=left] replace
execute at @s if block ~ ~ ~ minecraft:oak_door[open=true,facing=east,hinge=left] run setblock ~ ~ ~ minecraft:oak_door[open=false,facing=east,hinge=left] replace
execute at @s if block ~ ~ ~ minecraft:oak_door[open=true,facing=west,hinge=left] run setblock ~ ~ ~ minecraft:oak_door[open=false,facing=west,hinge=left] replace

execute at @s if block ~ ~ ~ minecraft:oak_door[open=true,facing=north,hinge=right] run setblock ~ ~ ~ minecraft:oak_door[open=false,facing=north,hinge=right] replace
execute at @s if block ~ ~ ~ minecraft:oak_door[open=true,facing=south,hinge=right] run setblock ~ ~ ~ minecraft:oak_door[open=false,facing=south,hinge=right] replace
execute at @s if block ~ ~ ~ minecraft:oak_door[open=true,facing=east,hinge=right] run setblock ~ ~ ~ minecraft:oak_door[open=false,facing=east,hinge=right] replace
execute at @s if block ~ ~ ~ minecraft:oak_door[open=true,facing=west,hinge=right] run setblock ~ ~ ~ minecraft:oak_door[open=false,facing=west,hinge=right] replace