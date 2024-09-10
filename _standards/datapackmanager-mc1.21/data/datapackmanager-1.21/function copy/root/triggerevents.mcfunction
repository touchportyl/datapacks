# timer
execute if score EVENT$command.config.timer DatapackManager matches 0.. run scoreboard players add EVENT$command.config.timer DatapackManager 1
execute if score EVENT$command.uninstall.timer DatapackManager matches 0.. run scoreboard players add EVENT$command.uninstall.timer DatapackManager 1

# cleanup events
execute if score EVENT$command.config.timer DatapackManager matches 2.. run function datapackmanager-1.21:root/events/commands/config/cleanup
execute if score EVENT$command.uninstall.timer DatapackManager matches 2.. run function datapackmanager-1.21:root/events/commands/uninstall/cleanup


# triggers
execute as @a[scores={dm_help=1..}] at @s run function datapackmanager-1.21:root/events/commands/help
execute as @a[scores={dm_info=1..}] at @s run function datapackmanager-1.21:root/events/commands/info
execute as @a[scores={dm_version=1..}] at @s run function datapackmanager-1.21:root/events/commands/version
# todo: uptime trigger

execute as @a[scores={dm_config=1..}] at @s unless score EVENT$command.config DatapackManager = BOOL$true DatapackManager run function datapackmanager-1.21:root/events/commands/config
execute as @a[scores={dm_uninstall=1..}] at @s unless score EVENT$command.uninstall DatapackManager = BOOL$true DatapackManager run function datapackmanager-1.21:root/events/commands/uninstall


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