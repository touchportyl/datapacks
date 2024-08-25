# event listeners
# if event is active and not handled
# copy the event for processing


# command config
execute if score EVENT$command.config DatapackManager = BOOL$true DatapackManager unless score EVENT$command.config MyDatapack = BOOL$true DatapackManager run tag @a[tag=DM_command_config] add PT_command_config
execute if score EVENT$command.config DatapackManager = BOOL$true DatapackManager unless score EVENT$command.config MyDatapack = BOOL$true DatapackManager run scoreboard players operation EVENT$command.config MyDatapack = BOOL$true DatapackManager

# command uninstall
execute if score EVENT$command.uninstall DatapackManager = BOOL$true DatapackManager unless score EVENT$command.uninstall MyDatapack = BOOL$true DatapackManager run tag @a[tag=DM_command_uninstall] add PT_command_uninstall
execute if score EVENT$command.uninstall DatapackManager = BOOL$true DatapackManager unless score EVENT$command.uninstall MyDatapack = BOOL$true DatapackManager run scoreboard players operation EVENT$command.uninstall MyDatapack = BOOL$true DatapackManager


# loop
execute if score LOOP$listeners.isActive MyDatapack = BOOL$true DatapackManager run schedule function mydatapack:root/loops/listeners 7t