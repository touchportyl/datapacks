scoreboard players operation LOOP$background.alreadyactive DimensionalDoors = LOOP$background.isActive DimensionalDoors
scoreboard players operation LOOP$background.isActive DimensionalDoors = BOOL$true DatapackManager
execute if score LOOP$background.alreadyactive DimensionalDoors = BOOL$false DatapackManager run function dimensionaldoors:root/loops/background
scoreboard players reset LOOP$background.alreadyactive DimensionalDoors