tag @s remove DD_command_uninstall
scoreboard players reset EVENT$command.uninstall DimensionalDoors
scoreboard players operation EVENT$command.uninstall.handled DimensionalDoors = BOOL$true DatapackManager

tellraw @s [{"text":" "},{"text":"Uninstall DimensionalDoors","color":"white","underlined":true,"clickEvent":{"action":"suggest_command","value":"/function dimensionaldoors:root/core/uninstaller"}},{"text":"\n"}]