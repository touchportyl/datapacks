scoreboard players operation LOOP$listeners.alreadyactive Seaskipper = LOOP$listeners.isActive Seaskipper
scoreboard players operation LOOP$listeners.isActive Seaskipper = BOOL$true DatapackManager
execute if score LOOP$listeners.alreadyactive Seaskipper = BOOL$false DatapackManager run function seaskipper:root/loops/listeners
scoreboard players reset LOOP$listeners.alreadyactive Seaskipper