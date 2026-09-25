function datapackmanager-26.3:packages/events/handlers

# loop
execute if score LOOP$eventhandlers.isActive DatapackManager = BOOL$true DatapackManager run schedule function datapackmanager-26.3:root/loops/eventhandlers 1s
