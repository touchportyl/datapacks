scoreboard players operation LOOP$eventlisteners.alreadyactive AroundTheWorld = LOOP$eventlisteners.isActive AroundTheWorld
scoreboard players operation LOOP$eventlisteners.isActive AroundTheWorld = BOOL$true DatapackManager
execute if score LOOP$eventlisteners.alreadyactive AroundTheWorld = BOOL$false DatapackManager run function aroundtheworld:root/loops/eventlisteners
scoreboard players reset LOOP$eventlisteners.alreadyactive AroundTheWorld