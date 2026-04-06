# event handlers


# config command

# if not handled, run the config command
execute if score EVENT$command.config.handled AroundTheWorld = BOOL$false DatapackManager if score EVENT$command.config AroundTheWorld = BOOL$true DatapackManager as @a[tag=AW_command_config] at @s run function aroundtheworld:packages/events/command/config

# cleanup once the event is no longer active
execute unless score EVENT$command.config DatapackManager = BOOL$true DatapackManager if score EVENT$command.config.handled AroundTheWorld = BOOL$true DatapackManager run function aroundtheworld:packages/events/command/config/cleanup


# uninstall command
execute if score EVENT$command.uninstall.handled AroundTheWorld = BOOL$false DatapackManager if score EVENT$command.uninstall AroundTheWorld = BOOL$true DatapackManager as @a[tag=AW_command_uninstall] at @s run function aroundtheworld:packages/events/command/uninstall
execute unless score EVENT$command.uninstall DatapackManager = BOOL$true DatapackManager if score EVENT$command.uninstall.handled AroundTheWorld = BOOL$true DatapackManager run function aroundtheworld:packages/events/command/uninstall/cleanup
