# triggers
execute as @a[scores={dm_help=1..}] at @s run function datapackmanager-1.21:root/events/command/help
execute as @a[scores={dm_info=1..}] at @s run function datapackmanager-1.21:root/events/command/info
execute as @a[scores={dm_version=1..}] at @s run function datapackmanager-1.21:root/events/command/version
# todo: uptime trigger

execute as @a[scores={dm_config=1..}] at @s unless score EVENT$command.config DatapackManager = BOOL$true DatapackManager run function datapackmanager-1.21:root/events/command/config
execute as @a[scores={dm_uninstall=1..}] at @s unless score EVENT$command.uninstall DatapackManager = BOOL$true DatapackManager run function datapackmanager-1.21:root/events/command/uninstall

# reset triggers
function datapackmanager-1.21:root/events/resetcommands