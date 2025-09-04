# create master scoreboard
# WARNING: THIS COMMAND MUST RUN BEFORE ANYTHING ELSE
scoreboard objectives add Harvester dummy

# increment the datapack counter
function datapackmanager-1.21:root/datapackcounter/increment


# set the datapack's current version
scoreboard players set VERSION$datapack.current Harvester 30301

# set the backward and forward compatible minecraft versions
scoreboard players set VERSION$minecraft.backward Harvester 11404
scoreboard players set VERSION$minecraft.forward Harvester 12108

# special override to run this datapack on other versions
scoreboard players operation VERSION$ignorecompatibility.backward Harvester = BOOL$false DatapackManager
scoreboard players operation VERSION$ignorecompatibility.forward Harvester = BOOL$true DatapackManager


# check datapack version
function harvester:packages/versioning/check

# initialize
execute if score FLAG$isActive Harvester = BOOL$true DatapackManager run function harvester:packages/preinstaller/initialize