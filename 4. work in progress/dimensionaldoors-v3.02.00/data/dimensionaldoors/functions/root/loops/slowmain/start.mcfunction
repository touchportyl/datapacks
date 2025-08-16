scoreboard players operation LOOP$slowmain.alreadyactive DimensionalDoors = LOOP$slowmain.isActive DimensionalDoors
scoreboard players operation LOOP$slowmain.isActive DimensionalDoors = BOOL$true DatapackManager
execute if score LOOP$slowmain.alreadyactive DimensionalDoors = BOOL$false DatapackManager run function dimensionaldoors:root/loops/slowmain
scoreboard players reset LOOP$slowmain.alreadyactive DimensionalDoors