execute at @s if block ~ ~ ~ minecraft:warped_door[open=true,facing=north,hinge=left] run setblock ~ ~ ~ minecraft:warped_door[open=false,facing=north,hinge=left] replace
execute at @s if block ~ ~ ~ minecraft:warped_door[open=true,facing=south,hinge=left] run setblock ~ ~ ~ minecraft:warped_door[open=false,facing=south,hinge=left] replace
execute at @s if block ~ ~ ~ minecraft:warped_door[open=true,facing=east,hinge=left] run setblock ~ ~ ~ minecraft:warped_door[open=false,facing=east,hinge=left] replace
execute at @s if block ~ ~ ~ minecraft:warped_door[open=true,facing=west,hinge=left] run setblock ~ ~ ~ minecraft:warped_door[open=false,facing=west,hinge=left] replace

execute at @s if block ~ ~ ~ minecraft:warped_door[open=true,facing=north,hinge=right] run setblock ~ ~ ~ minecraft:warped_door[open=false,facing=north,hinge=right] replace
execute at @s if block ~ ~ ~ minecraft:warped_door[open=true,facing=south,hinge=right] run setblock ~ ~ ~ minecraft:warped_door[open=false,facing=south,hinge=right] replace
execute at @s if block ~ ~ ~ minecraft:warped_door[open=true,facing=east,hinge=right] run setblock ~ ~ ~ minecraft:warped_door[open=false,facing=east,hinge=right] replace
execute at @s if block ~ ~ ~ minecraft:warped_door[open=true,facing=west,hinge=right] run setblock ~ ~ ~ minecraft:warped_door[open=false,facing=west,hinge=right] replace