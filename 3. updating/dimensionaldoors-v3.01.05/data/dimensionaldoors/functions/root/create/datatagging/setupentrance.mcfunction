tellraw @a[tag=dd_debug] [{"text":"DD","color":"light_purple"},{"text":" > root/create/datatagging/setupentrance.mcfunction","color":"gray"}]

# tag
tag @s add DD_entrance

# generate doorID for new doors
execute as @s at @s run scoreboard players operation @s DD_doorID = DD$doorID.current DD_doorID

execute as @s at @s store result score @s DD_doorID run data get entity @e[nbt={Item:{tag:{DD_Linked:1b}}},limit=1,sort=nearest] Item.tag.DD_doorID

# forceload chunks
forceload add ~ ~

# advancement
advancement grant @a[distance=..7] only dimensionaldoors:adventure/create_door

# effects
function dimensionaldoors:effects/doorcreation

# cleanup
tag @s remove DD_new