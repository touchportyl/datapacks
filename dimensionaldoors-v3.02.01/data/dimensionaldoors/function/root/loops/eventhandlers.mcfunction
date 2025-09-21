function dimensionaldoors:packages/events/handlers

# loop
execute if score LOOP$eventhandlers.isActive DimensionalDoors = BOOL$true DatapackManager run schedule function dimensionaldoors:root/loops/eventhandlers 1s