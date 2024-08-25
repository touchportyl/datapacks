scoreboard players operation LOOP$listeners.alreadyactive MyDatapack = LOOP$listeners.isActive MyDatapack
scoreboard players operation LOOP$listeners.isActive MyDatapack = BOOL$true DatapackManager
execute if score LOOP$listeners.alreadyactive MyDatapack = BOOL$false DatapackManager run function mydatapack:root/loops/listeners
scoreboard players reset LOOP$listeners.alreadyactive MyDatapack