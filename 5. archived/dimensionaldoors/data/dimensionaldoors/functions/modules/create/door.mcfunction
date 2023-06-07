#> -----------------------------------------------
#> Dimensional Doors Datapack
#> This code is protected by the GNU GPLv3 License
#> © 2020 Portyl Studios
#> https://portylstudios.com
#> -----------------------------------------------


#> door
# this creates an entrance with tags based on the door the conduit is in

say door
#> DoorID++
function dimensionaldoors:modules/id/iterate


# create entrance
execute if block ~ ~ ~ minecraft:oak_door[open=true,facing=north,hinge=left] run summon minecraft:area_effect_cloud ~ ~ ~ {Tags:["DimensionalDoors","DD_portal","DD_left","DD_NS","DD_new","DD_close"],Rotation:[0f,0f],Age:-2147483648,Duration:-1,WaitTime:-2147483648}
execute if block ~ ~ ~ minecraft:oak_door[open=true,facing=south,hinge=left] run summon minecraft:area_effect_cloud ~ ~ ~ {Tags:["DimensionalDoors","DD_portal","DD_left","DD_NS","DD_new","DD_close"],Rotation:[180f,0f],Age:-2147483648,Duration:-1,WaitTime:-2147483648}

execute if block ~ ~ ~ minecraft:oak_door[open=true,facing=east,hinge=left] run summon minecraft:area_effect_cloud ~ ~ ~ {Tags:["DimensionalDoors","DD_portal","DD_left","DD_EW","DD_new","DD_close"],Rotation:[90f,0f],Age:-2147483648,Duration:-1,WaitTime:-2147483648}
execute if block ~ ~ ~ minecraft:oak_door[open=true,facing=west,hinge=left] run summon minecraft:area_effect_cloud ~ ~ ~ {Tags:["DimensionalDoors","DD_portal","DD_left","DD_EW","DD_new","DD_close"],Rotation:[270f,0f],Age:-2147483648,Duration:-1,WaitTime:-2147483648}

execute if block ~ ~ ~ minecraft:oak_door[open=true,facing=north,hinge=right] run summon minecraft:area_effect_cloud ~ ~ ~ {Tags:["DimensionalDoors","DD_portal","DD_right","DD_NS","DD_new","DD_close"],Rotation:[0f,0f],Age:-2147483648,Duration:-1,WaitTime:-2147483648}
execute if block ~ ~ ~ minecraft:oak_door[open=true,facing=south,hinge=right] run summon minecraft:area_effect_cloud ~ ~ ~ {Tags:["DimensionalDoors","DD_portal","DD_right","DD_NS","DD_new","DD_close"],Rotation:[180f,0f],Age:-2147483648,Duration:-1,WaitTime:-2147483648}

execute if block ~ ~ ~ minecraft:oak_door[open=true,facing=east,hinge=right] run summon minecraft:area_effect_cloud ~ ~ ~ {Tags:["DimensionalDoors","DD_portal","DD_right","DD_EW","DD_new","DD_close"],Rotation:[90f,0f],Age:-2147483648,Duration:-1,WaitTime:-2147483648}
execute if block ~ ~ ~ minecraft:oak_door[open=true,facing=west,hinge=right] run summon minecraft:area_effect_cloud ~ ~ ~ {Tags:["DimensionalDoors","DD_portal","DD_right","DD_EW","DD_new","DD_close"],Rotation:[270f,0f],Age:-2147483648,Duration:-1,WaitTime:-2147483648}


# tag door entrance/exit
execute if entity @s[tag=!DD_linked] run tag @e[tag=DD_new,distance=..1,limit=1] add DD_entrance
execute if entity @s[tag=DD_linked] run tag @e[tag=DD_new,distance=..1,limit=1] add DD_exit

# generate door id
execute if entity @s[tag=!DD_linked] run scoreboard players operation @e[tag=DD_new,distance=..1,limit=1] DD_doorID = $d.doorID.current DD_doorID

# copy door id
execute if entity @s[tag=DD_linked] store result score @e[tag=DD_new,distance=..1,limit=1] DD_doorID run data get entity @e[nbt={Item:{tag:{DD_Linked:1b}}},limit=1,sort=nearest] Item.tag.DD_doorID


#> initialize new doors
execute as @e[tag=DD_new] at @s run function dimensionaldoors:modules/create/initialize


#> End of file
#> -----------
