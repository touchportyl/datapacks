scoreboard players operation LOOP$eventhandlers.alreadyactive Harvester = LOOP$eventhandlers.isActive Harvester
scoreboard players operation LOOP$eventhandlers.isActive Harvester = BOOL$true DatapackManager
execute if score LOOP$eventhandlers.alreadyactive Harvester = BOOL$false DatapackManager run function harvester:root/loops/eventhandlers
scoreboard players reset LOOP$eventhandlers.alreadyactive Harvester