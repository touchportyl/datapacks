# teleport player: entrance > exit
execute as @e[tag=DD_entrance] at @s at @e[tag=DD_enter+,distance=..2,limit=1] as @e[tag=DD_exit] if score @s DD_doorID = @e[tag=DD_entrance,limit=1,sort=nearest] DD_doorID run tp @e[tag=DD_enter+,distance=..2,limit=1,sort=nearest] @s


# 404 if teleport did not happen
execute as @e[tag=DD_entrance] at @s at @e[tag=DD_enter+,distance=..2,limit=1] run tag @e[tag=DD_enter+,distance=..2,limit=1,sort=nearest] add DD_door404
execute as @e[tag=DD_door404] run tag @s remove DD_enter+


# blow up entrance if link thrown into entrance
# CONFIG: can be disabled
execute if score CONFIG$destroyexplosively DimensionalDoors = BOOL$true DatapackManager as @e[type=minecraft:item,tag=DD_door404,name="Conduit",nbt={Item:{tag:{DD_Linked:1b}}}] at @s align xyz run function dimensionaldoors:effects/destructiveexplosion
# non-damaging variant (fallback)
#execute unless score CONFIG$destroyexplosively DimensionalDoors = BOOL$true DatapackManager as @e[type=minecraft:item,tag=DD_door404,name="Conduit",nbt={Item:{tag:{DD_Linked:1b}}}] at @s align xyz positioned ~0.5 ~0.5 ~0.5 run function dimensionaldoors:effects/nondestructiveexplosion
execute unless score CONFIG$destroyexplosively DimensionalDoors = BOOL$true DatapackManager as @e[type=minecraft:item,tag=DD_door404,name="Conduit",nbt={Item:{tag:{DD_Linked:1b}}}] at @s at @e[tag=DD_portal,distance=..2,limit=1] run function dimensionaldoors:effects/nondestructiveexplosion