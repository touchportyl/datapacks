tellraw @a[tag=debug] [{"text":"> taglinkeddoor-3.00.00.mcfunction","color":"gray"}]

# tag
tag @s add DD_exit

# copy id to link doors
execute as @s at @s store result score @s DD_doorID run data get entity @e[nbt={Item:{tag:{DD_Linked:1b}}},limit=1,sort=nearest] Item.tag.DD_doorID

# forceload chunks
forceload add ~ ~

# advancement
advancement grant @a[distance=..7] only dimensionaldoors:adventure/link_door

# effects
particle minecraft:sonic_boom ~ ~ ~ 0 0 0 0 1 normal
playsound minecraft:block.conduit.attack.target block @a[distance=..100] ~ ~ ~ 1 1 0

# cleanup
tag @s remove DD_new
