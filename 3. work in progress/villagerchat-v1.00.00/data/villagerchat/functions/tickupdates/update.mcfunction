tellraw @a[tag=debug] [{"text":"VC > tickupdates/update.mcfunction","color":"gray"}]

# functions
execute if score FUNCTION$clearschedules VillagerChat = BOOL$true DatapackManager run function villagerchat:tickupdates/functions/clearschedules
execute if score FUNCTION$disablepack VillagerChat = BOOL$true DatapackManager run function villagerchat:tickupdates/functions/disablepack
execute if score FUNCTION$loadconfig VillagerChat = BOOL$true DatapackManager run function villagerchat:tickupdates/functions/loadconfig
execute if score FUNCTION$uninstall VillagerChat = BOOL$true DatapackManager run function villagerchat:tickupdates/functions/uninstall


# cleanup
scoreboard players operation FUNCTION$clearschedules VillagerChat = BOOL$false DatapackManager
scoreboard players operation FUNCTION$disablepack VillagerChat = BOOL$false DatapackManager
scoreboard players operation FUNCTION$loadconfig VillagerChat = BOOL$false DatapackManager
scoreboard players operation FUNCTION$uninstall VillagerChat = BOOL$false DatapackManager

scoreboard players operation VC$dirty VillagerChat = BOOL$false DatapackManager


# callback
scoreboard players operation DM$dirty DatapackManager = BOOL$true DatapackManager
