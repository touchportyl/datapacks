# event handlers


# config command
execute unless score EVENT$command.config.handled PortylTrident = BOOL$true DatapackManager if score EVENT$command.config PortylTrident = BOOL$true DatapackManager as @a[tag=PT_command_config] at @s run function portyltrident:root/events/command/config

# uninstall command
execute unless score EVENT$command.config.handled PortylTrident = BOOL$true DatapackManager if score EVENT$command.uninstall PortylTrident = BOOL$true DatapackManager as @a[tag=PT_command_uninstall] at @s run function portyltrident:root/events/command/uninstall


# loop
execute if score LOOP$commandhandler.isActive PortylTrident = BOOL$true DatapackManager run schedule function portyltrident:root/loops/commandhandler 1s