#> -----------------------------------------------
#> Dimensional Doors Datapack
#> This code is protected by the GNU GPLv3 License
#> © 2020 Portyl Studios
#> https://portylstudios.com
#> -----------------------------------------------


#> closer
# this code closes a door


# door closer mechanism (tested for 1.15.2)
# needs more testing in lower versions

execute if block ~ ~ ~ minecraft:oak_door[open=true,facing=north,hinge=left] run setblock ~ ~ ~ minecraft:oak_door[open=false,facing=north,hinge=left] replace
execute if block ~ ~ ~ minecraft:oak_door[open=true,facing=south,hinge=left] run setblock ~ ~ ~ minecraft:oak_door[open=false,facing=south,hinge=left] replace
execute if block ~ ~ ~ minecraft:oak_door[open=true,facing=east,hinge=left] run setblock ~ ~ ~ minecraft:oak_door[open=false,facing=east,hinge=left] replace
execute if block ~ ~ ~ minecraft:oak_door[open=true,facing=west,hinge=left] run setblock ~ ~ ~ minecraft:oak_door[open=false,facing=west,hinge=left] replace

execute if block ~ ~ ~ minecraft:oak_door[open=true,facing=north,hinge=right] run setblock ~ ~ ~ minecraft:oak_door[open=false,facing=north,hinge=right] replace
execute if block ~ ~ ~ minecraft:oak_door[open=true,facing=south,hinge=right] run setblock ~ ~ ~ minecraft:oak_door[open=false,facing=south,hinge=right] replace
execute if block ~ ~ ~ minecraft:oak_door[open=true,facing=east,hinge=right] run setblock ~ ~ ~ minecraft:oak_door[open=false,facing=east,hinge=right] replace
execute if block ~ ~ ~ minecraft:oak_door[open=true,facing=west,hinge=right] run setblock ~ ~ ~ minecraft:oak_door[open=false,facing=west,hinge=right] replace


# door closing sound
playsound minecraft:block.wooden_door.close block @a ~ ~ ~ 1 1 0

# remove tag
tag @s remove DD_close


#> End of file
#> -----------
