# event handlers


# config command

# if not handled, run the config command
execute if score EVENT$command.config.handled Seaskipper = BOOL$false DatapackManager if score EVENT$command.config Seaskipper = BOOL$true DatapackManager as @a[tag=SS_command_config] at @s run function seaskipper:packages/events/command/config

# cleanup once the event is no longer active
execute unless score EVENT$command.config DatapackManager = BOOL$true DatapackManager if score EVENT$command.config.handled Seaskipper = BOOL$true DatapackManager run function seaskipper:packages/events/command/config/cleanup


# uninstall command
execute if score EVENT$command.uninstall.handled Seaskipper = BOOL$false DatapackManager if score EVENT$command.uninstall Seaskipper = BOOL$true DatapackManager as @a[tag=SS_command_uninstall] at @s run function seaskipper:packages/events/command/uninstall
execute unless score EVENT$command.uninstall DatapackManager = BOOL$true DatapackManager if score EVENT$command.uninstall.handled Seaskipper = BOOL$true DatapackManager run function seaskipper:packages/events/command/uninstall/cleanup
