scoreboard players operation LOOP$main.alreadyactive Seaskipper = LOOP$main.isActive Seaskipper
scoreboard players operation LOOP$main.isActive Seaskipper = BOOL$true DatapackManager
execute if score LOOP$main.alreadyactive Seaskipper = BOOL$false DatapackManager run function seaskipper:root/loops/main
scoreboard players reset LOOP$main.alreadyactive Seaskipper