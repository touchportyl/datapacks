tellraw @a[tag=dm_debug] [{"text":"DM","color":"white"},{"text":" > packages/preinstaller/initialize.mcfunction","color":"gray"}]

# win the race condition
scoreboard players operation FLAG$first DatapackManager = BOOL$true DatapackManager
# remember to set this back after 3 seconds

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
function datapackmanager-1.19:packages/slowupdates/update


# check minecraft version
function datapackmanager-1.19:packages/versioning/check


# push state to all listening datapacks
# Datapack Manager only supports 1.14 to 1.19
execute if score VERSION$minecraft.current DatapackManager matches ..13 run scoreboard players operation FLAG$isActive DatapackManager = BOOL$false DatapackManager
execute if score VERSION$minecraft.current DatapackManager matches 14..19 run scoreboard players operation FLAG$isActive DatapackManager = BOOL$true DatapackManager



# create triggers
#scoreboard objectives add uninstall trigger



# custom notification
scoreboard players operation ALERT$minecraftversion DatapackManager = BOOL$true DatapackManager
scoreboard players operation FLAG$dirty DatapackManager = BOOL$true DatapackManager

# alert
execute if score FLAG$isActive DatapackManager = BOOL$false DatapackManager run function datapackmanager-1.19:packages/alerts/minecraftnotcompatible



# cleanup
execute unless score VERSION$minecraft.current DatapackManager matches 14..19 run function datapackmanager-1.19:packages/preinstaller/resetdmfirst

schedule function datapackmanager-1.19:packages/preinstaller/resetdmfirst 3s