tellraw @a[tag=dm_debug] [{"text":"DM","color":"white"},{"text":" > packages/slowupdates/functions/loadconfig.mcfunction","color":"gray"}]

# notify
scoreboard players operation ALERT$configurationloaded DatapackManager = BOOL$true DatapackManager
scoreboard players operation FLAG$dirty DatapackManager = BOOL$true DatapackManager
#function datapackmanager-1.19:packages/alerts/configurationloaded

# default values
scoreboard players set VERSION$minecraft.backward DatapackManager 19
scoreboard players operation VERSION$minecraft.forward DatapackManager = VERSION$minecraft.backward DatapackManager

# load
function datapackmanager-1.19:config
