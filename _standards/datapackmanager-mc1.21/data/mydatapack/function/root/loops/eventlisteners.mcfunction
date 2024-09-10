# event listeners
# if event is active and not handled
# copy the event for processing


# command config

# if the event is active, initialize
execute unless score EVENT$command.config.handled MyDatapack = BOOL$true DatapackManager if score EVENT$command.config DatapackManager = BOOL$true DatapackManager run scoreboard players operation EVENT$command.config.handled MyDatapack = BOOL$false DatapackManager

# copy the event once (EVENT$command.config tracks the lifetime of the copied event and EVENT$command.config.handled tracks the state of the event for the lifetime of the copied event or initial event, whichever is longer)
execute unless score EVENT$command.config MyDatapack = BOOL$true DatapackManager if score EVENT$command.config DatapackManager = BOOL$true DatapackManager run function mydatapack:root/events/command/config/copy

# reset the handled state when both the copied event and the initial event are no longer active
execute unless score EVENT$command.config DatapackManager = BOOL$true DatapackManager unless score EVENT$command.config MyDatapack = BOOL$true DatapackManager run scoreboard players reset EVENT$command.config.handled MyDatapack


# command uninstall
execute unless score EVENT$command.uninstall.handled MyDatapack = BOOL$true DatapackManager if score EVENT$command.uninstall DatapackManager = BOOL$true DatapackManager run scoreboard players operation EVENT$command.uninstall.handled MyDatapack = BOOL$false DatapackManager
execute unless score EVENT$command.uninstall MyDatapack = BOOL$true DatapackManager if score EVENT$command.uninstall DatapackManager = BOOL$true DatapackManager run function mydatapack:root/events/command/uninstall/copy
execute unless score EVENT$command.uninstall DatapackManager = BOOL$true DatapackManager unless score EVENT$command.uninstall MyDatapack = BOOL$true DatapackManager run scoreboard players reset EVENT$command.uninstall.handled MyDatapack


# loop
execute if score LOOP$eventlisteners.isActive MyDatapack = BOOL$true DatapackManager run schedule function mydatapack:root/loops/eventlisteners 7t