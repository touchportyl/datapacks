# create master scoreboard
# WARNING: THIS COMMAND MUST RUN BEFORE ANYTHING ELSE
scoreboard objectives add DatapackManager dummy [{"text":"Datapack Manager","color":"white"}]

scoreboard players set BOOL$false DatapackManager 0
scoreboard players set BOOL$true DatapackManager 1

#> load config directly
# config determines the latest version,
# since VERSION$minecraft.forward will always be the latest version,
# so run the pack with the highest VERSION$minecraft.forward
# same versions will override each other
function datapackmanager-1.21:root/loadconfig

# initialize
# delay by a single tick to allow all loads to run first before performing any init
scoreboard players operation EVENT$initialize DatapackManager = BOOL$true DatapackManager
scoreboard players operation FLAG$dirty DatapackManager = BOOL$true DatapackManager