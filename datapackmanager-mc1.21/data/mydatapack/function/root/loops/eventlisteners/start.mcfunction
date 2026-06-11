scoreboard players operation LOOP$eventlisteners.alreadyactive MyDatapack = LOOP$eventlisteners.isActive MyDatapack
scoreboard players operation LOOP$eventlisteners.isActive MyDatapack = BOOL$true DatapackManager
execute if score LOOP$eventlisteners.alreadyactive MyDatapack = BOOL$false DatapackManager run function mydatapack:root/loops/eventlisteners
scoreboard players reset LOOP$eventlisteners.alreadyactive MyDatapack