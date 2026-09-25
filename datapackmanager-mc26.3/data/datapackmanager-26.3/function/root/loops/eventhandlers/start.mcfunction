scoreboard players operation LOOP$eventhandlers.alreadyactive DatapackManager = LOOP$eventhandlers.isActive DatapackManager
scoreboard players operation LOOP$eventhandlers.isActive DatapackManager = BOOL$true DatapackManager
execute if score LOOP$eventhandlers.alreadyactive DatapackManager = BOOL$false DatapackManager run function datapackmanager-26.3:root/loops/eventhandlers
scoreboard players reset LOOP$eventhandlers.alreadyactive DatapackManager
