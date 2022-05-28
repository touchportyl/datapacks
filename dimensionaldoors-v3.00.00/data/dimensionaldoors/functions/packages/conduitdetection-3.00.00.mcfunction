# linked conduit creates a linked door
# WARNING: THIS CODE COMES FIRST BECAUSE THE NEW DOOR DETECTOR CANNOT DIFFERENTIATE BETWEEN LINKED AND UNLINKED CONDUITS
execute as @e[type=minecraft:item,name=Conduit,nbt={Item:{tag:{DD_Linked:1b}},OnGround:1b}] at @s align xyz if block ~ ~ ~ minecraft:oak_door[open=true] unless entity @e[tag=DD_portal,distance=..1] run function dimensionaldoors:packages/createlinkeddoor-3.00.00


# conduit creates a new door
execute as @e[name=Conduit,nbt={OnGround:1b}] at @s align xyz if block ~ ~ ~ minecraft:oak_door[open=true] unless entity @e[tag=DD_portal,distance=..1] run function dimensionaldoors:packages/createnewdoor-3.00.00
