scoreboard players operation LOOP$main.alreadyactive DimensionalDoors = LOOP$main.isActive DimensionalDoors
scoreboard players operation LOOP$main.isActive DimensionalDoors = BOOL$true DatapackManager
execute if score LOOP$main.alreadyactive DimensionalDoors = BOOL$false DatapackManager run function dimensionaldoors:root/loops/main
scoreboard players reset LOOP$main.alreadyactive DimensionalDoors