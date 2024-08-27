tag @s remove PT_command_config
scoreboard players reset EVENT$command.config Seaskipper

tellraw @s [{"text":" "},{"text":"Seaskipper","color":"aqua","bold":true},{"text":"\n"}]

tellraw @s [{"text":" "},{"text":"Nothing to configure.","color":"gray"},{"text":"\n"}]