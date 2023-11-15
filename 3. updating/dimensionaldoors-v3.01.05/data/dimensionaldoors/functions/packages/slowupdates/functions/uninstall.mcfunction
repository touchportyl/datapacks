tellraw @a[tag=dd_debug] [{"text":"DD","color":"light_purple"},{"text":" > packages/slowupdates/functions/uninstall.mcfunction","color":"gray"}]

# stop loops
function dimensionaldoors:packages/slowupdates/functions/clearschedules


# replace named conduit
execute as @e[type=minecraft:item,name="Conduit",nbt={Item:{tag:{DD_Linked:1b}}}] at @s run summon minecraft:item ~ ~ ~ {Item:{id:"minecraft:conduit",Count:1}}
kill @e[type=minecraft:item,name="Conduit",nbt={Item:{tag:{DD_Linked:1b}}}]


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
function dimensionaldoors:packages/slowupdates/functions/disablepack