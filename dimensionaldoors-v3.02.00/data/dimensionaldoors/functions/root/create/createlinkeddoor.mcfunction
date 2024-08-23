tellraw @a[tag=dd_debug] [{"text":"DD","color":"light_purple"},{"text":" > root/create/createlinkeddoor.mcfunction","color":"gray"}]

# advanced door detection and creation of data tagged entity
execute as @s at @s run function dimensionaldoors:root/create/datatagging/summon/door

# assign door as exit
execute as @e[tag=DD_new,sort=nearest,limit=1] at @s run function dimensionaldoors:root/create/datatagging/setupexit

# cleanup
tag @e[tag=DD_new,sort=nearest,limit=1] remove DD_new

# remove item
kill @s