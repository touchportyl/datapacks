tellraw @a[tag=debug] [{"text":"> updater.mcfunction","color":"gray"}]

# create master scoreboard
# WARNING: THIS COMMAND MUST RUN BEFORE ANYTHING ELSE
scoreboard objectives add DimensionalDoors dummy [{"text":"Dimensional Doors","color":"purple"}]

# create door id
scoreboard objectives add DD_doorID dummy [{"text":"Dimensional Doors - ID","color":"purple"}]

# start tickers
function dimensionaldoors:ticker/1t-3.00.00
function dimensionaldoors:ticker/1s-3.00.00

# initialize
execute unless score DD$secret DimensionalDoors = DM$secret DatapackManager run function dimensionaldoors:packages/installer-3.00.00

# load config
function dimensionaldoors:config
