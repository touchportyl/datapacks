tellraw @s [{"text":"","color":"white","clickEvent":{"action":"suggest_command","value":"/function mydatapack:root/core/uninstaller"}},{"text":" "},{"text":"Uninstall MyDatapack\n","underlined":true}]

tag @s remove PT_command_uninstall
scoreboard players reset EVENT$command.uninstall MyDatapack