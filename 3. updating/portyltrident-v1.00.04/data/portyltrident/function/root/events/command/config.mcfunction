tag @s remove PT_command_config
scoreboard players reset EVENT$command.config PortylTrident

tellraw @s [{"text":" "},{"text":"Portyl Trident","color":"aqua","bold":true},{"text":"\n"}]

tellraw @s [{"text":" "},{"text":"Nothing to configure.","color":"gray"},{"text":"\n"}]