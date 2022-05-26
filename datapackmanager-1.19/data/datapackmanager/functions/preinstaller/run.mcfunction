tellraw @a[tag=debug] [{"text":"> preinstaller/run.mcfunction","color":"gray"}]

# create master scoreboard
# WARNING: THIS COMMAND MUST RUN BEFORE ANYTHING ELSE
scoreboard objectives add DatapackManager dummy [{"text":"Datapack Manager","color":"white"}]

# initialize
execute unless score DM$secret DatapackManager matches 259240 run function datapackmanager:preinstaller/initialize

# load config
scoreboard players operation FUNCTION$loadconfig DatapackManager = BOOL$true DatapackManager
function datapackmanager:tickupdates/update

# check minecraft version
function datapackmanager:preinstaller/versioning/minecraft/check

# check datapack version
function datapackmanager:preinstaller/versioning/datapack/check

# start tickers
function datapackmanager:ticker/1s
function datapackmanager:ticker/60s

# run datapack updater/installer
function tinkererscraft:updater