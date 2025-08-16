function mydatapack:packages/events/handlers

# loop
execute if score LOOP$eventhandlers.isActive MyDatapack = BOOL$true DatapackManager run schedule function mydatapack:root/loops/eventhandlers 1s