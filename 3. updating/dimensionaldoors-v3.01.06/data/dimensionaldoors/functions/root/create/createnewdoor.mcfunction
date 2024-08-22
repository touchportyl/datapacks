tellraw @a[tag=dd_debug] [{"text":"DD","color":"light_purple"},{"text":" > root/create/createnewdoor.mcfunction","color":"gray"}]

# advanced door detection and creation of data tagged entity
execute as @s at @s run function dimensionaldoors:root/create/datatagging/summon/door

# increment
scoreboard players add DD$doorID.current DD_doorID 1

# create linked conduit
execute as @s at @s at @e[tag=DD_new,distance=..1,limit=1] positioned ^ ^ ^1 run function dimensionaldoors:root/create/datatagging/summon/createlinkedconduit

# assign door as entrance
execute as @e[tag=DD_new,distance=..1,limit=1] at @s run function dimensionaldoors:root/create/datatagging/setupentrance

# remove item
kill @s