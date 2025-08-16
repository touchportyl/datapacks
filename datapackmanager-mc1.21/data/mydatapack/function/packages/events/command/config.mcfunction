# update state
tag @s remove MD_command_config
execute unless entity @a[tag=MD_command_config] run scoreboard players operation EVENT$command.config.handled MyDatapack = BOOL$true DatapackManager

tellraw @s [{"text":" "},{"text":"My Datapack","color":"white","bold":true},{"text":"\n"}]

tellraw @s [{"text":" "},{"text":"Nothing to configure.","color":"gray"},{"text":"\n"}]