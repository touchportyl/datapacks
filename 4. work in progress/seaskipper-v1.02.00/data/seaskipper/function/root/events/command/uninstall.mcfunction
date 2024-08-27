tag @s remove PT_command_uninstall
scoreboard players reset EVENT$command.uninstall Seaskipper

tellraw @s [{"text":" "},{"text":"Uninstall Seaskipper","color":"white","underlined":true,"clickEvent":{"action":"suggest_command","value":"/function seaskipper:root/core/uninstaller"}},{"text":"\n"}]