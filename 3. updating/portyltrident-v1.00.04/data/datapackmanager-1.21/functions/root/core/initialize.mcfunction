scoreboard players reset EVENT$initialize DatapackManager

# set secret
scoreboard players set FLAG$secret DatapackManager 259240


# cleanup unused data from old versions of datapack manager
function datapackmanager-1.21:root/core/cleanup


# set the backward and forward compatible minecraft versions
scoreboard players set VERSION$minecraft.backward DatapackManager 14
scoreboard players set VERSION$minecraft.forward DatapackManager 21

# check minecraft version
function datapackmanager-1.21:packages/versioning/check


# create triggers
scoreboard objectives add dm_help trigger
scoreboard objectives add dm_info trigger
scoreboard objectives add dm_version trigger
scoreboard objectives add dm_config trigger
scoreboard objectives add dm_uninstall trigger


# custom notification
execute if score FLAG$isActive DatapackManager = BOOL$true DatapackManager as @a at @s run function datapackmanager-1.21:packages/alerts/minecraftversion

# stop the main loop if the datapack is not active
execute unless score FLAG$isActive DatapackManager = BOOL$true DatapackManager run function datapackmanager-1.21:root/loops/main/stop