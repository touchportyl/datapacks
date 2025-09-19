scoreboard players operation LOOP$eventhandlers.alreadyactive AroundTheWorld = LOOP$eventhandlers.isActive AroundTheWorld
scoreboard players operation LOOP$eventhandlers.isActive AroundTheWorld = BOOL$true DatapackManager
execute if score LOOP$eventhandlers.alreadyactive AroundTheWorld = BOOL$false DatapackManager run function aroundtheworld:root/loops/eventhandlers
scoreboard players reset LOOP$eventhandlers.alreadyactive AroundTheWorld