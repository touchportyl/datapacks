function seaskipper:packages/events/handlers

# loop
execute if score LOOP$eventhandlers.isActive Seaskipper = BOOL$true DatapackManager run schedule function seaskipper:root/loops/eventhandlers 1s