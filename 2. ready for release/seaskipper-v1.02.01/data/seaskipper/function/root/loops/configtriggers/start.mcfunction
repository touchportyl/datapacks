scoreboard players operation LOOP$configtriggers.alreadyactive Seaskipper = LOOP$configtriggers.isActive Seaskipper
scoreboard players operation LOOP$configtriggers.isActive Seaskipper = BOOL$true DatapackManager
execute if score LOOP$configtriggers.alreadyactive Seaskipper = BOOL$false DatapackManager run function seaskipper:root/loops/configtriggers
scoreboard players reset LOOP$configtriggers.alreadyactive Seaskipper