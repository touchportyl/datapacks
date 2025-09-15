function datapackmanager-1.21:packages/alerts/datapackdisabled

# decrement datapack counter
execute if score COUNT$datapacks DatapackManager matches 1.. run function datapackmanager-1.21:root/datapackcounter/decrement

# uninstall datapack manager if it is the last datapack
execute if score COUNT$datapacks DatapackManager matches 0 run function datapackmanager-1.21:root/core/uninstall

# disable datapack
datapack disable "file/dimensionaldoors-v1.00.00.zip"
datapack disable "file/dimensionaldoors-v1.00.00"