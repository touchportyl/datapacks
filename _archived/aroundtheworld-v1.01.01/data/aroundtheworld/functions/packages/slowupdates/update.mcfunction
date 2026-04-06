tellraw @a[tag=aw_debug] [{"text":"AW","color":"blue"},{"text":" > packages/slowupdates/update.mcfunction","color":"gray"}]

# alerts
# ALERT$configurationloaded is run inline
# ALERT$mcnotcompatible is run inline
execute if score ALERT$dpbackcompatibility AroundTheWorld = BOOL$true DatapackManager run function aroundtheworld:packages/alerts/datapackbackwardscompatibility
execute if score ALERT$installed AroundTheWorld = BOOL$true DatapackManager run function aroundtheworld:packages/alerts/installed

# functions
# FUNCTION$clearschedules must be run inline
# FUNCTION$disablepack must be run inline
execute if score FUNCTION$loadconfig AroundTheWorld = BOOL$true DatapackManager run function aroundtheworld:packages/slowupdates/functions/loadconfig
execute if score FUNCTION$uninstall AroundTheWorld = BOOL$true DatapackManager run function aroundtheworld:packages/slowupdates/functions/uninstall



# loops
execute if score LOOP$tickers.1t.isLooping AroundTheWorld = BOOL$true DatapackManager run schedule function aroundtheworld:packages/tickers/1t-v1.00.00 1t

execute if score LOOP$tickers.1s.isLooping AroundTheWorld = BOOL$true DatapackManager run schedule function aroundtheworld:packages/tickers/1s-v1.00.00 1s



# cleanup
scoreboard players operation ALERT$dpbackcompatibility AroundTheWorld = BOOL$false DatapackManager
scoreboard players operation ALERT$installed AroundTheWorld = BOOL$false DatapackManager

scoreboard players operation FUNCTION$loadconfig AroundTheWorld = BOOL$false DatapackManager
scoreboard players operation FUNCTION$uninstall AroundTheWorld = BOOL$false DatapackManager

scoreboard players operation FLAG$dirty AroundTheWorld = BOOL$false DatapackManager


# callback
scoreboard players operation FLAG$dirty DatapackManager = BOOL$true DatapackManager
