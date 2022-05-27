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

# announce
tellraw @a[tag=debug] [{"text":"","color":"gray","hoverEvent":{"action":"show_text","value":"Alert generated by Datapack Manager"}},{"text":"\n Datapack Manager","color":"gold","bold":"true"},{"text":"\n Playing on Minecraft 1."},{"score":{"name":"VERSION$minecraft.current","objective":"DatapackManager"}}]

# run datapack updater/installer
#function tinkererscraft:updater-1.00.00
