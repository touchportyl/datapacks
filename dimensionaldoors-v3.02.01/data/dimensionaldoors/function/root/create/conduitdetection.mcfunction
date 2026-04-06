# linked conduit creates a linked door
# WARNING: THIS CODE COMES FIRST BECAUSE THE NEW DOOR DETECTOR CANNOT DIFFERENTIATE BETWEEN LINKED AND UNLINKED CONDUITS
execute if score VERSION$minecraft.current DatapackManager matches ..12002 as @e[type=minecraft:item,name="Conduit",nbt={Item:{tag:{DD_Linked:1b}},OnGround:1b}] at @s align xyz if block ~ ~ ~ #minecraft:doors[open=true] unless entity @e[tag=DD_portal,distance=..1] run function dimensionaldoors:root/create/createlinkeddoor

# special case for 1.20.3+
execute if score VERSION$minecraft.current DatapackManager matches 12003.. as @e[type=minecraft:item,name="Conduit",nbt={Item:{components:{"minecraft:custom_data":{DD_Linked:1b}}},OnGround:1b}] at @s align xyz if block ~ ~ ~ #minecraft:doors[open=true] unless entity @e[tag=DD_portal,distance=..1] run function dimensionaldoors:root/create/createlinkeddoor


# conduit creates a new door
execute as @e[name="Conduit",nbt={OnGround:1b}] at @s align xyz if block ~ ~ ~ #minecraft:doors[open=true] unless entity @e[tag=DD_portal,distance=..1] run function dimensionaldoors:root/create/createnewdoor


# dropped conduit
execute if score VERSION$minecraft.current DatapackManager matches ..12002 as @e[type=minecraft:item,name="Conduit",nbt={Item:{tag:{DD_Linked:1b}},OnGround:1b}] run tag @s add DD_particleLink

# special case for 1.20.3+
execute if score VERSION$minecraft.current DatapackManager matches 12003.. as @e[type=minecraft:item,name="Conduit",nbt={Item:{components:{"minecraft:custom_data":{DD_Linked:1b}}},OnGround:1b}] run tag @s add DD_particleLink