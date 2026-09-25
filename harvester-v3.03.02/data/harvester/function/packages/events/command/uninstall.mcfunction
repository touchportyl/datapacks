# update state
tag @s remove HV_command_uninstall
execute unless entity @a[tag=HV_command_uninstall] run function harvester:packages/events/command/uninstall/handle

tellraw @s [{"text":" "},{"text":"Uninstall Harvester","color":"white","underlined":true,"clickEvent":{"action":"suggest_command","value":"/function harvester:root/core/uninstaller"},"click_event":{"action":"suggest_command","command":"/function harvester:root/core/uninstaller"}},{"text":"\n"}]
