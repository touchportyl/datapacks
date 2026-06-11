scoreboard players operation LOOP$main.alreadyactive DatapackManager = LOOP$main.isActive DatapackManager
scoreboard players operation LOOP$main.isActive DatapackManager = BOOL$true DatapackManager
execute if score LOOP$main.alreadyactive DatapackManager = BOOL$false DatapackManager run function datapackmanager-1.21:root/loops/main
scoreboard players reset LOOP$main.alreadyactive DatapackManager