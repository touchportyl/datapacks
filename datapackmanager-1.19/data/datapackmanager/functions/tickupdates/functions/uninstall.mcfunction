tellraw @a[tag=debug] [{"text":"DM > tickupdates/functions/uninstall.mcfunction","color":"gray"}]

# stop loops
schedule clear dimensionaldoors:ticker/1t-3.00.00
schedule clear dimensionaldoors:ticker/1s-3.00.00


# kill entities
kill @e[type=!player,tag=DimensionalDoors]


# purge items
# remove items from all tracked inventories


# remove tags
tag @a remove


# wipe scoreboards
scoreboard objectives remove DD_doorID
scoreboard objectives remove DimensionalDoors


# done
scoreboard players operation FUNCTION$disablepack DatapackManager = BOOL$true DatapackManager
scoreboard players operation DM$dirty DatapackManager = BOOL$true DatapackManager
