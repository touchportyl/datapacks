# init success
scoreboard players operation FUNCTION$initialize DatapackManager = BOOL$false DatapackManager

# set constants
scoreboard players set FLAG$secret DatapackManager 259240

scoreboard players set BOOL$false DatapackManager 0
scoreboard players set BOOL$true DatapackManager 1

scoreboard players set NUMBER$one DatapackManager 1
scoreboard players set NUMBER$two DatapackManager 2
scoreboard players set NUMBER$three DatapackManager 3
scoreboard players set NUMBER$four DatapackManager 4
scoreboard players set NUMBER$five DatapackManager 5
scoreboard players set NUMBER$six DatapackManager 6
scoreboard players set NUMBER$seven DatapackManager 7
scoreboard players set NUMBER$eight DatapackManager 8
scoreboard players set NUMBER$nine DatapackManager 9

# load config
scoreboard players operation FUNCTION$loadconfig DatapackManager = BOOL$true DatapackManager

# start tickers
scoreboard players operation LOOP$tickers.1s.isLooping DatapackManager = BOOL$true DatapackManager

# force to run inline
function datapackmanager-1.20:packages/slowupdates/update


# check minecraft version
function datapackmanager-1.20:packages/versioning/check


# push state to all listening datapacks
# Datapack Manager only supports 1.14 to 1.20
execute if score VERSION$minecraft.current DatapackManager matches ..13 run scoreboard players operation FLAG$isActive DatapackManager = BOOL$false DatapackManager
execute if score VERSION$minecraft.current DatapackManager matches 14..20 run scoreboard players operation FLAG$isActive DatapackManager = BOOL$true DatapackManager



# create triggers
#scoreboard objectives add uninstall trigger



# custom notification
execute if score VERSION$minecraft.current DatapackManager matches 14..20 run function datapackmanager-1.20:packages/alerts/minecraftversion