# update state
tag @s remove MD_command_uninstall
execute unless entity @a[tag=MD_command_uninstall] run scoreboard players operation EVENT$command.uninstall.handled MyDatapack = BOOL$true DatapackManager

tellraw @s [{"text":" "},{"text":"Uninstall MyDatapack","color":"white","underlined":true,"clickEvent":{"action":"suggest_command","value":"/function mydatapack:root/core/uninstaller"}},{"text":"\n"}]