scoreboard players operation LOOP$configtriggers.alreadyactive MyDatapack = LOOP$configtriggers.isActive MyDatapack
scoreboard players operation LOOP$configtriggers.isActive MyDatapack = BOOL$true DatapackManager
execute if score LOOP$configtriggers.alreadyactive MyDatapack = BOOL$false DatapackManager run function mydatapack:root/loops/configtriggers
scoreboard players reset LOOP$configtriggers.alreadyactive MyDatapack