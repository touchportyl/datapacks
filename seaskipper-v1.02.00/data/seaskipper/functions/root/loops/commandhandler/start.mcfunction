scoreboard players operation LOOP$commandhandler.alreadyactive Seaskipper = LOOP$commandhandler.isActive Seaskipper
scoreboard players operation LOOP$commandhandler.isActive Seaskipper = BOOL$true DatapackManager
execute if score LOOP$commandhandler.alreadyactive Seaskipper = BOOL$false DatapackManager run function seaskipper:root/loops/commandhandler
scoreboard players reset LOOP$commandhandler.alreadyactive Seaskipper