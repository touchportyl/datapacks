tellraw @a[tag=hv_debug] [{"text":"HV","color":"gold"},{"text":" > packages/slowupdates/update.mcfunction","color":"gray"}]

# alerts
# ALERT$configurationloaded is run inline
# ALERT$mcnotcompatible is run inline
execute if score ALERT$dpbackcompatibility Harvester = BOOL$true DatapackManager run function harvester:packages/alerts/datapackbackwardscompatibility
execute if score ALERT$installed Harvester = BOOL$true DatapackManager run function harvester:packages/alerts/installed

# functions
# FUNCTION$clearschedules must be run inline
# FUNCTION$disablepack must be run inline
execute if score FUNCTION$loadconfig Harvester = BOOL$true DatapackManager run function harvester:packages/slowupdates/functions/loadconfig
execute if score FUNCTION$uninstall Harvester = BOOL$true DatapackManager run function harvester:packages/slowupdates/functions/uninstall



# loops
execute if score LOOP$tickers.2t.isLooping Harvester = BOOL$true DatapackManager run schedule function harvester:packages/tickers/2t-v3.01.00 2t
execute if score LOOP$tickers.1s.isLooping Harvester = BOOL$true DatapackManager run schedule function harvester:packages/tickers/1s-v3.01.00 1s



# cleanup
scoreboard players operation ALERT$dpbackcompatibility Harvester = BOOL$false DatapackManager
scoreboard players operation ALERT$installed Harvester = BOOL$false DatapackManager

scoreboard players operation FUNCTION$loadconfig Harvester = BOOL$false DatapackManager
scoreboard players operation FUNCTION$uninstall Harvester = BOOL$false DatapackManager

scoreboard players operation FLAG$dirty Harvester = BOOL$false DatapackManager


# callback
scoreboard players operation FLAG$dirty DatapackManager = BOOL$true DatapackManager
