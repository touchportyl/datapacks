scoreboard players operation LOOP$es.main.alreadyactive MyDatapack = LOOP$es.main.isActive MyDatapack
scoreboard players operation LOOP$es.main.isActive MyDatapack = BOOL$true DatapackManager
execute if score LOOP$es.main.alreadyactive MyDatapack = BOOL$false DatapackManager run function mydatapack:packages/endermitescript/loops/main
scoreboard players reset LOOP$es.main.alreadyactive MyDatapack