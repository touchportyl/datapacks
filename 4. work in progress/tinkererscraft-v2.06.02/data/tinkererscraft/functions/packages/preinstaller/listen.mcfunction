# listen for datapack manager
execute if score FLAG$isActive DatapackManager = BOOL$true DatapackManager run function tinkererscraft:packages/preinstaller/initialize

# ticker
execute unless score FLAG$isActive DatapackManager = BOOL$true DatapackManager run schedule function tinkererscraft:packages/preinstaller/listen 2t