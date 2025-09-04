# notify
tellraw @a [{"text":"","color":"gray"},{"text":" + ","color":"green"},{"text":"Harvester","color":"white"},{"text":" >","color":"white"},{"text":" Initialized."}]

# install
# only install if hasn't been installed before
execute unless score FLAG$secret Harvester = FLAG$secret DatapackManager run function harvester:root/core/installer
scoreboard players operation FLAG$secret Harvester = FLAG$secret DatapackManager


# compatibility

# no predicates in mc1.14.00
execute if score VERSION$minecraft.current.minor DatapackManager matches 14 run scoreboard objectives add HV_sneak_time minecraft.custom:minecraft.sneak_time [{"text":"Sneak Detection for Harvester","color":"gold"}]
execute unless score VERSION$minecraft.current.minor DatapackManager matches 14 run scoreboard objectives remove HV_sneak_time


# start loops
function harvester:root/loops/main/stop
function harvester:root/loops/eventlisteners/stop
function harvester:root/loops/eventhandlers/stop
function harvester:root/loops/configtriggers/stop

function harvester:root/loops/main/start
function harvester:root/loops/eventlisteners/start
function harvester:root/loops/eventhandlers/start
function harvester:root/loops/configtriggers/start