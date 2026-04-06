# event listeners
# if event is active and not handled
# copy the event for processing


# command config
execute if score EVENT$command.config.handled DatapackManager = BOOL$false DatapackManager run tag @a[tag=DM_command_config] add PT_command_config
execute if score EVENT$command.config.handled DatapackManager = BOOL$false DatapackManager if score EVENT$command.config DatapackManager = BOOL$true DatapackManager run scoreboard players operation EVENT$command.config PortylTrident = BOOL$true DatapackManager
execute unless score EVENT$command.config DatapackManager = BOOL$true DatapackManager run scoreboard players reset EVENT$command.config.handled PortylTrident

# command uninstall
execute if score EVENT$command.uninstall.handled DatapackManager = BOOL$false DatapackManager run tag @a[tag=DM_command_uninstall] add PT_command_uninstall
execute if score EVENT$command.uninstall.handled DatapackManager = BOOL$false DatapackManager if score EVENT$command.uninstall DatapackManager = BOOL$true DatapackManager run scoreboard players operation EVENT$command.uninstall PortylTrident = BOOL$true DatapackManager
execute unless score EVENT$command.uninstall DatapackManager = BOOL$true DatapackManager run scoreboard players reset EVENT$command.uninstall.handled PortylTrident


# loop
execute if score LOOP$listeners.isActive PortylTrident = BOOL$true DatapackManager run schedule function portyltrident:root/loops/listeners 7t