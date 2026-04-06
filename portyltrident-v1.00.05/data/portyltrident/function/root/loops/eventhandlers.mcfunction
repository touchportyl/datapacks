function portyltrident:packages/events/handlers

# loop
execute if score LOOP$eventhandlers.isActive PortylTrident = BOOL$true DatapackManager run schedule function portyltrident:root/loops/eventhandlers 1s