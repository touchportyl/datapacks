# create master scoreboard
# WARNING: THIS COMMAND MUST RUN BEFORE ANYTHING ELSE
scoreboard objectives add DatapackManager dummy [{"text":"Datapack Manager","color":"white"}]

# set constants
scoreboard players set BOOL$false DatapackManager 0
scoreboard players set BOOL$true DatapackManager 1


# reset counter
function datapackmanager-1.21:root/datapackcounter/reset


# initialize
# delay to allow all loads to run first before performing any init
scoreboard players operation EVENT$initialize DatapackManager = BOOL$true DatapackManager

# start datapack manager
function datapackmanager-1.21:root/loops/main/start