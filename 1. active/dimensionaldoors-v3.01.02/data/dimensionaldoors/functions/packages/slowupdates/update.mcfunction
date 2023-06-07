tellraw @a[tag=dd_debug] [{"text":"DD","color":"light_purple"},{"text":" > packages/slowupdates/update.mcfunction","color":"gray"}]

# alerts
# ALERT$configurationloaded is run inline
# ALERT$mcnotcompatible is run inline
execute if score ALERT$dpbackcompatibility DimensionalDoors = BOOL$true DatapackManager run function dimensionaldoors:packages/alerts/datapackbackwardscompatibility
execute if score ALERT$installed DimensionalDoors = BOOL$true DatapackManager run function dimensionaldoors:packages/alerts/installed

# functions
# FUNCTION$clearschedules must be run inline
# FUNCTION$disablepack must be run inline
execute if score FUNCTION$loadconfig DimensionalDoors = BOOL$true DatapackManager run function dimensionaldoors:packages/slowupdates/functions/loadconfig
execute if score FUNCTION$uninstall DimensionalDoors = BOOL$true DatapackManager run function dimensionaldoors:packages/slowupdates/functions/uninstall



# loops
execute if score LOOP$tickers.1t.isLooping DimensionalDoors = BOOL$true DatapackManager run schedule function dimensionaldoors:packages/tickers/1t-v3.01.00 1t

execute if score LOOP$tickers.1s.isLooping DimensionalDoors = BOOL$true DatapackManager run schedule function dimensionaldoors:packages/tickers/1s-v3.01.00 1s



# cleanup
scoreboard players operation ALERT$dpbackcompatibility DimensionalDoors = BOOL$false DatapackManager
scoreboard players operation ALERT$installed DimensionalDoors = BOOL$false DatapackManager

scoreboard players operation FUNCTION$loadconfig DimensionalDoors = BOOL$false DatapackManager
scoreboard players operation FUNCTION$uninstall DimensionalDoors = BOOL$false DatapackManager

scoreboard players operation FLAG$dirty DimensionalDoors = BOOL$false DatapackManager


# callback
scoreboard players operation FLAG$dirty DatapackManager = BOOL$true DatapackManager
