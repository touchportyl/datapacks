# door closer mechanism

# tested on versions
# 1.16.2 / 1.19

# not working on
# 1.14.4 / 1.15.2

execute as @e[tag=DD_portal,tag=DD_close] at @s if block ~ ~ ~ minecraft:oak_door[open=true,facing=north,hinge=left] run setblock ~ ~ ~ oak_door[open=false,facing=north,hinge=left,half=lower] destroy
execute as @e[tag=DD_portal,tag=DD_close] at @s run setblock ~ ~1 ~ oak_door[open=false,facing=north,hinge=left,half=upper] replace

execute as @e[tag=DD_portal,tag=DD_close] at @s if block ~ ~ ~ minecraft:oak_door[open=true,facing=south,hinge=left] run setblock ~ ~ ~ oak_door[open=false,facing=south,hinge=left,half=lower] destroy
execute as @e[tag=DD_portal,tag=DD_close] at @s run setblock ~ ~1 ~ oak_door[open=false,facing=south,hinge=left,half=upper] replace

execute as @e[tag=DD_portal,tag=DD_close] at @s if block ~ ~ ~ minecraft:oak_door[open=true,facing=east,hinge=left] run setblock ~ ~ ~ oak_door[open=false,facing=east,hinge=left,half=lower] destroy
execute as @e[tag=DD_portal,tag=DD_close] at @s run setblock ~ ~1 ~ oak_door[open=false,facing=east,hinge=left,half=upper] replace

execute as @e[tag=DD_portal,tag=DD_close] at @s if block ~ ~ ~ minecraft:oak_door[open=true,facing=west,hinge=left] run setblock ~ ~ ~ oak_door[open=false,facing=west,hinge=left,half=lower] destroy
execute as @e[tag=DD_portal,tag=DD_close] at @s run setblock ~ ~1 ~ oak_door[open=false,facing=west,hinge=left,half=upper] replace


execute as @e[tag=DD_portal,tag=DD_close] at @s if block ~ ~ ~ minecraft:oak_door[open=true,facing=north,hinge=right] run setblock ~ ~ ~ oak_door[open=false,facing=north,hinge=right,half=lower] destroy
execute as @e[tag=DD_portal,tag=DD_close] at @s run setblock ~ ~1 ~ oak_door[open=false,facing=north,hinge=right,half=upper] replace

execute as @e[tag=DD_portal,tag=DD_close] at @s if block ~ ~ ~ minecraft:oak_door[open=true,facing=south,hinge=right] run setblock ~ ~ ~ oak_door[open=false,facing=south,hinge=right,half=lower] destroy
execute as @e[tag=DD_portal,tag=DD_close] at @s run setblock ~ ~1 ~ oak_door[open=false,facing=south,hinge=right,half=upper] replace

execute as @e[tag=DD_portal,tag=DD_close] at @s if block ~ ~ ~ minecraft:oak_door[open=true,facing=east,hinge=right] run setblock ~ ~ ~ oak_door[open=false,facing=east,hinge=right,half=lower] destroy
execute as @e[tag=DD_portal,tag=DD_close] at @s run setblock ~ ~1 ~ oak_door[open=false,facing=east,hinge=right,half=upper] replace

execute as @e[tag=DD_portal,tag=DD_close] at @s if block ~ ~ ~ minecraft:oak_door[open=true,facing=west,hinge=right] run setblock ~ ~ ~ oak_door[open=false,facing=west,hinge=right,half=lower] destroy
execute as @e[tag=DD_portal,tag=DD_close] at @s run setblock ~ ~1 ~ oak_door[open=false,facing=west,hinge=right,half=upper] replace

# kill door
execute as @e[tag=DD_portal,tag=DD_close] at @s run kill @e[type=minecraft:item,name="Oak Door",limit=1,sort=nearest,nbt={Age:0s}]
