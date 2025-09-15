scoreboard players operation LOOP$eventlisteners.alreadyactive DimensionalDoors = LOOP$eventlisteners.isActive DimensionalDoors
scoreboard players operation LOOP$eventlisteners.isActive DimensionalDoors = BOOL$true DatapackManager
execute if score LOOP$eventlisteners.alreadyactive DimensionalDoors = BOOL$false DatapackManager run function dimensionaldoors:root/loops/eventlisteners
scoreboard players reset LOOP$eventlisteners.alreadyactive DimensionalDoors