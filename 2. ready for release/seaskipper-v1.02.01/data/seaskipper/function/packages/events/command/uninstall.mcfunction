# update state
tag @s remove SS_command_uninstall
execute unless entity @a[tag=SS_command_uninstall] run scoreboard players operation EVENT$command.uninstall.handled Seaskipper = BOOL$true DatapackManager

tellraw @s [{"text":" "},{"text":"Uninstall Seaskipper","color":"white","underlined":true,"clickEvent":{"action":"suggest_command","value":"/function seaskipper:root/core/uninstaller"},"click_event":{"action":"suggest_command","command":"/function seaskipper:root/core/uninstaller"}},{"text":"\n"}]