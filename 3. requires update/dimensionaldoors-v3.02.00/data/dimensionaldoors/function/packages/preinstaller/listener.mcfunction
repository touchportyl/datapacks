# listen for datapack manager
execute if score FLAG$isActive DatapackManager = BOOL$true DatapackManager run function dimensionaldoors:packages/preinstaller/check


# loop
execute unless score FLAG$isActive DatapackManager = BOOL$true DatapackManager run schedule function dimensionaldoors:packages/preinstaller/loop 2t