# notify
tellraw @a [{"text":"","color":"gray"},{"text":" + ","color":"green"},{"text":"My Datapack","color":"white"},{"text":" >","color":"white"},{"text":" Initialized."}]

# install
# only install if hasn't been installed before
execute unless score FLAG$secret MyDatapack = FLAG$secret DatapackManager run function mydatapack:root/core/installer
scoreboard players operation FLAG$secret MyDatapack = FLAG$secret DatapackManager

# start loops
function mydatapack:root/loops/main/stop
function mydatapack:root/loops/eventlisteners/stop
function mydatapack:root/loops/eventhandlers/stop

function mydatapack:root/loops/main/start
function mydatapack:root/loops/eventlisteners/start
function mydatapack:root/loops/eventhandlers/start