tellraw @a[tag=debug] [{"text":"DD > packages/createnewdoor-3.00.00.mcfunction","color":"gray"}]

# advanced door detection and creation of data tagged entity
execute as @s at @s run function dimensionaldoors:modules/datatagging/oakdoor-3.00.00

# increment
scoreboard players add DD$doorID.current DD_doorID 1

# create linked conduit
execute as @s at @s positioned ^ ^1 ^1 run function dimensionaldoors:modules/spawnlinkedconduit-3.00.00

# tag door
execute as @e[tag=DD_new,distance=..1,limit=1] at @s run function dimensionaldoors:modules/datatagging/newdoor-3.00.00

# remove item
kill @s
