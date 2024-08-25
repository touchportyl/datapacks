# advanced door detection and creation of data tagged entity
execute as @s at @s run function dimensionaldoors:root/create/datatagging/summon/door

# increment
scoreboard players add DD$doorID.current DD_doorID 1

# assign door as entrance
execute as @e[tag=DD_new,sort=nearest,limit=1] at @s run function dimensionaldoors:root/create/datatagging/setupentrance

# create linked conduit
execute at @e[tag=DD_new,sort=nearest,limit=1] positioned ^ ^ ^1 run function dimensionaldoors:root/create/datatagging/summon/createlinkedconduit

# cleanup
tag @e[tag=DD_new,sort=nearest,limit=1] remove DD_new

# remove item
kill @s