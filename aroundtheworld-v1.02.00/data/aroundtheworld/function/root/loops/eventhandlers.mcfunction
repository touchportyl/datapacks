function aroundtheworld:packages/events/handlers

# loop
execute if score LOOP$eventhandlers.isActive AroundTheWorld = BOOL$true DatapackManager run schedule function aroundtheworld:root/loops/eventhandlers 1s