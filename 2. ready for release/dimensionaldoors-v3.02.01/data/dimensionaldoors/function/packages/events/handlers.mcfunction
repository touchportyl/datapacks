# event handlers


# config command

# if not handled, run the config command
execute if score EVENT$command.config.handled DimensionalDoors = BOOL$false DatapackManager if score EVENT$command.config DimensionalDoors = BOOL$true DatapackManager as @a[tag=DD_command_config] at @s run function dimensionaldoors:packages/events/command/config

# cleanup once the event is no longer active
execute unless score EVENT$command.config DatapackManager = BOOL$true DatapackManager if score EVENT$command.config.handled DimensionalDoors = BOOL$true DatapackManager run function dimensionaldoors:packages/events/command/config/cleanup


# uninstall command
execute if score EVENT$command.uninstall.handled DimensionalDoors = BOOL$false DatapackManager if score EVENT$command.uninstall DimensionalDoors = BOOL$true DatapackManager as @a[tag=DD_command_uninstall] at @s run function dimensionaldoors:packages/events/command/uninstall
execute unless score EVENT$command.uninstall DatapackManager = BOOL$true DatapackManager if score EVENT$command.uninstall.handled DimensionalDoors = BOOL$true DatapackManager run function dimensionaldoors:packages/events/command/uninstall/cleanup
