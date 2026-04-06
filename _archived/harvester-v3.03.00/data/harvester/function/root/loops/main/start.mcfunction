scoreboard players operation LOOP$main.alreadyactive Harvester = LOOP$main.isActive Harvester
scoreboard players operation LOOP$main.isActive Harvester = BOOL$true DatapackManager
execute if score LOOP$main.alreadyactive Harvester = BOOL$false DatapackManager run function harvester:root/loops/main
scoreboard players reset LOOP$main.alreadyactive Harvester