# event listeners
# if event is active and not handled
# copy the event for processing


# initialize event

execute unless score EVENT$initialize.handled DatapackManager = BOOL$true DatapackManager if score EVENT$initialize DatapackManager = BOOL$true DatapackManager run scoreboard players operation EVENT$initialize.handled DatapackManager = BOOL$false DatapackManager
execute unless score EVENT$initialize.copy DatapackManager = BOOL$true DatapackManager if score EVENT$initialize DatapackManager = BOOL$true DatapackManager run function datapackmanager-1.21:packages/events/event/initialize/copy
execute unless score EVENT$initialize DatapackManager = BOOL$true DatapackManager unless score EVENT$initialize.copy DatapackManager = BOOL$true DatapackManager run scoreboard players reset EVENT$initialize.handled DatapackManager