# update state
tag @s remove DM_command_uninstall
execute unless entity @a[tag=DM_command_uninstall] run scoreboard players operation EVENT$command.uninstall.handled Harvester = BOOL$true DatapackManager

tellraw @s [{"text":" "},{"text":"Uninstall Harvester","color":"white","underlined":true,"clickEvent":{"action":"suggest_command","value":"/function harvester:root/core/uninstaller"},"click_event":{"action":"suggest_command","command":"/function harvester:root/core/uninstaller"}},{"text":"\n"}]