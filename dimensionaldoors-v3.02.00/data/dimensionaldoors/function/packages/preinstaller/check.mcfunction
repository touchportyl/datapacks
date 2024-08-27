# create master scoreboard
# WARNING: THIS COMMAND MUST RUN BEFORE ANYTHING ELSE
scoreboard objectives add DimensionalDoors dummy [{"text":"Dimensional Doors","color":"light_purple"}]

# increment the datapack counter
function datapackmanager-1.21:root/datapackcounter/increment


# set the datapack's current version
scoreboard players set VERSION$datapack.current DimensionalDoors 30200

# set the backward and forward compatible minecraft versions
scoreboard players set VERSION$minecraft.backward DimensionalDoors 14
scoreboard players set VERSION$minecraft.forward DimensionalDoors 21

# special override to run this datapack on other versions
scoreboard players operation VERSION$ignorecompatibility.backward DimensionalDoors = BOOL$false DatapackManager
scoreboard players operation VERSION$ignorecompatibility.forward DimensionalDoors = BOOL$true DatapackManager


# check datapack version
function dimensionaldoors:packages/versioning/check

# initialize
execute if score FLAG$isActive DimensionalDoors = BOOL$true DatapackManager run function dimensionaldoors:packages/preinstaller/initialize