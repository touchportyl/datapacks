# listen for datapack manager
execute if score FLAG$isActive DatapackManager = BOOL$true DatapackManager run function mydatapack:packages/preinstaller/check


# loop
execute unless score FLAG$isActive DatapackManager = BOOL$true DatapackManager run schedule function mydatapack:packages/preinstaller/listener 2t