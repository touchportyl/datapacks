# tag
function dimensionaldoors:root/create/datatagging/doortagger
tag @s add DD_exit

# copy id to link doors
execute if score VERSION$minecraft.version DatapackManager matches ..12003 as @s at @s store result score @s DD_doorID run data get entity @e[nbt={Item:{tag:{DD_Linked:1b}}},limit=1,sort=nearest] Item.tag.DD_doorID

# special case for 1.20.3+
execute if score VERSION$minecraft.version DatapackManager matches 12003.. as @s at @s store result score @s DD_doorID run data get entity @e[nbt={Item:{components:{"minecraft:custom_data":{DD_Linked:1b}}}},limit=1,sort=nearest] Item.components.minecraft:custom_data.DD_doorID

# forceload chunks
forceload add ~ ~

# advancement
advancement grant @a[distance=..7] only dimensionaldoors:adventure/link_door

# effects
function dimensionaldoors:effects/doorcreation