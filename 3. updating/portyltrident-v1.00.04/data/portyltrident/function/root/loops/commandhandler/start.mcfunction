scoreboard players operation LOOP$commandhandler.alreadyactive PortylTrident = LOOP$commandhandler.isActive PortylTrident
scoreboard players operation LOOP$commandhandler.isActive PortylTrident = BOOL$true DatapackManager
execute if score LOOP$commandhandler.alreadyactive PortylTrident = BOOL$false DatapackManager run function portyltrident:root/loops/commandhandler
scoreboard players reset LOOP$commandhandler.alreadyactive PortylTrident