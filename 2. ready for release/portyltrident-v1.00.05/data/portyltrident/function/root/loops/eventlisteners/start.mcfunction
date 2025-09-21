scoreboard players operation LOOP$eventlisteners.alreadyactive PortylTrident = LOOP$eventlisteners.isActive PortylTrident
scoreboard players operation LOOP$eventlisteners.isActive PortylTrident = BOOL$true DatapackManager
execute if score LOOP$eventlisteners.alreadyactive PortylTrident = BOOL$false DatapackManager run function portyltrident:root/loops/eventlisteners
scoreboard players reset LOOP$eventlisteners.alreadyactive PortylTrident