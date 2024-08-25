scoreboard players operation LOOP$main.alreadyactive PortylTrident = LOOP$main.isActive PortylTrident
scoreboard players operation LOOP$main.isActive PortylTrident = BOOL$true DatapackManager
execute if score LOOP$main.alreadyactive PortylTrident = BOOL$false DatapackManager run function portyltrident:root/loops/main
scoreboard players reset LOOP$main.alreadyactive PortylTrident