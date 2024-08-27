# notify
tellraw @a [{"text":"","color":"gray"},{"text":" + ","color":"green"},{"text":"Dimensional Doors","color":"white"},{"text":" >","color":"white"},{"text":" Initialized."}]

# install
# only install if hasn't been installed before
execute unless score FLAG$secret DimensionalDoors = FLAG$secret DatapackManager run function dimensionaldoors:root/core/installer
scoreboard players operation FLAG$secret DimensionalDoors = FLAG$secret DatapackManager

# start loops
function dimensionaldoors:root/loops/main/start
function dimensionaldoors:root/loops/slowmain/start
function dimensionaldoors:root/loops/listeners/start
function dimensionaldoors:root/loops/commandhandler/start