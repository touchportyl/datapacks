tellraw @a[tag=dd_debug] [{"text":"DD","color":"light_purple"},{"text":" > root/create/datatagging/setupexit.mcfunction","color":"gray"}]

# tag
tag @s add DD_exit

# copy id to link doors
execute as @s at @s store result score @s DD_doorID run data get entity @e[nbt={Item:{tag:{DD_Linked:1b}}},limit=1,sort=nearest] Item.tag.DD_doorID

# forceload chunks
forceload add ~ ~

# advancement
advancement grant @a[distance=..7] only dimensionaldoors:adventure/link_door

# effects
function dimensionaldoors:effects/doorcreation

# cleanup
tag @s remove DD_new