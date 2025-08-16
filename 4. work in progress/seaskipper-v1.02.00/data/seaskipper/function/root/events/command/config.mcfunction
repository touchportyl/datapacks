tag @s remove SS_command_config
scoreboard players reset EVENT$command.config Seaskipper
scoreboard players operation EVENT$command.config.handled Seaskipper = BOOL$true DatapackManager

tellraw @s [{"text":" "},{"text":"Seaskipper","color":"aqua","bold":true},{"text":"\n"}]

tellraw @s [{"text":" "},{"text":"Nothing to configure.","color":"gray"},{"text":"\n"}]