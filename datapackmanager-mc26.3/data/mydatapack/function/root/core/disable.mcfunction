function datapackmanager-26.3:packages/alerts/datapackdisabled

# decrement datapack counter
execute if score COUNT$datapacks DatapackManager matches 1.. run function datapackmanager-26.3:root/datapackcounter/decrement

# uninstall datapack manager if it is the last datapack
execute if score COUNT$datapacks DatapackManager matches 0 run function datapackmanager-26.3:root/core/uninstall

# disable datapack
datapack disable "file/mydatapack-v1.00.00.zip"
datapack disable "file/mydatapack-v1.00.00"
