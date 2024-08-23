# stop loops
schedule clear dimensionaldoors:root/1s
schedule clear dimensionaldoors:root/1t

# replace named conduit
execute as @e[type=minecraft:item,name="Conduit",nbt={Item:{tag:{DD_Linked:1b}}}] at @s run summon minecraft:item ~ ~ ~ {Item:{id:"minecraft:conduit",Count:1}}
kill @e[type=minecraft:item,name="Conduit",nbt={Item:{tag:{DD_Linked:1b}}}]

# special case for 1.20.3 to 1.20.6
execute as @e[type=minecraft:item,name="Conduit",nbt={Item:{components:{"minecraft:custom_data":{DD_Linked:1b}}}}] at @s run summon minecraft:item ~ ~ ~ {Item:{id:"minecraft:conduit",Count:1}}
kill @e[type=minecraft:item,name="Conduit",nbt={Item:{components:{"minecraft:custom_data":{DD_Linked:1b}}}}]


# clean up all existing dimensional doors
execute as @e[tag=DD_portal] at @s if block ~ ~ ~ minecraft:oak_door run setblock ~ ~ ~ minecraft:air destroy

# kill entities
kill @e[type=!player,tag=DimensionalDoors]


# remove tags
tag @e remove DD_enter
tag @e remove DD_enter+
tag @e remove DD_enter-
tag @e remove DD_door404


# wipe scoreboards
scoreboard objectives remove DD_doorID
scoreboard objectives remove DimensionalDoors


# done
function dimensionaldoors:root/core/disable