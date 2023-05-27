tellraw @a[tag=aw_debug] [{"text":"AW","color":"blue"},{"text":" > packages/slowupdates/functions/loadconfig.mcfunction","color":"gray"}]

# notify
function datapackmanager-1.19:packages/alerts/configurationloaded

# default values
scoreboard players set VERSION$datapack.current AroundTheWorld 10000

# load
function aroundtheworld:config
