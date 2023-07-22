tellraw @a[tag=tc_debug] [{"text":"TC","color":"gold"},{"text":" > packages/slowupdates/update.mcfunction","color":"gray"}]

# alerts
# ALERT$configurationloaded is run inline
# ALERT$mcnotcompatible is run inline
execute if score ALERT$dpbackcompatibility TinkerersCraft = BOOL$true DatapackManager run function tinkererscraft:packages/alerts/datapackbackwardscompatibility
execute if score ALERT$installed TinkerersCraft = BOOL$true DatapackManager run function tinkererscraft:packages/alerts/installed

# functions
# FUNCTION$clearschedules must be run inline
# FUNCTION$disablepack must be run inline
execute if score FUNCTION$loadconfig TinkerersCraft = BOOL$true DatapackManager run function tinkererscraft:packages/slowupdates/functions/loadconfig
execute if score FUNCTION$uninstall TinkerersCraft = BOOL$true DatapackManager run function tinkererscraft:packages/slowupdates/functions/uninstall



# loops
execute if score LOOP$tickers.1t.isLooping TinkerersCraft = BOOL$true DatapackManager run schedule function tinkererscraft:packages/tickers/1t-v2.06.00 1t

execute if score LOOP$tickers.2t.isLooping TinkerersCraft = BOOL$true DatapackManager run schedule function tinkererscraft:packages/tickers/2t-v2.06.00 2t

execute if score LOOP$tickers.5t.isLooping TinkerersCraft = BOOL$true DatapackManager run schedule function tinkererscraft:packages/tickers/5t-v2.06.00 5t

execute if score LOOP$tickers.1s.isLooping TinkerersCraft = BOOL$true DatapackManager run schedule function tinkererscraft:packages/tickers/1s-v2.06.00 1s



# cleanup
scoreboard players operation ALERT$dpbackcompatibility TinkerersCraft = BOOL$false DatapackManager
scoreboard players operation ALERT$installed TinkerersCraft = BOOL$false DatapackManager

scoreboard players operation FUNCTION$loadconfig TinkerersCraft = BOOL$false DatapackManager
scoreboard players operation FUNCTION$uninstall TinkerersCraft = BOOL$false DatapackManager

scoreboard players operation FLAG$dirty TinkerersCraft = BOOL$false DatapackManager


# callback
scoreboard players operation FLAG$dirty DatapackManager = BOOL$true DatapackManager
