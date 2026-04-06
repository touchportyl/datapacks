scoreboard players operation LOOP$eventlisteners.alreadyactive DatapackManager = LOOP$eventlisteners.isActive DatapackManager
scoreboard players operation LOOP$eventlisteners.isActive DatapackManager = BOOL$true DatapackManager
execute if score LOOP$eventlisteners.alreadyactive DatapackManager = BOOL$false DatapackManager run function datapackmanager-1.21:root/loops/eventlisteners
scoreboard players reset LOOP$eventlisteners.alreadyactive DatapackManager