# event handlers


# config command

# if not handled, run the config command
execute if score EVENT$command.config.handled Harvester = BOOL$false DatapackManager if score EVENT$command.config Harvester = BOOL$true DatapackManager as @a[tag=MD_command_config] at @s run function harvester:packages/events/command/config

# cleanup once the event is no longer active
execute unless score EVENT$command.config DatapackManager = BOOL$true DatapackManager if score EVENT$command.config.handled Harvester = BOOL$true DatapackManager run function harvester:packages/events/command/config/cleanup


# uninstall command
execute if score EVENT$command.uninstall.handled Harvester = BOOL$false DatapackManager if score EVENT$command.uninstall Harvester = BOOL$true DatapackManager as @a[tag=MD_command_uninstall] at @s run function harvester:packages/events/command/uninstall
execute unless score EVENT$command.uninstall DatapackManager = BOOL$true DatapackManager if score EVENT$command.uninstall.handled Harvester = BOOL$true DatapackManager run function harvester:packages/events/command/uninstall/cleanup