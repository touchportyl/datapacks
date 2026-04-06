# update state
tag @s remove PT_command_uninstall
execute unless entity @a[tag=PT_command_uninstall] run scoreboard players operation EVENT$command.uninstall.handled PortylTrident = BOOL$true DatapackManager

tellraw @s [{"text":" "},{"text":"Uninstall PortylTrident","color":"white","underlined":true,"clickEvent":{"action":"suggest_command","value":"/function portyltrident:root/core/uninstaller"},"click_event":{"action":"suggest_command","command":"/function portyltrident:root/core/uninstaller"}},{"text":"\n"}]