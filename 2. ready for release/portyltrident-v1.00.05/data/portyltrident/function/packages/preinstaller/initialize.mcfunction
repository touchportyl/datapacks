# notify
tellraw @a [{"text":"","color":"gray"},{"text":" + ","color":"green"},{"text":"Portyl Trident","color":"white"},{"text":" >","color":"white"},{"text":" Initialized."}]

# install
# only install if hasn't been installed before
execute unless score FLAG$secret PortylTrident = FLAG$secret DatapackManager run function portyltrident:root/core/installer
scoreboard players operation FLAG$secret PortylTrident = FLAG$secret DatapackManager

# start loops
function portyltrident:root/loops/main/stop
function portyltrident:root/loops/eventlisteners/stop
function portyltrident:root/loops/eventhandlers/stop
function aroundtheworld:root/loops/configtriggers/stop

function portyltrident:root/loops/main/start
function portyltrident:root/loops/eventlisteners/start
function portyltrident:root/loops/eventhandlers/start
function aroundtheworld:root/loops/configtriggers/start