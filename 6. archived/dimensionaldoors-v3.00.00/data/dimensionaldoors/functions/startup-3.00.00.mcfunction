tellraw @a[tag=debug] [{"text":"DD > startup-3.00.00.mcfunction","color":"gray"}]

# create master scoreboard
# WARNING: THIS COMMAND MUST RUN BEFORE ANYTHING ELSE
scoreboard objectives add DimensionalDoors dummy [{"text":"Dimensional Doors","color":"purple"}]

# initialize
execute unless score DD$secret DimensionalDoors = DM$secret DatapackManager run function dimensionaldoors:packages/installer-3.00.00

# load config
scoreboard players operation FUNCTION$loadconfig DimensionalDoors = BOOL$true DatapackManager
# force to run inline
function dimensionaldoors:tickupdates/update

# start tickers
function dimensionaldoors:ticker/1t-3.00.00
function dimensionaldoors:ticker/1s-3.00.00
