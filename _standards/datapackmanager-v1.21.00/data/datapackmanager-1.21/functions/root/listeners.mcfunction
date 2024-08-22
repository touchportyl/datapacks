# initialize
execute if score EVENT$initialize DatapackManager = BOOL$true DatapackManager run function datapackmanager-1.21:root/core/initialize

# triggers
execute as @a[scores={dm_help=1..}] at @s run function datapackmanager-1.21:root/commands/help
execute as @a[scores={dm_info=1..}] at @s run function datapackmanager-1.21:root/commands/info
execute as @a[scores={dm_version=1..}] at @s run function datapackmanager-1.21:root/commands/version
#execute as @a[scores={dm_uninstall=1..}] at @s run function datapackmanager-1.21:root/commands/uninstall
# todo: uptime trigger

scoreboard players reset @a dm_help
scoreboard players reset @a dm_info
scoreboard players reset @a dm_version

# cleanup
scoreboard players operation FLAG$dirty DatapackManager = BOOL$false DatapackManager