scoreboard players operation LOOP$configtriggers.alreadyactive Harvester = LOOP$configtriggers.isActive Harvester
scoreboard players operation LOOP$configtriggers.isActive Harvester = BOOL$true DatapackManager
execute if score LOOP$configtriggers.alreadyactive Harvester = BOOL$false DatapackManager run function harvester:root/loops/configtriggers
scoreboard players reset LOOP$configtriggers.alreadyactive Harvester