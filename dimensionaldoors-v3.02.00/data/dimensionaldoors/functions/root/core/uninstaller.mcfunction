# stop loops
function dimensionaldoors:root/loops/main/stop
function dimensionaldoors:root/loops/listeners/stop
function dimensionaldoors:root/loops/commandhandler/stop


# replace named conduit
execute if score FLAG$nbt.version.old DatapackManager = BOOL$true DatapackManager as @e[type=minecraft:item,name="Conduit",nbt={Item:{tag:{DD_Linked:1b}}}] at @s run summon minecraft:item ~ ~ ~ {Item:{id:"minecraft:conduit",Count:1}}
execute if score FLAG$nbt.version.old DatapackManager = BOOL$true DatapackManager as @e[type=minecraft:item,name="Conduit",nbt={Item:{tag:{DD_Linked:1b}}}] run kill @s

# special case for 1.20.3 to 1.20.6
execute if score FLAG$nbt.version.1.20.3 DatapackManager = BOOL$true DatapackManager as @e[type=minecraft:item,name="Conduit",nbt={Item:{components:{"minecraft:custom_data":{DD_Linked:1b}}}}] at @s run summon minecraft:item ~ ~ ~ {Item:{id:"minecraft:conduit",Count:1}}
execute if score FLAG$nbt.version.1.20.3 DatapackManager = BOOL$true DatapackManager as @e[type=minecraft:item,name="Conduit",nbt={Item:{components:{"minecraft:custom_data":{DD_Linked:1b}}}}] run kill @s


# clean up all existing dimensional doors
execute as @e[tag=DD_portal] at @s if block ~ ~ ~ #minecraft:doors run setblock ~ ~ ~ minecraft:air destroy

# remove entities
kill @e[type=!player,tag=DimensionalDoors]

# remove tags
tag @e remove DD_enter
tag @e remove DD_enter+
tag @e remove DD_enter-
tag @e remove DD_door404

# scoreboards
scoreboard objectives remove DD_doorID
scoreboard objectives remove DD_warpcooldown
scoreboard objectives remove DimensionalDoors

function dimensionaldoors:root/core/disable