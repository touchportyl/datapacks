# event listeners
# if event is active and not handled
# copy the event for processing


# config command

# if the event is active, initialize
execute unless score EVENT$command.config.handled DimensionalDoors = BOOL$true DatapackManager if score EVENT$command.config DatapackManager = BOOL$true DatapackManager run scoreboard players operation EVENT$command.config.handled DimensionalDoors = BOOL$false DatapackManager

# copy the event once (EVENT$command.config tracks the lifetime of the copied event and EVENT$command.config.handled tracks the state of the event for the lifetime of the copied event or initial event, whichever is longer)
execute unless score EVENT$command.config DimensionalDoors = BOOL$true DatapackManager if score EVENT$command.config DatapackManager = BOOL$true DatapackManager run function dimensionaldoors:packages/events/command/config/copy

# reset the handled state when both the copied event and the initial event are no longer active
execute unless score EVENT$command.config DatapackManager = BOOL$true DatapackManager unless score EVENT$command.config DimensionalDoors = BOOL$true DatapackManager run scoreboard players reset EVENT$command.config.handled DimensionalDoors


# uninstall command
execute unless score EVENT$command.uninstall.handled DimensionalDoors = BOOL$true DatapackManager if score EVENT$command.uninstall DatapackManager = BOOL$true DatapackManager run scoreboard players operation EVENT$command.uninstall.handled DimensionalDoors = BOOL$false DatapackManager
execute unless score EVENT$command.uninstall DimensionalDoors = BOOL$true DatapackManager if score EVENT$command.uninstall DatapackManager = BOOL$true DatapackManager run function dimensionaldoors:packages/events/command/uninstall/copy
execute unless score EVENT$command.uninstall DatapackManager = BOOL$true DatapackManager unless score EVENT$command.uninstall DimensionalDoors = BOOL$true DatapackManager run scoreboard players reset EVENT$command.uninstall.handled DimensionalDoors
