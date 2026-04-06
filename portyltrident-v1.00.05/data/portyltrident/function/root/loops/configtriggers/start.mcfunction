scoreboard players operation LOOP$configtriggers.alreadyactive PortylTrident = LOOP$configtriggers.isActive PortylTrident
scoreboard players operation LOOP$configtriggers.isActive PortylTrident = BOOL$true DatapackManager
execute if score LOOP$configtriggers.alreadyactive PortylTrident = BOOL$false DatapackManager run function portyltrident:root/loops/configtriggers
scoreboard players reset LOOP$configtriggers.alreadyactive PortylTrident