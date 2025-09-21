scoreboard players operation LOOP$configtriggers.alreadyactive DimensionalDoors = LOOP$configtriggers.isActive DimensionalDoors
scoreboard players operation LOOP$configtriggers.isActive DimensionalDoors = BOOL$true DatapackManager
execute if score LOOP$configtriggers.alreadyactive DimensionalDoors = BOOL$false DatapackManager run function dimensionaldoors:root/loops/configtriggers
scoreboard players reset LOOP$configtriggers.alreadyactive DimensionalDoors