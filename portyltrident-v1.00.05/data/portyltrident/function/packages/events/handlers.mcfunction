# event handlers


# config command

# if not handled, run the config command
execute if score EVENT$command.config.handled PortylTrident = BOOL$false DatapackManager if score EVENT$command.config PortylTrident = BOOL$true DatapackManager as @a[tag=PT_command_config] at @s run function portyltrident:packages/events/command/config

# cleanup once the event is no longer active
execute unless score EVENT$command.config DatapackManager = BOOL$true DatapackManager if score EVENT$command.config.handled PortylTrident = BOOL$true DatapackManager run function portyltrident:packages/events/command/config/cleanup


# uninstall command
execute if score EVENT$command.uninstall.handled PortylTrident = BOOL$false DatapackManager if score EVENT$command.uninstall PortylTrident = BOOL$true DatapackManager as @a[tag=PT_command_uninstall] at @s run function portyltrident:packages/events/command/uninstall
execute unless score EVENT$command.uninstall DatapackManager = BOOL$true DatapackManager if score EVENT$command.uninstall.handled PortylTrident = BOOL$true DatapackManager run function portyltrident:packages/events/command/uninstall/cleanup
