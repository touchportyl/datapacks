# notify
tellraw @a [{"text":"","color":"gray"},{"text":" + ","color":"green"},{"text":"My Datapack","color":"white"},{"text":" >","color":"white"},{"text":" Initialized."}]

# install
# only install if hasn't been installed before
execute unless score FLAG$secret MyDatapack = FLAG$secret DatapackManager run function mydatapack:root/core/installer
scoreboard players operation FLAG$secret MyDatapack = FLAG$secret DatapackManager

# start loops
function mydatapack:root/loops/main/start
function mydatapack:root/loops/listeners/start
function mydatapack:root/loops/commandhandler/start