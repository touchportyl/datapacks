function mydatapack:packages/events/listeners

# loop
execute if score LOOP$eventlisteners.isActive MyDatapack = BOOL$true DatapackManager run schedule function mydatapack:root/loops/eventlisteners 7t