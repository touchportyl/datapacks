tag @s remove SS_command_uninstall
scoreboard players reset EVENT$command.uninstall Seaskipper
scoreboard players operation EVENT$command.uninstall.handled Seaskipper = BOOL$true DatapackManager

tellraw @s [{"text":" "},{"text":"Uninstall Seaskipper","color":"white","underlined":true,"clickEvent":{"action":"suggest_command","value":"/function seaskipper:root/core/uninstaller"}},{"text":"\n"}]