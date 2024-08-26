tag @s remove PT_command_uninstall
scoreboard players reset EVENT$command.uninstall PortylTrident

tellraw @s [{"text":" "},{"text":"Uninstall PortylTrident","color":"white","underlined":true,"clickEvent":{"action":"suggest_command","value":"/function portyltrident:root/core/uninstaller"}},{"text":"\n"}]