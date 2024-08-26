scoreboard players operation LOOP$listeners.alreadyactive PortylTrident = LOOP$listeners.isActive PortylTrident
scoreboard players operation LOOP$listeners.isActive PortylTrident = BOOL$true DatapackManager
execute if score LOOP$listeners.alreadyactive PortylTrident = BOOL$false DatapackManager run function portyltrident:root/loops/listeners
scoreboard players reset LOOP$listeners.alreadyactive PortylTrident