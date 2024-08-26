tag @s remove MD_command_uninstall
scoreboard players reset EVENT$command.uninstall MyDatapack

tellraw @s [{"text":" "},{"text":"Uninstall MyDatapack","color":"white","underlined":true,"clickEvent":{"action":"suggest_command","value":"/function mydatapack:root/core/uninstaller"}},{"text":"\n"}]