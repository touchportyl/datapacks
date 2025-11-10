scoreboard players operation LOOP$eventhandlers.alreadyactive Seaskipper = LOOP$eventhandlers.isActive Seaskipper
scoreboard players operation LOOP$eventhandlers.isActive Seaskipper = BOOL$true DatapackManager
execute if score LOOP$eventhandlers.alreadyactive Seaskipper = BOOL$false DatapackManager run function seaskipper:root/loops/eventhandlers
scoreboard players reset LOOP$eventhandlers.alreadyactive Seaskipper