# update state
tag @s remove AW_command_uninstall
execute unless entity @a[tag=AW_command_uninstall] run scoreboard players operation EVENT$command.uninstall.handled AroundTheWorld = BOOL$true DatapackManager

tellraw @s [{"text":" "},{"text":"Uninstall AroundTheWorld","color":"white","underlined":true,"clickEvent":{"action":"suggest_command","value":"/function aroundtheworld:root/core/uninstaller"},"click_event":{"action":"suggest_command","command":"/function aroundtheworld:root/core/uninstaller"}},{"text":"\n"}]