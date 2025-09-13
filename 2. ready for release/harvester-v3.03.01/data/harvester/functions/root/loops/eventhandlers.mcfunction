function harvester:packages/events/handlers

# loop
execute if score LOOP$eventhandlers.isActive Harvester = BOOL$true DatapackManager run schedule function harvester:root/loops/eventhandlers 1s