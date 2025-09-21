# update state
tag @s remove DD_command_uninstall
execute unless entity @a[tag=DD_command_uninstall] run scoreboard players operation EVENT$command.uninstall.handled DimensionalDoors = BOOL$true DatapackManager

tellraw @s [{"text":" "},{"text":"Uninstall DimensionalDoors","color":"white","underlined":true,"clickEvent":{"action":"suggest_command","value":"/function dimensionaldoors:root/core/uninstaller"},"click_event":{"action":"suggest_command","command":"/function dimensionaldoors:root/core/uninstaller"}},{"text":"\n"}]