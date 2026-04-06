scoreboard players operation LOOP$eventhandlers.alreadyactive DimensionalDoors = LOOP$eventhandlers.isActive DimensionalDoors
scoreboard players operation LOOP$eventhandlers.isActive DimensionalDoors = BOOL$true DatapackManager
execute if score LOOP$eventhandlers.alreadyactive DimensionalDoors = BOOL$false DatapackManager run function dimensionaldoors:root/loops/eventhandlers
scoreboard players reset LOOP$eventhandlers.alreadyactive DimensionalDoors