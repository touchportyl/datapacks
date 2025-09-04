function harvester:packages/events/listeners

# loop
execute if score LOOP$eventlisteners.isActive Harvester = BOOL$true DatapackManager run schedule function harvester:root/loops/eventlisteners 7t