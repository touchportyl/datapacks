tellraw @a[tag=debug] [{"text":"DD > tickupdates/update.mcfunction","color":"gray"}]

# functions
execute if score FUNCTION$clearschedules DimensionalDoors = BOOL$true DatapackManager run function dimensionaldoors:tickupdates/functions/clearschedules
execute if score FUNCTION$disablepack DimensionalDoors = BOOL$true DatapackManager run function dimensionaldoors:tickupdates/functions/disablepack
execute if score FUNCTION$loadconfig DimensionalDoors = BOOL$true DatapackManager run function dimensionaldoors:tickupdates/functions/loadconfig
execute if score FUNCTION$uninstall DimensionalDoors = BOOL$true DatapackManager run function dimensionaldoors:tickupdates/functions/uninstall


# cleanup
scoreboard players operation FUNCTION$clearschedules DimensionalDoors = BOOL$false DatapackManager
scoreboard players operation FUNCTION$disablepack DimensionalDoors = BOOL$false DatapackManager
scoreboard players operation FUNCTION$loadconfig DimensionalDoors = BOOL$false DatapackManager
scoreboard players operation FUNCTION$uninstall DimensionalDoors = BOOL$false DatapackManager

scoreboard players operation DD$dirty DimensionalDoors = BOOL$false DatapackManager


# callback
scoreboard players operation DM$dirty DatapackManager = BOOL$true DatapackManager
