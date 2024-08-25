# event handlers


# config command
execute if score EVENT$command.config MyDatapack = BOOL$true DatapackManager as @a[tag=PT_command_config] at @s run function mydatapack:root/events/command/config

# uninstall command
execute if score EVENT$command.uninstall MyDatapack = BOOL$true DatapackManager as @a[tag=PT_command_uninstall] at @s run function mydatapack:root/events/command/uninstall


# loop
execute if score LOOP$commandhandler.isActive MyDatapack = BOOL$true DatapackManager run schedule function mydatapack:root/loops/commandhandler 1s