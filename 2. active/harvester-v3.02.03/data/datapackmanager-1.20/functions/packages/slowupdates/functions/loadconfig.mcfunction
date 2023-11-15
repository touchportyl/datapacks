tellraw @a[tag=dm_debug] [{"text":"DM","color":"white"},{"text":" > packages/slowupdates/functions/loadconfig.mcfunction","color":"gray"}]

# default values
scoreboard players set VERSION$minecraft.backward DatapackManager 20
scoreboard players operation VERSION$minecraft.forward DatapackManager = VERSION$minecraft.backward DatapackManager

# load
function datapackmanager-1.20:config
