# send event
tag @s add DM_command_config
scoreboard players operation EVENT$command.config DatapackManager = BOOL$true DatapackManager
scoreboard players set EVENT$command.config.timer DatapackManager 0