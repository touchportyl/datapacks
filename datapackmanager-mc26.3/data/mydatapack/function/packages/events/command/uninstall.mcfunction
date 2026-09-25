# update state
tag @s remove MD_command_uninstall
execute unless entity @a[tag=MD_command_uninstall] run function mydatapack:packages/events/command/uninstall/handle

tellraw @s [{"text":" "},{"text":"Uninstall MyDatapack","color":"white","underlined":true,"clickEvent":{"action":"suggest_command","value":"/function mydatapack:root/core/uninstaller"},"click_event":{"action":"suggest_command","command":"/function mydatapack:root/core/uninstaller"}},{"text":"\n"}]
