# manage events and commands
function datapackmanager-26.3:root/events/managers/eventmanager
function datapackmanager-26.3:root/events/managers/commandmanager

# loop
execute if score LOOP$main.isActive DatapackManager = BOOL$true DatapackManager run schedule function datapackmanager-26.3:root/loops/main 1s
