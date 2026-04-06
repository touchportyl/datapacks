function portyltrident:packages/events/listeners

# loop
execute if score LOOP$eventlisteners.isActive PortylTrident = BOOL$true DatapackManager run schedule function portyltrident:root/loops/eventlisteners 7t