tellraw @a[tag=debug] [{"text":"> tickupdates/update.mcfunction","color":"gray"}]

# alerts
execute if score ALERT$mcnotcompatible DatapackManager = BOOL$true DatapackManager run function datapackmanager:tickupdates/alerts/minecraftnotcompatible
execute if score ALERT$dpbackcompatibility DatapackManager = BOOL$true DatapackManager run function datapackmanager:tickupdates/alerts/datapackbackwardscompatibility

# functions
execute if score FUNCTION$cleanuninstall DatapackManager = BOOL$true DatapackManager run function datapackmanager:tickupdates/functions/cleanuninstall
execute if score FUNCTION$disablepack DatapackManager = BOOL$true DatapackManager run function datapackmanager:tickupdates/functions/disablepack
execute if score FUNCTION$loadconfig DatapackManager = BOOL$true DatapackManager run function datapackmanager:tickupdates/functions/loadconfig

# triggers
#execute as @a[scores={uninstall=1..}] run function datapackmanager:tickupdates/triggers/uninstall
# todo: uptime trigger


# cleanup
scoreboard players operation ALERT$mcnotcompatible DatapackManager = BOOL$false DatapackManager
scoreboard players operation ALERT$dpbackcompatibility DatapackManager = BOOL$false DatapackManager
scoreboard players operation FUNCTION$cleanuninstall DatapackManager = BOOL$false DatapackManager
scoreboard players operation FUNCTION$disablepack DatapackManager = BOOL$false DatapackManager
scoreboard players operation FUNCTION$loadconfig DatapackManager = BOOL$false DatapackManager
scoreboard players operation DM$dirty DatapackManager = BOOL$false DatapackManager
