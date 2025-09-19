# create master scoreboard
# WARNING: THIS COMMAND MUST RUN BEFORE ANYTHING ELSE
scoreboard objectives add AroundTheWorld dummy

# increment the datapack counter
function datapackmanager-1.21:root/datapackcounter/increment


# set the datapack's current version
scoreboard players set VERSION$datapack.current AroundTheWorld 10000

# set the backward and forward compatible minecraft versions
scoreboard players set VERSION$minecraft.backward AroundTheWorld 11404
scoreboard players set VERSION$minecraft.forward AroundTheWorld 12108

# special override to run this datapack on other versions
scoreboard players operation VERSION$ignorecompatibility.backward AroundTheWorld = BOOL$false DatapackManager
scoreboard players operation VERSION$ignorecompatibility.forward AroundTheWorld = BOOL$true DatapackManager


# check datapack version
function aroundtheworld:packages/versioning/check

# initialize
execute if score FLAG$isActive AroundTheWorld = BOOL$true DatapackManager run function aroundtheworld:packages/preinstaller/initialize