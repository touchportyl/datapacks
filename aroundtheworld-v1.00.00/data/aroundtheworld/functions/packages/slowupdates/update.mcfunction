tellraw @a[tag=aw_debug] [{"text":"AW","color":"blue"},{"text":" > packages/slowupdates/update.mcfunction","color":"gray"}]

# alerts
execute if score ALERT$mcnotcompatible AroundTheWorld = BOOL$true DatapackManager run function aroundtheworld:packages/alerts/minecraftnotcompatible
execute if score ALERT$installed AroundTheWorld = BOOL$true DatapackManager run function aroundtheworld:packages/alerts/installed

# functions
execute if score FUNCTION$clearschedules AroundTheWorld = BOOL$true DatapackManager run function aroundtheworld:packages/slowupdates/functions/clearschedules
execute if score FUNCTION$disablepack AroundTheWorld = BOOL$true DatapackManager run function aroundtheworld:packages/slowupdates/functions/disablepack
execute if score FUNCTION$loadconfig AroundTheWorld = BOOL$true DatapackManager run function aroundtheworld:packages/slowupdates/functions/loadconfig
execute if score FUNCTION$uninstall AroundTheWorld = BOOL$true DatapackManager run function aroundtheworld:packages/slowupdates/functions/uninstall



# loops
execute if score LOOP$tickers.1t.isLooping DatapackManager = BOOL$false DatapackManager run schedule clear aroundtheworld:packages/tickers/1t-v1.00.00
execute if score LOOP$tickers.1t.isLooping DatapackManager = BOOL$true DatapackManager run schedule function aroundtheworld:packages/tickers/1t-v1.00.00 1t

execute if score LOOP$tickers.1s.isLooping DatapackManager = BOOL$false DatapackManager run schedule clear aroundtheworld:packages/tickers/1s-v1.00.00
execute if score LOOP$tickers.1s.isLooping DatapackManager = BOOL$true DatapackManager run schedule function aroundtheworld:packages/tickers/1s-v1.00.00 1s



# cleanup
scoreboard players operation ALERT$mcnotcompatible AroundTheWorld = BOOL$false DatapackManager
scoreboard players operation ALERT$installed AroundTheWorld = BOOL$false DatapackManager

scoreboard players operation FUNCTION$clearschedules AroundTheWorld = BOOL$false DatapackManager
scoreboard players operation FUNCTION$disablepack AroundTheWorld = BOOL$false DatapackManager
scoreboard players operation FUNCTION$loadconfig AroundTheWorld = BOOL$false DatapackManager
scoreboard players operation FUNCTION$uninstall AroundTheWorld = BOOL$false DatapackManager

scoreboard players operation FLAG$dirty AroundTheWorld = BOOL$false DatapackManager


# callback
scoreboard players operation FLAG$dirty DatapackManager = BOOL$true DatapackManager
