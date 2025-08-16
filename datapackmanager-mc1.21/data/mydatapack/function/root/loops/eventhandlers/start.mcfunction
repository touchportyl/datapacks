scoreboard players operation LOOP$eventhandlers.alreadyactive MyDatapack = LOOP$eventhandlers.isActive MyDatapack
scoreboard players operation LOOP$eventhandlers.isActive MyDatapack = BOOL$true DatapackManager
execute if score LOOP$eventhandlers.alreadyactive MyDatapack = BOOL$false DatapackManager run function mydatapack:root/loops/eventhandlers
scoreboard players reset LOOP$eventhandlers.alreadyactive MyDatapack