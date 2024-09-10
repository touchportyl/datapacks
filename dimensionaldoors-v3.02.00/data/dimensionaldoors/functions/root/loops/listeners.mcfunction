# event listeners
# if event is active and not handled
# copy the event for processing


# command config
execute unless score EVENT$command.config.handled DatapackManager = BOOL$true DatapackManager run tag @a[tag=DM_command_config] add DD_command_config
execute unless score EVENT$command.config.handled DatapackManager = BOOL$true DatapackManager if score EVENT$command.config DatapackManager = BOOL$true DatapackManager run scoreboard players operation EVENT$command.config DimensionalDoors = BOOL$true DatapackManager
execute unless score EVENT$command.config DatapackManager = BOOL$true DatapackManager run scoreboard players reset EVENT$command.config.handled DimensionalDoors

# command uninstall
execute unless score EVENT$command.uninstall.handled DatapackManager = BOOL$true DatapackManager run tag @a[tag=DM_command_uninstall] add DD_command_uninstall
execute unless score EVENT$command.uninstall.handled DatapackManager = BOOL$true DatapackManager if score EVENT$command.uninstall DatapackManager = BOOL$true DatapackManager run scoreboard players operation EVENT$command.uninstall DimensionalDoors = BOOL$true DatapackManager
execute unless score EVENT$command.uninstall DatapackManager = BOOL$true DatapackManager run scoreboard players reset EVENT$command.uninstall.handled DimensionalDoors


# loop
execute if score LOOP$listeners.isActive DimensionalDoors = BOOL$true DatapackManager run schedule function dimensionaldoors:root/loops/listeners 7t