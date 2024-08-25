scoreboard players operation LOOP$commandhandler.alreadyactive MyDatapack = LOOP$commandhandler.isActive MyDatapack
scoreboard players operation LOOP$commandhandler.isActive MyDatapack = BOOL$true DatapackManager
execute if score LOOP$commandhandler.alreadyactive MyDatapack = BOOL$false DatapackManager run function mydatapack:root/loops/commandhandler
scoreboard players reset LOOP$commandhandler.alreadyactive MyDatapack