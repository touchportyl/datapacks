scoreboard players reset EVENT$initialize DatapackManager

# set constants
scoreboard players set FLAG$secret DatapackManager 259240


# cleanup old data
function datapackmanager-1.21:root/core/cleanup


# check minecraft version
function datapackmanager-1.21:packages/versioning/check


# create triggers
scoreboard objectives add dm_help trigger
scoreboard objectives add dm_info trigger
scoreboard objectives add dm_version trigger
#scoreboard objectives add dm_uninstall trigger


# custom notification
execute if score FLAG$isActive DatapackManager = BOOL$true DatapackManager as @a at @s run function datapackmanager-1.21:packages/alerts/minecraftversion