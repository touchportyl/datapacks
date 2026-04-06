# create master scoreboard
# WARNING: THIS COMMAND MUST RUN BEFORE ANYTHING ELSE
scoreboard objectives add PortylTrident dummy

# increment the datapack counter
function datapackmanager-1.21:root/datapackcounter/increment


# set the datapack's current version
scoreboard players set VERSION$datapack.current PortylTrident 10004

# set the backward and forward compatible minecraft versions
scoreboard players set VERSION$minecraft.backward PortylTrident 17
scoreboard players set VERSION$minecraft.forward PortylTrident 21

# special override to run this datapack on other versions
scoreboard players operation VERSION$ignorecompatibility.backward PortylTrident = BOOL$false DatapackManager
scoreboard players operation VERSION$ignorecompatibility.forward PortylTrident = BOOL$true DatapackManager


# check datapack version
function portyltrident:packages/versioning/check

# initialize
execute if score FLAG$isActive PortylTrident = BOOL$true DatapackManager run function portyltrident:packages/preinstaller/initialize