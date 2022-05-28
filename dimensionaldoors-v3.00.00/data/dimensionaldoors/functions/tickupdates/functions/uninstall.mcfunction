tellraw @a[tag=debug] [{"text":"DD > tickupdates/functions/uninstall.mcfunction","color":"gray"}]

# stop loops
function dimensionaldoors:tickupdates/functions/clearschedules


# replace named conduit
execute as @e[type=minecraft:item,name=Conduit,nbt={Item:{tag:{DD_Linked:1b}}}] at @s run summon minecraft:item ~ ~ ~ {Item:{id:"minecraft:conduit",Count:1}}
kill @e[type=minecraft:item,name=Conduit,nbt={Item:{tag:{DD_Linked:1b}}}]


# clean up doors
execute as @e[tag=DD_portal] at @s if block ~ ~ ~ minecraft:oak_door run setblock ~ ~ ~ minecraft:air destroy

# kill entities
kill @e[type=!player,tag=DimensionalDoors]


# remove tags
tag @e remove DD_new
tag @e remove DD_enter
tag @e remove DD_enter+
tag @e remove DD_enter-
tag @e remove DD_door404
tag @e remove DD_open
tag @e remove DD_close


# wipe scoreboards
scoreboard objectives remove DD_doorID
scoreboard objectives remove DimensionalDoors


# done
scoreboard players operation FUNCTION$disablepack DimensionalDoors = BOOL$true DatapackManager
scoreboard players operation DD$dirty DimensionalDoors = BOOL$true DatapackManager
