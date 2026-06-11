# create master scoreboard
# WARNING: THIS COMMAND MUST RUN BEFORE ANYTHING ELSE
scoreboard objectives add MyDatapack dummy

# increment the datapack counter
function datapackmanager-1.21:root/datapackcounter/increment


# set the datapack's current version
scoreboard players set VERSION$datapack.current MyDatapack 10000

# set the backward and forward compatible minecraft versions
scoreboard players set VERSION$minecraft.backward MyDatapack 11404
scoreboard players set VERSION$minecraft.forward MyDatapack 12110

# special override to run this datapack on other versions
scoreboard players operation VERSION$ignorecompatibility.backward MyDatapack = BOOL$false DatapackManager
scoreboard players operation VERSION$ignorecompatibility.forward MyDatapack = BOOL$true DatapackManager


# check datapack version
function mydatapack:packages/versioning/check

# initialize
execute if score FLAG$isActive MyDatapack = BOOL$true DatapackManager run function mydatapack:packages/preinstaller/initialize