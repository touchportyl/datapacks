# listen for datapack manager
execute if score FLAG$isActive DatapackManager = BOOL$true DatapackManager run function $datapackFullName_lower:packages/preinstaller/initialize

# ticker
execute unless score FLAG$isActive DatapackManager = BOOL$true DatapackManager run schedule function $datapackFullName_lower:packages/preinstaller/listen 2t