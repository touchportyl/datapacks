tag @s remove PT_command_config
scoreboard players reset EVENT$command.config PortylTrident
scoreboard players operation EVENT$command.config.handled PortylTrident = BOOL$true DatapackManager

tellraw @s [{"text":" "},{"text":"Portyl Trident","color":"aqua","bold":true},{"text":"\n"}]

tellraw @s [{"text":" "},{"text":"Nothing to configure.","color":"gray"},{"text":"\n"}]