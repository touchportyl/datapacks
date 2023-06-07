tellraw @a[tag=debug] [{"text":"DM > tickupdates/functions/cleanuninstall.mcfunction","color":"gray"}]

# stop loops
function datapackmanager:tickupdates/functions/clearschedules


# kill entities
kill @e[type=!player,tag=DatapackManager]


# purge items
# remove items from all tracked inventories


# remove tags
tag @a remove debug


# wipe scoreboards
#scoreboard objectives remove uninstall
scoreboard objectives remove DatapackManager


# done
function dimensionaldoors:tickupdates/functions/disablepack
