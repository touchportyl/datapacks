scoreboard players operation LOOP$eventlisteners.alreadyactive Harvester = LOOP$eventlisteners.isActive Harvester
scoreboard players operation LOOP$eventlisteners.isActive Harvester = BOOL$true DatapackManager
execute if score LOOP$eventlisteners.alreadyactive Harvester = BOOL$false DatapackManager run function harvester:root/loops/eventlisteners
scoreboard players reset LOOP$eventlisteners.alreadyactive Harvester