tellraw @a[tag=debug] [{"text":"DD > packages/createlinkeddoor-3.00.00.mcfunction","color":"gray"}]

# advanced door detection and creation of data tagged entity
execute as @s at @s run function dimensionaldoors:modules/datatagging/oakdoor-3.00.00

# tag door
execute as @e[tag=DD_new,distance=..1,limit=1] at @s run function dimensionaldoors:modules/datatagging/linkeddoor-3.00.00

# remove item
kill @s
