tag @s remove MD_command_config
scoreboard players reset EVENT$command.config MyDatapack

tellraw @s [{"text":" "},{"text":"My Datapack","color":"white","bold":true},{"text":"\n"}]

tellraw @s [{"text":" "},{"text":"Nothing to configure.","color":"gray"},{"text":"\n"}]