# listen for datapack manager
execute if score FLAG$isActive DatapackManager = BOOL$true DatapackManager run function harvester:packages/preinstaller/initialize

# ticker
execute unless score FLAG$isActive DatapackManager = BOOL$true DatapackManager run schedule function harvester:packages/preinstaller/listen 2t