# notify
tellraw @a [{"text":"","color":"gray"},{"text":" + ","color":"green"},{"text":"Seaskipper","color":"white"},{"text":" >","color":"white"},{"text":" Initialized."}]

# install
# only install if hasn't been installed before
execute unless score FLAG$secret Seaskipper = FLAG$secret DatapackManager run function seaskipper:root/core/installer
scoreboard players operation FLAG$secret Seaskipper = FLAG$secret DatapackManager

# start loops
function seaskipper:root/loops/main/stop
function seaskipper:root/loops/eventlisteners/stop
function seaskipper:root/loops/eventhandlers/stop
function seaskipper:root/loops/configtriggers/stop

function seaskipper:root/loops/main/start
function seaskipper:root/loops/eventlisteners/start
function seaskipper:root/loops/eventhandlers/start
function seaskipper:root/loops/configtriggers/start

# start packages
function seaskipper:packages/endermitescript/unload
function seaskipper:packages/endermitescript/load