scoreboard players operation LOOP$main.alreadyactive AroundTheWorld = LOOP$main.isActive AroundTheWorld
scoreboard players operation LOOP$main.isActive AroundTheWorld = BOOL$true DatapackManager
execute if score LOOP$main.alreadyactive AroundTheWorld = BOOL$false DatapackManager run function aroundtheworld:root/loops/main
scoreboard players reset LOOP$main.alreadyactive AroundTheWorld