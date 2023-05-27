tellraw @a[tag=debug] [{"text":"DM > tickupdates/update.mcfunction","color":"gray"}]

# alerts
execute if score ALERT$configurationloaded DatapackManager = BOOL$true DatapackManager run function datapackmanager:tickupdates/alerts/configurationloaded
execute if score ALERT$dpbackcompatibility DatapackManager = BOOL$true DatapackManager run function datapackmanager:tickupdates/alerts/datapackbackwardscompatibility
execute if score ALERT$datapackdisabled DatapackManager = BOOL$true DatapackManager run function datapackmanager:tickupdates/alerts/datapackdisabled
execute if score ALERT$mcnotcompatible DatapackManager = BOOL$true DatapackManager run function datapackmanager:tickupdates/alerts/minecraftnotcompatible
execute if score ALERT$minecraftversion DatapackManager = BOOL$true DatapackManager run function datapackmanager:tickupdates/alerts/minecraftversion

# functions
execute if score FUNCTION$clearschedules DatapackManager = BOOL$true DatapackManager run function datapackmanager:tickupdates/functions/clearschedules
execute if score FUNCTION$loadconfig DatapackManager = BOOL$true DatapackManager run function datapackmanager:tickupdates/functions/loadconfig

# triggers
#execute as @a[scores={uninstall=1..}] run function datapackmanager:tickupdates/triggers/uninstall
# todo: uptime trigger


# cleanup
scoreboard players operation ALERT$configurationloaded DatapackManager = BOOL$false DatapackManager
scoreboard players operation ALERT$dpbackcompatibility DatapackManager = BOOL$false DatapackManager
scoreboard players operation ALERT$datapackdisabled DatapackManager = BOOL$false DatapackManager
scoreboard players operation ALERT$mcnotcompatible DatapackManager = BOOL$false DatapackManager
scoreboard players operation ALERT$minecraftversion DatapackManager = BOOL$false DatapackManager

scoreboard players operation FUNCTION$clearschedules DatapackManager = BOOL$false DatapackManager
scoreboard players operation FUNCTION$loadconfig DatapackManager = BOOL$false DatapackManager

scoreboard players operation DM$dirty DatapackManager = BOOL$false DatapackManager
