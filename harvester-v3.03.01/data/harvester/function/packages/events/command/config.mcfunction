# update state
tag @s remove MD_command_config
execute unless entity @a[tag=MD_command_config] run scoreboard players operation EVENT$command.config.handled Harvester = BOOL$true DatapackManager

execute as @s run function harvester:packages/configtriggers/enable

tellraw @s [{"text":" "},{"text":"Harvester","color":"white","bold":true},{"text":"\n"}]


# xp gain [CONFIG$harvestxp]
tellraw @s [{"text":" "},{"text":"Harvest XP","color":"white"}]
tellraw @s [{"text":" "},{"text":"- Enables XP orb drops on harvest","color":"gray","italic":true}]

execute if score CONFIG$harvestxp Harvester = BOOL$false DatapackManager run tellraw @s [{"text":" "},{"text":"Enabled","bold":false,"color":"green","clickEvent":{"action":"run_command","value":"/trigger z_hv_001_t"},"click_event":{"action":"run_command","command":"/trigger z_hv_001_t"}},{"text":"  "},{"text":"Disabled","bold":true,"color":"red","clickEvent":{"action":"run_command","value":"/trigger z_hv_001_f"},"click_event":{"action":"run_command","command":"/trigger z_hv_001_f"}},{"text":"\n"}]
execute if score CONFIG$harvestxp Harvester = BOOL$true DatapackManager run tellraw @s [{"text":" "},{"text":"Enabled","bold":true,"color":"green","clickEvent":{"action":"run_command","value":"/trigger z_hv_001_t"},"click_event":{"action":"run_command","command":"/trigger z_hv_001_t"}},{"text":"  "},{"text":"Disabled","bold":false,"color":"red","clickEvent":{"action":"run_command","value":"/trigger z_hv_001_f"},"click_event":{"action":"run_command","command":"/trigger z_hv_001_f"}},{"text":"\n"}]


# tool breaking [CONFIG$toolbreaking]
tellraw @s [{"text":" "},{"text":"Tool Breaking","color":"white"}]
tellraw @s [{"text":" "},{"text":"- Enables tool breaking on harvest","color":"gray","italic":true}]

execute if score CONFIG$toolbreaking Harvester = BOOL$false DatapackManager run tellraw @s [{"text":" "},{"text":"Enabled","bold":false,"color":"green","clickEvent":{"action":"run_command","value":"/trigger z_hv_002_t"},"click_event":{"action":"run_command","command":"/trigger z_hv_002_t"}},{"text":"  "},{"text":"Disabled","bold":true,"color":"red","clickEvent":{"action":"run_command","value":"/trigger z_hv_002_f"},"click_event":{"action":"run_command","command":"/trigger z_hv_002_f"}},{"text":"\n"}]
execute if score CONFIG$toolbreaking Harvester = BOOL$true DatapackManager run tellraw @s [{"text":" "},{"text":"Enabled","bold":true,"color":"green","clickEvent":{"action":"run_command","value":"/trigger z_hv_002_t"},"click_event":{"action":"run_command","command":"/trigger z_hv_002_t"}},{"text":"  "},{"text":"Disabled","bold":false,"color":"red","clickEvent":{"action":"run_command","value":"/trigger z_hv_002_f"},"click_event":{"action":"run_command","command":"/trigger z_hv_002_f"}},{"text":"\n"}]
