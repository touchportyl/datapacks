tellraw @a[tag=$datapackID_lower_debug] [{"text":"$datapackID","color":"$datapackColor"},{"text":" > packages/slowupdates/update.mcfunction","color":"gray"}]

# alerts
execute if score ALERT$configurationloaded $datapackFullName = BOOL$true DatapackManager run function $datapackFullName_lower:packages/alerts/configurationloaded
execute if score ALERT$mcnotcompatible $datapackFullName = BOOL$true DatapackManager run function $datapackFullName_lower:packages/alerts/minecraftnotcompatible
execute if score ALERT$installed $datapackFullName = BOOL$true DatapackManager run function $datapackFullName_lower:packages/alerts/installed

# functions
execute if score FUNCTION$clearschedules $datapackFullName = BOOL$true DatapackManager run function $datapackFullName_lower:packages/slowupdates/functions/clearschedules
execute if score FUNCTION$disablepack $datapackFullName = BOOL$true DatapackManager run function $datapackFullName_lower:packages/slowupdates/functions/disablepack
execute if score FUNCTION$loadconfig $datapackFullName = BOOL$true DatapackManager run function $datapackFullName_lower:packages/slowupdates/functions/loadconfig
execute if score FUNCTION$uninstall $datapackFullName = BOOL$true DatapackManager run function $datapackFullName_lower:packages/slowupdates/functions/uninstall



# loops
execute if score LOOP$tickers.1t.isLooping $datapackFullName = BOOL$false DatapackManager run schedule clear $datapackFullName_lower:packages/tickers/1t-$datapackDisplayVersion
execute if score LOOP$tickers.1t.isLooping $datapackFullName = BOOL$true DatapackManager run schedule function $datapackFullName_lower:packages/tickers/1t-$datapackDisplayVersion 1t

execute if score LOOP$tickers.1s.isLooping $datapackFullName = BOOL$false DatapackManager run schedule clear $datapackFullName_lower:packages/tickers/1s-$datapackDisplayVersion
execute if score LOOP$tickers.1s.isLooping $datapackFullName = BOOL$true DatapackManager run schedule function $datapackFullName_lower:packages/tickers/1s-$datapackDisplayVersion 1s



# cleanup
scoreboard players operation ALERT$configurationloaded $datapackFullName = BOOL$false DatapackManager
scoreboard players operation ALERT$mcnotcompatible $datapackFullName = BOOL$false DatapackManager
scoreboard players operation ALERT$installed $datapackFullName = BOOL$false DatapackManager

scoreboard players operation FUNCTION$clearschedules $datapackFullName = BOOL$false DatapackManager
scoreboard players operation FUNCTION$disablepack $datapackFullName = BOOL$false DatapackManager
scoreboard players operation FUNCTION$loadconfig $datapackFullName = BOOL$false DatapackManager
scoreboard players operation FUNCTION$uninstall $datapackFullName = BOOL$false DatapackManager

scoreboard players operation FLAG$dirty $datapackFullName = BOOL$false DatapackManager


# callback
scoreboard players operation FLAG$dirty DatapackManager = BOOL$true DatapackManager
