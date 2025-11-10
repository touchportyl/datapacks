function seaskipper:packages/events/listeners

# loop
execute if score LOOP$eventlisteners.isActive Seaskipper = BOOL$true DatapackManager run schedule function seaskipper:root/loops/eventlisteners 7t