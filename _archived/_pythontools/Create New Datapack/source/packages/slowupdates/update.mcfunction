tellraw @a[tag=$datapackID_lower_debug] [{"text":"$datapackID","color":"$datapackColor"},{"text":" > packages/slowupdates/update.mcfunction","color":"gray"}]

# alerts
# ALERT$configurationloaded is run inline
# ALERT$mcnotcompatible is run inline
execute if score ALERT$dpbackcompatibility $datapackFullName = BOOL$true DatapackManager run function $datapackFullName_lower:packages/alerts/datapackbackwardscompatibility
execute if score ALERT$installed $datapackFullName = BOOL$true DatapackManager run function $datapackFullName_lower:packages/alerts/installed

# functions
# FUNCTION$clearschedules must be run inline
# FUNCTION$disablepack must be run inline
execute if score FUNCTION$loadconfig $datapackFullName = BOOL$true DatapackManager run function $datapackFullName_lower:packages/slowupdates/functions/loadconfig
execute if score FUNCTION$uninstall $datapackFullName = BOOL$true DatapackManager run function $datapackFullName_lower:packages/slowupdates/functions/uninstall



# loops
execute if score LOOP$tickers.1t.isLooping $datapackFullName = BOOL$true DatapackManager run schedule function $datapackFullName_lower:packages/tickers/1t-$datapackDisplayVersion 1t

execute if score LOOP$tickers.1s.isLooping $datapackFullName = BOOL$true DatapackManager run schedule function $datapackFullName_lower:packages/tickers/1s-$datapackDisplayVersion 1s



# cleanup
scoreboard players operation ALERT$dpbackcompatibility $datapackFullName = BOOL$false DatapackManager
scoreboard players operation ALERT$installed $datapackFullName = BOOL$false DatapackManager

scoreboard players operation FUNCTION$loadconfig $datapackFullName = BOOL$false DatapackManager
scoreboard players operation FUNCTION$uninstall $datapackFullName = BOOL$false DatapackManager

scoreboard players operation FLAG$dirty $datapackFullName = BOOL$false DatapackManager


# callback
scoreboard players operation FLAG$dirty DatapackManager = BOOL$true DatapackManager
