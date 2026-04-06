scoreboard players operation LOOP$configtriggers.alreadyactive AroundTheWorld = LOOP$configtriggers.isActive AroundTheWorld
scoreboard players operation LOOP$configtriggers.isActive AroundTheWorld = BOOL$true DatapackManager
execute if score LOOP$configtriggers.alreadyactive AroundTheWorld = BOOL$false DatapackManager run function aroundtheworld:root/loops/configtriggers
scoreboard players reset LOOP$configtriggers.alreadyactive AroundTheWorld