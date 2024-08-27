tellraw @a[tag=$datapackID_lower_debug] [{"text":"$datapackID","color":"$datapackColor"},{"text":" > packages/slowupdates/functions/loadconfig.mcfunction","color":"gray"}]

# notify
function $datapackFullName_lower:packages/alerts/configurationloaded

# default values
scoreboard players set VERSION$datapack.current $datapackFullName 10000

# load
function $datapackFullName_lower:config