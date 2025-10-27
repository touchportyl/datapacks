scoreboard players operation LOOP$commandhandler.alreadyactive DimensionalDoors = LOOP$commandhandler.isActive DimensionalDoors
scoreboard players operation LOOP$commandhandler.isActive DimensionalDoors = BOOL$true DatapackManager
execute if score LOOP$commandhandler.alreadyactive DimensionalDoors = BOOL$false DatapackManager run function dimensionaldoors:root/loops/commandhandler
scoreboard players reset LOOP$commandhandler.alreadyactive DimensionalDoors