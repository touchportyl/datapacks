# listen for datapack manager
execute if score FLAG$isActive DatapackManager = BOOL$true DatapackManager run function dimensionaldoors:packages/preinstaller/check

# ticker
execute unless score FLAG$isActive DatapackManager = BOOL$true DatapackManager run schedule function dimensionaldoors:packages/preinstaller/listener 2t