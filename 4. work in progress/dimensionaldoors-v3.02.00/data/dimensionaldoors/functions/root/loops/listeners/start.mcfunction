scoreboard players operation LOOP$listeners.alreadyactive DimensionalDoors = LOOP$listeners.isActive DimensionalDoors
scoreboard players operation LOOP$listeners.isActive DimensionalDoors = BOOL$true DatapackManager
execute if score LOOP$listeners.alreadyactive DimensionalDoors = BOOL$false DatapackManager run function dimensionaldoors:root/loops/listeners
scoreboard players reset LOOP$listeners.alreadyactive DimensionalDoors