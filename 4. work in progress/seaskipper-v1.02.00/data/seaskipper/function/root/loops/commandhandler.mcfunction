# event handlers


# config command
execute if score EVENT$command.config Seaskipper = BOOL$true DatapackManager as @a[tag=PT_command_config] at @s run function seaskipper:root/events/command/config

# uninstall command
execute if score EVENT$command.uninstall Seaskipper = BOOL$true DatapackManager as @a[tag=PT_command_uninstall] at @s run function seaskipper:root/events/command/uninstall


# loop
execute if score LOOP$commandhandler.isActive Seaskipper = BOOL$true DatapackManager run schedule function seaskipper:root/loops/commandhandler 1s