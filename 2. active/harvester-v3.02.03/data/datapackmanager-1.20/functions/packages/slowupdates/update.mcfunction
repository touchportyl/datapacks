tellraw @a[tag=dm_debug] [{"text":"DM","color":"white"},{"text":" > packages/slowupdates/update.mcfunction","color":"gray"}]

# initialize
execute if score FUNCTION$initialize DatapackManager = BOOL$true DatapackManager if score VERSION$minecraft.forward DatapackManager matches ..20 run function datapackmanager-1.20:packages/preinstaller/initialize

# alerts
# ALERT$configurationloaded is run inline
# ALERT$datapackdisabled is run inline
# ALERT$minecraftnotcompatible is run inline
# ALERT$minecraftversion is run inline

# functions
# FUNCTION$clearschedules must be run inline
execute if score FUNCTION$loadconfig DatapackManager = BOOL$true DatapackManager run function datapackmanager-1.20:packages/slowupdates/functions/loadconfig
# notify (special case here)
execute if score FUNCTION$loadconfig DatapackManager = BOOL$true DatapackManager run function datapackmanager-1.20:packages/alerts/configurationloaded

# triggers
#execute as @a[scores={uninstall=1..}] run function datapackmanager-1.20:packages/slowupdates/triggers/uninstall
# todo: uptime trigger



# loops
execute if score VERSION$minecraft.current DatapackManager matches 14..20 run function datapackmanager-1.20:compatibility/schedule/tickers
# fallback: minecraft tick function will take over
execute unless score VERSION$minecraft.current DatapackManager matches 14..20 run scoreboard players operation FLAG$noschedulecommand DatapackManager = BOOL$true DatapackManager



# cleanup
#scoreboard players operation ALERT$alertname DatapackManager = BOOL$false DatapackManager

scoreboard players operation FUNCTION$loadconfig DatapackManager = BOOL$false DatapackManager

scoreboard players operation FLAG$dirty DatapackManager = BOOL$false DatapackManager
