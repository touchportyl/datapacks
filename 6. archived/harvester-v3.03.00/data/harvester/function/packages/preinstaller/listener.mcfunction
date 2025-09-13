# listen for datapack manager
execute if score FLAG$isActive DatapackManager = BOOL$true DatapackManager run function harvester:packages/preinstaller/check


# loop
execute unless score FLAG$isActive DatapackManager = BOOL$true DatapackManager run schedule function harvester:packages/preinstaller/loop 2t