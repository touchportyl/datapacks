# teleport player: entrance > exit
execute as @e[tag=DD_entrance] at @s at @e[tag=DD_enter+,distance=..2,limit=1] as @e[tag=DD_exit] if score @s DD_doorID = @e[tag=DD_entrance,limit=1,sort=nearest] DD_doorID run tp @e[tag=DD_enter+,distance=..2,limit=1,sort=nearest] @s


# 404 if teleport did not happen
execute as @e[tag=DD_entrance] at @s at @e[tag=DD_enter+,distance=..2,limit=1] run tag @e[tag=DD_enter+,distance=..2,limit=1,sort=nearest] add DD_door404
execute as @e[tag=DD_door404] run tag @s remove DD_enter+


# blow up entrance if link thrown into entrance
execute if score FLAG$nbt.version.old DatapackManager = BOOL$true DatapackManager as @e[type=minecraft:item,tag=DD_door404,name="Conduit",nbt={Item:{tag:{DD_Linked:1b}}}] at @s as @e[tag=DD_portal,limit=1,sort=nearest] run tag @s add DD_destroy

# special case for 1.20.3 to 1.20.6
execute if score FLAG$nbt.version.1.20.3 DatapackManager = BOOL$true DatapackManager as @e[type=minecraft:item,tag=DD_door404,name="Conduit",nbt={Item:{components:{"minecraft:custom_data":{DD_Linked:1b}}}}] at @s as @e[tag=DD_portal,limit=1,sort=nearest] run tag @s add DD_destroy