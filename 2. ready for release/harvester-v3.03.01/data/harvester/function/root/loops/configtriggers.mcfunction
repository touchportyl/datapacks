# check for config changes
execute as @a if score @s z_hv_001_t matches 1.. run scoreboard players operation CONFIG$harvestxp Harvester = BOOL$true DatapackManager
execute as @a if score @s z_hv_001_f matches 1.. run scoreboard players operation CONFIG$harvestxp Harvester = BOOL$false DatapackManager
execute as @a if score @s z_hv_002_t matches 1.. run scoreboard players operation CONFIG$harvestxpbonus Harvester = BOOL$true DatapackManager
execute as @a if score @s z_hv_002_f matches 1.. run scoreboard players operation CONFIG$harvestxpbonus Harvester = BOOL$false DatapackManager
execute as @a if score @s z_hv_003_t matches 1.. run scoreboard players operation CONFIG$toolbreaking Harvester = BOOL$true DatapackManager
execute as @a if score @s z_hv_003_f matches 1.. run scoreboard players operation CONFIG$toolbreaking Harvester = BOOL$false DatapackManager

execute as @a if score @s z_hv_001_t matches 1.. run function harvester:packages/configtriggers/reset
execute as @a if score @s z_hv_001_f matches 1.. run function harvester:packages/configtriggers/reset
execute as @a if score @s z_hv_002_t matches 1.. run function harvester:packages/configtriggers/reset
execute as @a if score @s z_hv_002_f matches 1.. run function harvester:packages/configtriggers/reset
execute as @a if score @s z_hv_003_t matches 1.. run function harvester:packages/configtriggers/reset
execute as @a if score @s z_hv_003_f matches 1.. run function harvester:packages/configtriggers/reset

# loop
execute if score LOOP$configtriggers.isActive Harvester = BOOL$true DatapackManager run schedule function harvester:root/loops/configtriggers 4t