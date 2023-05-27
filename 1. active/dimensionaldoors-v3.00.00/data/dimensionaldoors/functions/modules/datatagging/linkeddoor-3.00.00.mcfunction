tellraw @a[tag=debug] [{"text":"DD > modules/datatagging/linkeddoor-3.00.00.mcfunction","color":"gray"}]

# tag
tag @s add DD_exit

# copy id to link doors
execute as @s at @s store result score @s DD_doorID run data get entity @e[nbt={Item:{tag:{DD_Linked:1b}}},limit=1,sort=nearest] Item.tag.DD_doorID

# forceload chunks
forceload add ~ ~

# advancement
advancement grant @a[distance=..7] only dimensionaldoors:adventure/link_door

# effects
execute if score VERSION$minecraft.current DatapackManager matches 14..18 run function dimensionaldoors:modules/effects/doorcreation-2.00.00
execute if score VERSION$minecraft.current DatapackManager matches 19..19 run function dimensionaldoors:modules/effects/doorcreation-3.00.00

# cleanup
tag @s remove DD_new
