# create master scoreboard
# WARNING: THIS COMMAND MUST RUN BEFORE ANYTHING ELSE
scoreboard objectives add Seaskipper dummy

# increment the datapack counter
function datapackmanager-1.21:root/datapackcounter/increment


# set the datapack's current version
scoreboard players set VERSION$datapack.current Seaskipper 10200

# set the backward and forward compatible minecraft versions
scoreboard players set VERSION$minecraft.backward Seaskipper 17
scoreboard players set VERSION$minecraft.forward Seaskipper 21

# special override to run this datapack on other versions
scoreboard players operation VERSION$ignorecompatibility.backward Seaskipper = BOOL$false DatapackManager
scoreboard players operation VERSION$ignorecompatibility.forward Seaskipper = BOOL$true DatapackManager


# check datapack version
function seaskipper:packages/versioning/check

# initialize
execute if score FLAG$isActive Seaskipper = BOOL$true DatapackManager run function seaskipper:packages/preinstaller/initialize