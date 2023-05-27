tellraw @a[tag=debug] [{"text":"DM > preinstaller/run.mcfunction","color":"gray"}]

# create master scoreboard
# WARNING: THIS COMMAND MUST RUN BEFORE ANYTHING ELSE
scoreboard objectives add DatapackManager dummy [{"text":"Datapack Manager","color":"white"}]

# initialize
execute unless score DM$secret DatapackManager matches 259240 run function datapackmanager:preinstaller/initialize

# load config
scoreboard players operation FUNCTION$loadconfig DatapackManager = BOOL$true DatapackManager
# force to run inline
function datapackmanager:tickupdates/update

# check minecraft version
function datapackmanager:preinstaller/versioning/minecraft/check

# check datapack version
function datapackmanager:preinstaller/versioning/datapack/check

# start tickers
# INLINE VERSIONING
execute if score VERSION$minecraft.current DatapackManager matches 13 run scoreboard players operation DM$noschedulecommand DatapackManager = BOOL$true DatapackManager
execute if score VERSION$minecraft.current DatapackManager matches 14..19 run function datapackmanager:ticker/1s

# custom notification
scoreboard players operation ALERT$minecraftversion DatapackManager = BOOL$true DatapackManager
scoreboard players operation DM$dirty DatapackManager = BOOL$true DatapackManager

# run datapack updater/installer
execute if score VERSION$minecraft.current DatapackManager matches 14..19 run function dimensionaldoors:startup-3.00.00
