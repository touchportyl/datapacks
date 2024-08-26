# cleanup everything

# cleanup events
function datapackmanager-1.21:root/commands/config-
function datapackmanager-1.21:root/commands/uninstall-

scoreboard objectives remove dm_help
scoreboard objectives remove dm_info
scoreboard objectives remove dm_version
scoreboard objectives remove dm_config
scoreboard objectives remove dm_uninstall

scoreboard players reset LOOP$main.isActive DatapackManager

scoreboard players reset FLAG$isActive DatapackManager

#scoreboard objectives remove DatapackManager