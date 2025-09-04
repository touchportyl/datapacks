# manage events and commands
function datapackmanager-1.21:root/events/managers/eventmanager
function datapackmanager-1.21:root/events/managers/commandmanager

# loop
execute if score LOOP$main.isActive DatapackManager = BOOL$true DatapackManager run schedule function datapackmanager-1.21:root/loops/main 1s