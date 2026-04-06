#> -----------------------------------------------
#> Dimensional Doors Datapack
#> This code is protected by the GNU GPLv3 License
#> © 2020 Portyl Studios
#> https://portylstudios.com
#> -----------------------------------------------


#> closer
# this code closes a door


# door closer mechanism (tested for 1.16-rc1 - 1.16.3)

execute if block ~ ~ ~ minecraft:oak_door[open=true,facing=north,hinge=left] run setblock ~ ~ ~ oak_door[open=false,facing=north,hinge=left,half=lower] destroy
setblock ~ ~1 ~ oak_door[open=false,facing=north,hinge=left,half=upper] replace

execute if block ~ ~ ~ minecraft:oak_door[open=true,facing=south,hinge=left] run setblock ~ ~ ~ oak_door[open=false,facing=south,hinge=left,half=lower] destroy
setblock ~ ~1 ~ oak_door[open=false,facing=south,hinge=left,half=upper] replace

execute if block ~ ~ ~ minecraft:oak_door[open=true,facing=east,hinge=left] run setblock ~ ~ ~ oak_door[open=false,facing=east,hinge=left,half=lower] destroy
setblock ~ ~1 ~ oak_door[open=false,facing=east,hinge=left,half=upper] replace

execute if block ~ ~ ~ minecraft:oak_door[open=true,facing=west,hinge=left] run setblock ~ ~ ~ oak_door[open=false,facing=west,hinge=left,half=lower] destroy
setblock ~ ~1 ~ oak_door[open=false,facing=west,hinge=left,half=upper] replace


execute if block ~ ~ ~ minecraft:oak_door[open=true,facing=north,hinge=right] run setblock ~ ~ ~ oak_door[open=false,facing=north,hinge=right,half=lower] destroy
setblock ~ ~1 ~ oak_door[open=false,facing=north,hinge=right,half=upper] replace

execute if block ~ ~ ~ minecraft:oak_door[open=true,facing=south,hinge=right] run setblock ~ ~ ~ oak_door[open=false,facing=south,hinge=right,half=lower] destroy
setblock ~ ~1 ~ oak_door[open=false,facing=south,hinge=right,half=upper] replace

execute if block ~ ~ ~ minecraft:oak_door[open=true,facing=east,hinge=right] run setblock ~ ~ ~ oak_door[open=false,facing=east,hinge=right,half=lower] destroy
setblock ~ ~1 ~ oak_door[open=false,facing=east,hinge=right,half=upper] replace

execute if block ~ ~ ~ minecraft:oak_door[open=true,facing=west,hinge=right] run setblock ~ ~ ~ oak_door[open=false,facing=west,hinge=right,half=lower] destroy
setblock ~ ~1 ~ oak_door[open=false,facing=west,hinge=right,half=upper] replace

# kill door
kill @e[type=minecraft:item,name="Oak Door",limit=1,sort=nearest,nbt={Age:0s}]

# door closing sound
playsound minecraft:block.wooden_door.close block @a ~ ~ ~ 1 1 0

# remove tag
tag @s remove DD_close


#> End of file
#> -----------
