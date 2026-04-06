# cleanup previous tick
function datapackmanager-1.21:root/commands/config-
function datapackmanager-1.21:root/commands/uninstall-


# triggers
execute as @a[scores={dm_help=1..}] at @s run function datapackmanager-1.21:root/commands/help
execute as @a[scores={dm_info=1..}] at @s run function datapackmanager-1.21:root/commands/info
execute as @a[scores={dm_version=1..}] at @s run function datapackmanager-1.21:root/commands/version
execute as @a[scores={dm_config=1..}] at @s unless score EVENT$command.config DatapackManager = BOOL$true DatapackManager run function datapackmanager-1.21:root/commands/config
execute as @a[scores={dm_uninstall=1..}] at @s unless score EVENT$command.uninstall DatapackManager = BOOL$true DatapackManager run function datapackmanager-1.21:root/commands/uninstall
# todo: uptime trigger


# reset triggers
scoreboard players reset @a dm_help
scoreboard players reset @a dm_info
scoreboard players reset @a dm_version
scoreboard players reset @a dm_config
scoreboard players reset @a dm_uninstall

scoreboard players enable @a dm_help
scoreboard players enable @a dm_info
scoreboard players enable @a dm_version
scoreboard players enable @a dm_config
scoreboard players enable @a dm_uninstall