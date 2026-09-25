# create master scoreboard
# WARNING: THIS COMMAND MUST RUN BEFORE ANYTHING ELSE
scoreboard objectives add DatapackManager dummy [{"text":"Datapack Manager","color":"white"}]

# set constants
scoreboard players set BOOL$false DatapackManager 0
scoreboard players set BOOL$true DatapackManager 1

# reset counter
function datapackmanager-26.3:root/datapackcounter/reset

# initialize
# delay to allow all loads to run first before performing any init
function datapackmanager-26.3:root/events/event/initialize/send

# start loops
function datapackmanager-26.3:root/loops/main/stop
function datapackmanager-26.3:root/loops/eventlisteners/stop
function datapackmanager-26.3:root/loops/eventhandlers/stop

function datapackmanager-26.3:root/loops/main/start
function datapackmanager-26.3:root/loops/eventlisteners/start
function datapackmanager-26.3:root/loops/eventhandlers/start
