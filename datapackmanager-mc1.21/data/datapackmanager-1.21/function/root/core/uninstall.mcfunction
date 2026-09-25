# alert
function datapackmanager-1.21:packages/alerts/manageruninstalled

# cleanup events
function datapackmanager-1.21:root/events/event/initialize/cleanup
function datapackmanager-1.21:root/events/command/config/cleanup
function datapackmanager-1.21:root/events/command/uninstall/cleanup

# cleanup objectives
scoreboard objectives remove dm_help
scoreboard objectives remove dm_info
scoreboard objectives remove dm_version
scoreboard objectives remove dm_config
scoreboard objectives remove dm_uninstall

# removing the master objective also stops every loop: each loop compares LOOP$*.isActive against BOOL$true on this objective before it reschedules
scoreboard objectives remove DatapackManager
