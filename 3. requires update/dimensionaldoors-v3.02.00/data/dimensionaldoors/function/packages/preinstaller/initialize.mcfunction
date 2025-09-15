# notify
tellraw @a [{"text":"","color":"gray"},{"text":" + ","color":"green"},{"text":"Dimensional Doors","color":"white"},{"text":" >","color":"white"},{"text":" Initialized."}]

# install
# only install if hasn't been installed before
execute unless score FLAG$secret DimensionalDoors = FLAG$secret DatapackManager run function dimensionaldoors:root/core/installer
scoreboard players operation FLAG$secret DimensionalDoors = FLAG$secret DatapackManager

# start loops
function dimensionaldoors:root/loops/main/stop
function dimensionaldoors:root/loops/eventlisteners/stop
function dimensionaldoors:root/loops/eventhandlers/stop
function harvester:root/loops/configtriggers/stop

function dimensionaldoors:root/loops/main/start
function dimensionaldoors:root/loops/eventlisteners/start
function dimensionaldoors:root/loops/eventhandlers/start
function harvester:root/loops/configtriggers/start