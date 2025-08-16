# event handlers


# config command
execute unless score EVENT$command.config.handled DimensionalDoors = BOOL$true DatapackManager if score EVENT$command.config DimensionalDoors = BOOL$true DatapackManager as @a[tag=DD_command_config] at @s run function dimensionaldoors:root/events/command/config

# uninstall command
execute unless score EVENT$command.config.handled DimensionalDoors = BOOL$true DatapackManager if score EVENT$command.uninstall DimensionalDoors = BOOL$true DatapackManager as @a[tag=DD_command_uninstall] at @s run function dimensionaldoors:root/events/command/uninstall


# loop
execute if score LOOP$commandhandler.isActive DimensionalDoors = BOOL$true DatapackManager run schedule function dimensionaldoors:root/loops/commandhandler 1s