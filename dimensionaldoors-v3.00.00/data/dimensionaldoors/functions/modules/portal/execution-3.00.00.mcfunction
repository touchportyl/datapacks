# close door
execute as @e[tag=DD_enter] at @s run tag @e[tag=DD_portal,sort=nearest,limit=1] add DD_close

# direction detection
execute as @e[tag=DD_portal,tag=DD_entrance] at @s run tag @e[tag=DD_enter,distance=..1,sort=nearest] add DD_enter+
execute as @e[tag=DD_portal,tag=DD_exit] at @s run tag @e[tag=DD_enter,distance=..1,sort=nearest] add DD_enter-


# teleport player: entrance > exit
execute as @e[tag=DD_entrance] at @s at @e[tag=DD_enter+,distance=..1,limit=1] as @e[tag=DD_exit] if score @s DD_doorID = @e[tag=DD_entrance,limit=1,sort=nearest] DD_doorID run tp @e[tag=DD_enter+,distance=..1,limit=1,sort=nearest] @s

# 404 if teleport did not happen
execute as @e[tag=DD_entrance] at @s at @e[tag=DD_enter+,distance=..1,limit=1] run tag @e[tag=DD_enter+,distance=..1,limit=1,sort=nearest] add DD_door404
execute as @e[tag=DD_door404] run tag @s remove DD_enter+

# blow up entrance if link thrown into entrance
# CONFIG: can be disabled
execute if score CONFIG$destroyexplosively DimensionalDoors = BOOL$true DatapackManager as @e[type=minecraft:item,tag=DD_door404,name=Conduit,nbt={Item:{tag:{DD_Linked:1b}}}] at @s align xyz run function dimensionaldoors:modules/effects/destructiveexplosion-3.00.00
# non-damaging variant
execute if score CONFIG$destroyexplosively DimensionalDoors = BOOL$false DatapackManager as @e[type=minecraft:item,tag=DD_door404,name=Conduit,nbt={Item:{tag:{DD_Linked:1b}}}] at @s align xyz positioned ~0.5 ~0.5 ~0.5 run function dimensionaldoors:modules/effects/nondestructiveexplosion-3.00.00

# displace the player
# has the unintended side effect of displacing the player if the doors are too close
# this makes it more "realistic" as opening two connected wormholes next to each other would be unstable
execute as @e[tag=DD_door404] at @s run spreadplayers ~ ~ 0 1 false @s

# move to correct location
execute as @e[tag=DD_enter+] at @s run tp @s ^ ^ ^1


# teleport player: exit > entrance
execute as @e[tag=DD_exit] at @s at @e[tag=DD_enter-,distance=..1,limit=1] as @e[tag=DD_entrance] if score @s DD_doorID = @e[tag=DD_exit,limit=1,sort=nearest] DD_doorID run tp @e[tag=DD_enter-,distance=..1,limit=1,sort=nearest] @s

# move to correct location
execute as @e[tag=DD_enter-] at @s run tp @s ^ ^ ^1

# close door
execute as @e[tag=DD_portal,tag=DD_close] run function dimensionaldoors:packages/closedoor-3.00.00

# clear cache
execute as @e[tag=DD_enter] run tag @s remove DD_enter
execute as @e[tag=DD_enter+] run tag @s remove DD_enter+
execute as @e[tag=DD_enter-] run tag @s remove DD_enter-
execute as @e[tag=DD_door404] run tag @s remove DD_door404
execute as @e[tag=DD_open] run tag @s remove DD_open
execute as @e[tag=DD_close] run tag @s remove DD_close
