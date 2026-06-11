scoreboard players operation LOOP$main.alreadyactive MyDatapack = LOOP$main.isActive MyDatapack
scoreboard players operation LOOP$main.isActive MyDatapack = BOOL$true DatapackManager
execute if score LOOP$main.alreadyactive MyDatapack = BOOL$false DatapackManager run function mydatapack:root/loops/main
scoreboard players reset LOOP$main.alreadyactive MyDatapack