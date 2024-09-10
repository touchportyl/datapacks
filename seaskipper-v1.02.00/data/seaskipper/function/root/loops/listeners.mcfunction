# event listeners
# if event is active and not handled
# copy the event for processing


# command config
execute unless score EVENT$command.config.handled DatapackManager = BOOL$true DatapackManager run tag @a[tag=DM_command_config] add SS_command_config
execute unless score EVENT$command.config.handled DatapackManager = BOOL$true DatapackManager if score EVENT$command.config DatapackManager = BOOL$true DatapackManager run scoreboard players operation EVENT$command.config Seaskipper = BOOL$true DatapackManager
execute unless score EVENT$command.config DatapackManager = BOOL$true DatapackManager run scoreboard players reset EVENT$command.config.handled Seaskipper

# command uninstall
execute unless score EVENT$command.uninstall.handled DatapackManager = BOOL$true DatapackManager run tag @a[tag=DM_command_uninstall] add SS_command_uninstall
execute unless score EVENT$command.uninstall.handled DatapackManager = BOOL$true DatapackManager if score EVENT$command.uninstall DatapackManager = BOOL$true DatapackManager run scoreboard players operation EVENT$command.uninstall Seaskipper = BOOL$true DatapackManager
execute unless score EVENT$command.uninstall DatapackManager = BOOL$true DatapackManager run scoreboard players reset EVENT$command.uninstall.handled Seaskipper


# loop
execute if score LOOP$listeners.isActive Seaskipper = BOOL$true DatapackManager run schedule function seaskipper:root/loops/listeners 7t