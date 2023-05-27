tellraw @a[tag=dm_debug] [{"text":"DM","color":"white"},{"text":" > packages/slowupdates/update.mcfunction","color":"gray"}]

# alerts
execute if score ALERT$configurationloaded DatapackManager = BOOL$true DatapackManager run function datapackmanager-1.19:packages/alerts/configurationloaded
execute if score ALERT$dpbackcompatibility DatapackManager = BOOL$true DatapackManager run function datapackmanager-1.19:packages/alerts/datapackbackwardscompatibility
execute if score ALERT$datapackdisabled DatapackManager = BOOL$true DatapackManager run function datapackmanager-1.19:packages/alerts/datapackdisabled
execute if score ALERT$mcnotcompatible DatapackManager = BOOL$true DatapackManager run function datapackmanager-1.19:packages/alerts/minecraftnotcompatible
execute if score ALERT$minecraftversion DatapackManager = BOOL$true DatapackManager run function datapackmanager-1.19:packages/alerts/minecraftversion

# functions
execute if score FUNCTION$clearschedules DatapackManager = BOOL$true DatapackManager run function datapackmanager-1.19:packages/slowupdates/functions/clearschedules
execute if score FUNCTION$loadconfig DatapackManager = BOOL$true DatapackManager run function datapackmanager-1.19:packages/slowupdates/functions/loadconfig

# triggers
#execute as @a[scores={uninstall=1..}] run function datapackmanager-1.19:packages/slowupdates/triggers/uninstall
# todo: uptime trigger



# loops
execute if score LOOP$tickers.1s.isLooping DatapackManager = BOOL$false DatapackManager run schedule clear datapackmanager-1.19:packages/tickers/1s
execute if score LOOP$tickers.1s.isLooping DatapackManager = BOOL$true DatapackManager run schedule function datapackmanager-1.19:packages/tickers/1s 1s



# cleanup
scoreboard players operation ALERT$configurationloaded DatapackManager = BOOL$false DatapackManager
scoreboard players operation ALERT$dpbackcompatibility DatapackManager = BOOL$false DatapackManager
scoreboard players operation ALERT$datapackdisabled DatapackManager = BOOL$false DatapackManager
scoreboard players operation ALERT$mcnotcompatible DatapackManager = BOOL$false DatapackManager
scoreboard players operation ALERT$minecraftversion DatapackManager = BOOL$false DatapackManager

scoreboard players operation FUNCTION$clearschedules DatapackManager = BOOL$false DatapackManager
scoreboard players operation FUNCTION$loadconfig DatapackManager = BOOL$false DatapackManager

scoreboard players operation FLAG$dirty DatapackManager = BOOL$false DatapackManager
