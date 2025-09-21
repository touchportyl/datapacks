scoreboard players operation LOOP$eventhandlers.alreadyactive PortylTrident = LOOP$eventhandlers.isActive PortylTrident
scoreboard players operation LOOP$eventhandlers.isActive PortylTrident = BOOL$true DatapackManager
execute if score LOOP$eventhandlers.alreadyactive PortylTrident = BOOL$false DatapackManager run function portyltrident:root/loops/eventhandlers
scoreboard players reset LOOP$eventhandlers.alreadyactive PortylTrident