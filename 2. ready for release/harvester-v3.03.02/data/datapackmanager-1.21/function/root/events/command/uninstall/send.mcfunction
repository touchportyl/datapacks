# send event
tag @s add DM_command_uninstall
scoreboard players operation EVENT$command.uninstall DatapackManager = BOOL$true DatapackManager
scoreboard players set EVENT$command.uninstall.timer DatapackManager 0