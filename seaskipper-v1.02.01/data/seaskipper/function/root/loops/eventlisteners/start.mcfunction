scoreboard players operation LOOP$eventlisteners.alreadyactive Seaskipper = LOOP$eventlisteners.isActive Seaskipper
scoreboard players operation LOOP$eventlisteners.isActive Seaskipper = BOOL$true DatapackManager
execute if score LOOP$eventlisteners.alreadyactive Seaskipper = BOOL$false DatapackManager run function seaskipper:root/loops/eventlisteners
scoreboard players reset LOOP$eventlisteners.alreadyactive Seaskipper