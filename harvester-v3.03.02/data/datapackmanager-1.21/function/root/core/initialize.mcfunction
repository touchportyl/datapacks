# set secret
scoreboard players set FLAG$secret DatapackManager 259240

# cleanup unused data from old versions of datapack manager
function datapackmanager-1.21:root/core/cleanup

# set the backward and forward compatible minecraft versions
# 26.x releases are encoded as 1.<year>.<drop>, so 26.3 is 12603
scoreboard players set VERSION$minecraft.backward DatapackManager 11404
scoreboard players set VERSION$minecraft.forward DatapackManager 12603

# check minecraft version
function datapackmanager-1.21:packages/versioning/check

# set up commands
function datapackmanager-1.21:root/events/initializecommands
function datapackmanager-1.21:root/events/resetcommands

# notify admins of the detected version
# the alert targets DM_admin itself, so it runs once rather than once per player
execute if score FLAG$isActive DatapackManager = BOOL$true DatapackManager run function datapackmanager-1.21:packages/alerts/minecraftversion

# stop the main loop if the datapack is not active
execute unless score FLAG$isActive DatapackManager = BOOL$true DatapackManager run function datapackmanager-1.21:root/loops/main/stop
