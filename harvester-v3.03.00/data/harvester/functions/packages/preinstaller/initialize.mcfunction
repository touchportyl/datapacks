# notify
tellraw @a [{"text":"","color":"gray"},{"text":" + ","color":"green"},{"text":"Harvester","color":"white"},{"text":" >","color":"white"},{"text":" Initialized."}]

# install
# only install if hasn't been installed before
execute unless score FLAG$secret Harvester = FLAG$secret DatapackManager run function harvester:root/core/installer
scoreboard players operation FLAG$secret Harvester = FLAG$secret DatapackManager

# start loops
function harvester:root/loops/main/stop
function harvester:root/loops/eventlisteners/stop
function harvester:root/loops/eventhandlers/stop

function harvester:root/loops/main/start
function harvester:root/loops/eventlisteners/start
function harvester:root/loops/eventhandlers/start