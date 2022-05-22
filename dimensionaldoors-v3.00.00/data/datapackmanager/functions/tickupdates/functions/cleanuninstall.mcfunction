tellraw @a[tag=debug] [{"text":"> tickupdates/triggers/cleanuninstall.mcfunction","color":"gray"}]

# create loader
bossbar add datapackmanager_uninstall_progress {"text":"Uninstalling datapack -> Starting sequence..."}
bossbar set datapackmanager_uninstall_progress color white
bossbar set datapackmanager_uninstall_progress max 6
bossbar set datapackmanager_uninstall_progress value 0
bossbar set datapackmanager_uninstall_progress style notched_6
bossbar set datapackmanager_uninstall_progress players @a
bossbar set datapackmanager_uninstall_progress visible true

# stop loops
bossbar set datapackmanager_uninstall_progress value 1
bossbar set datapackmanager_uninstall_progress name {"text":"Uninstalling datapack -> Stopping loops..."}

schedule clear datapackmanager:ticker/1s

schedule clear dimensionaldoors:ticker/1t
schedule clear dimensionaldoors:ticker/1s


# kill entities
bossbar set datapackmanager_uninstall_progress value 2
bossbar set datapackmanager_uninstall_progress name {"text":"Uninstalling datapack -> Killing entities..."}

kill @e[type=!player,tag=DatapackManager]

kill @e[type=!player,tag=DimensionalDoors]


# purge items
bossbar set datapackmanager_uninstall_progress value 3
bossbar set datapackmanager_uninstall_progress name {"text":"Uninstalling datapack -> Purging items..."}

# remove items from all tracked inventories


# remove tags
bossbar set datapackmanager_uninstall_progress value 4
bossbar set datapackmanager_uninstall_progress name {"text":"Uninstalling datapack -> Removing tags..."}

tag @a remove debug

tag @e remove DD_enter
tag @e remove DD_enter+
tag @e remove DD_enter-
tag @e remove DD_door404
tag @e remove DD_open
tag @e remove DD_close

# wipe scoreboards
bossbar set datapackmanager_uninstall_progress value 5
bossbar set datapackmanager_uninstall_progress name {"text":"Uninstalling datapack -> Wiping scoreboards..."}

scoreboard objectives remove uninstall
scoreboard objectives remove DatapackManager

scoreboard objectives remove DimensionalDoors
scoreboard objectives remove DD_doorID


# done
bossbar set datapackmanager_uninstall_progress name {"text":"Uninstalling datapack -> Done!"}
bossbar remove datapackmanager_uninstall_progress
function datapackmanager:tickupdates/functions/disablepack
title @a actionbar {"text":"Datapack uninstalled!"}
execute as @a at @s run playsound minecraft:entity.player.levelup player @s ~ ~ ~ 1 2 1
