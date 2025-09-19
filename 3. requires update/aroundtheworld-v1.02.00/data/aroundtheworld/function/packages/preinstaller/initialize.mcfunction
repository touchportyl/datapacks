# notify
tellraw @a [{"text":"","color":"gray"},{"text":" + ","color":"green"},{"text":"Around The World","color":"white"},{"text":" >","color":"white"},{"text":" Initialized."}]

# install
# only install if hasn't been installed before
execute unless score FLAG$secret AroundTheWorld = FLAG$secret DatapackManager run function aroundtheworld:root/core/installer
scoreboard players operation FLAG$secret AroundTheWorld = FLAG$secret DatapackManager

# start loops
function aroundtheworld:root/loops/main/stop
function aroundtheworld:root/loops/eventlisteners/stop
function aroundtheworld:root/loops/eventhandlers/stop
function harvester:root/loops/configtriggers/stop

function aroundtheworld:root/loops/main/start
function aroundtheworld:root/loops/eventlisteners/start
function aroundtheworld:root/loops/eventhandlers/start
function harvester:root/loops/configtriggers/start