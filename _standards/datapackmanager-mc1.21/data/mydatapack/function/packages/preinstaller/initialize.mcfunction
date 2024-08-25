# create master scoreboard
# WARNING: THIS COMMAND MUST RUN BEFORE ANYTHING ELSE
scoreboard objectives add MyDatapack dummy

# increment the datapack counter
function datapackmanager-1.21:root/datapackcounter/increment

# notify
tellraw @a [{"text":"","color":"gray"},{"text":" + ","color":"green"},{"text":"My Datapack","color":"white"},{"text":" >","color":"white"},{"text":" Initialized."}]

# install
# only install if hasn't been installed before
execute unless score FLAG$secret MyDatapack = FLAG$secret DatapackManager run function mydatapack:root/core/installer
scoreboard players operation FLAG$secret MyDatapack = FLAG$secret DatapackManager

# check datapack version
# don't need to check if the current config version is already the latest
# updates only have to run if the current version is later than the latest
execute unless score VERSION$datapack.current MyDatapack = VERSION$datapack.latest MyDatapack run function mydatapack:packages/versioning/check

# start loops
function mydatapack:root/loops/main/start
function mydatapack:root/loops/listeners/start
function mydatapack:root/loops/commandhandler/start