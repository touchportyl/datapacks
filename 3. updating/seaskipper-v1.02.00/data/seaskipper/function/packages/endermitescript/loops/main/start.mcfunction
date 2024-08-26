scoreboard players operation LOOP$es.main.alreadyactive Seaskipper = LOOP$es.main.isActive Seaskipper
scoreboard players operation LOOP$es.main.isActive Seaskipper = BOOL$true DatapackManager
execute if score LOOP$es.main.alreadyactive Seaskipper = BOOL$false DatapackManager run function seaskipper:packages/endermitescript/loops/main
scoreboard players reset LOOP$es.main.alreadyactive MyDatapack