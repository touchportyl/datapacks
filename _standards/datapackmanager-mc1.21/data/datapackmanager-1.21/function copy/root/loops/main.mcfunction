# initialize
execute if score EVENT$initialize DatapackManager = BOOL$true DatapackManager run function datapackmanager-1.21:root/core/initialize

# trigger events
function datapackmanager-1.21:root/triggerevents

# loop
execute if score LOOP$main.isActive DatapackManager = BOOL$true DatapackManager run schedule function datapackmanager-1.21:root/loops/main 1s