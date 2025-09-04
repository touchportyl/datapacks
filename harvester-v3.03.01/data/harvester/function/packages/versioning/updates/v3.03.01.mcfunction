tellraw @a[tag=hv_debug] [{"text":"HV","color":"gold"},{"text":" > packages/versioning/updates/v3.03.01.mcfunction","color":"gray"}]

# notify
tellraw @a [{"text":"","color":"gold","hoverEvent":{"action":"show_text","value":"Alert from Harvester"}},{"text":" +"},{"text":" Harvester ","color":"gold","bold":true,"hoverEvent":{"action":"show_text","value":"Harvest and replant crops efficiently with a hoe!"}},{"text":"v3.03.01","color":"gray"},{"text":" > ","color":"white"},{"text":"Harvester updated from v3.01.00 to v3.03.01"}]

function datapackmanager-1.21:packages/effects/ui_jingle

# update
scoreboard players set VERSION$datapack.latest Harvester 30301

# added config
scoreboard players operation CONFIG$harvestxp Harvester = BOOL$true DatapackManager
scoreboard players operation CONFIG$harvestxpbonus Harvester = BOOL$true DatapackManager
scoreboard players operation CONFIG$toolbreaking Harvester = BOOL$false DatapackManager

scoreboard objectives add z_hv_001_t trigger {"text":"Harvester Config Enable Harvest XP","color":"gray","italic":true}
scoreboard objectives add z_hv_001_f trigger {"text":"Harvester Config Disable Harvest XP","color":"gray","italic":true}
scoreboard objectives add z_hv_002_t trigger {"text":"Harvester Config Enable Harvest XP Bonus","color":"gray","italic":true}
scoreboard objectives add z_hv_002_f trigger {"text":"Harvester Config Disable Harvest XP Bonus","color":"gray","italic":true}
scoreboard objectives add z_hv_003_t trigger {"text":"Harvester Config Enable Tool Breaking","color":"gray","italic":true}
scoreboard objectives add z_hv_003_f trigger {"text":"Harvester Config Disable Tool Breaking","color":"gray","italic":true}