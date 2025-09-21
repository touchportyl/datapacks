execute if block ~ ~ ~ minecraft:oxidized_copper_door[open=true,facing=north,hinge=left] run setblock ~ ~ ~ minecraft:oxidized_copper_door[open=false,facing=north,hinge=left,half=lower] destroy
setblock ~ ~1 ~ minecraft:oxidized_copper_door[open=false,facing=north,hinge=left,half=upper] replace

execute if block ~ ~ ~ minecraft:oxidized_copper_door[open=true,facing=south,hinge=left] run setblock ~ ~ ~ minecraft:oxidized_copper_door[open=false,facing=south,hinge=left,half=lower] destroy
setblock ~ ~1 ~ minecraft:oxidized_copper_door[open=false,facing=south,hinge=left,half=upper] replace

execute if block ~ ~ ~ minecraft:oxidized_copper_door[open=true,facing=east,hinge=left] run setblock ~ ~ ~ minecraft:oxidized_copper_door[open=false,facing=east,hinge=left,half=lower] destroy
setblock ~ ~1 ~ minecraft:oxidized_copper_door[open=false,facing=east,hinge=left,half=upper] replace

execute if block ~ ~ ~ minecraft:oxidized_copper_door[open=true,facing=west,hinge=left] run setblock ~ ~ ~ minecraft:oxidized_copper_door[open=false,facing=west,hinge=left,half=lower] destroy
setblock ~ ~1 ~ minecraft:oxidized_copper_door[open=false,facing=west,hinge=left,half=upper] replace


execute if block ~ ~ ~ minecraft:oxidized_copper_door[open=true,facing=north,hinge=right] run setblock ~ ~ ~ minecraft:oxidized_copper_door[open=false,facing=north,hinge=right,half=lower] destroy
setblock ~ ~1 ~ minecraft:oxidized_copper_door[open=false,facing=north,hinge=right,half=upper] replace

execute if block ~ ~ ~ minecraft:oxidized_copper_door[open=true,facing=south,hinge=right] run setblock ~ ~ ~ minecraft:oxidized_copper_door[open=false,facing=south,hinge=right,half=lower] destroy
setblock ~ ~1 ~ minecraft:oxidized_copper_door[open=false,facing=south,hinge=right,half=upper] replace

execute if block ~ ~ ~ minecraft:oxidized_copper_door[open=true,facing=east,hinge=right] run setblock ~ ~ ~ minecraft:oxidized_copper_door[open=false,facing=east,hinge=right,half=lower] destroy
setblock ~ ~1 ~ minecraft:oxidized_copper_door[open=false,facing=east,hinge=right,half=upper] replace

execute if block ~ ~ ~ minecraft:oxidized_copper_door[open=true,facing=west,hinge=right] run setblock ~ ~ ~ minecraft:oxidized_copper_door[open=false,facing=west,hinge=right,half=lower] destroy
setblock ~ ~1 ~ minecraft:oxidized_copper_door[open=false,facing=west,hinge=right,half=upper] replace

# kill door
kill @e[type=minecraft:item,name="Oxidized Copper Door",sort=nearest,limit=1,nbt={Age:0s}]