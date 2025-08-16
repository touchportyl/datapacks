# event handlers


# initialize event

execute if score EVENT$initialize.handled DatapackManager = BOOL$false DatapackManager if score EVENT$initialize.copy DatapackManager = BOOL$true DatapackManager run function datapackmanager-1.21:packages/events/event/initialize
execute unless score EVENT$initialize DatapackManager = BOOL$true DatapackManager if score EVENT$initialize.handled DatapackManager = BOOL$true DatapackManager run function datapackmanager-1.21:packages/events/event/initialize/cleanup