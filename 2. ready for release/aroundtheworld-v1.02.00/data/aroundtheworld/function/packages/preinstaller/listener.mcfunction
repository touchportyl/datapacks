# listen for datapack manager
execute if score FLAG$isActive DatapackManager = BOOL$true DatapackManager run function aroundtheworld:packages/preinstaller/check


# loop
execute unless score FLAG$isActive DatapackManager = BOOL$true DatapackManager run schedule function aroundtheworld:packages/preinstaller/listener 2t