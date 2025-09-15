# create master scoreboard
# WARNING: THIS COMMAND MUST RUN BEFORE ANYTHING ELSE
scoreboard objectives add DimensionalDoors dummy

# increment the datapack counter
function datapackmanager-1.21:root/datapackcounter/increment


# set the datapack's current version
scoreboard players set VERSION$datapack.current DimensionalDoors 10000

# set the backward and forward compatible minecraft versions
scoreboard players set VERSION$minecraft.backward DimensionalDoors 11404
scoreboard players set VERSION$minecraft.forward DimensionalDoors 12108

# special override to run this datapack on other versions
scoreboard players operation VERSION$ignorecompatibility.backward DimensionalDoors = BOOL$false DatapackManager
scoreboard players operation VERSION$ignorecompatibility.forward DimensionalDoors = BOOL$true DatapackManager


# check datapack version
function dimensionaldoors:packages/versioning/check

# initialize
execute if score FLAG$isActive DimensionalDoors = BOOL$true DatapackManager run function dimensionaldoors:packages/preinstaller/initialize