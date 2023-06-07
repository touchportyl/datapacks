tellraw @a[tag=dd_debug] [{"text":"DD","color":"light_purple"},{"text":" > packages/slowupdates/functions/loadconfig.mcfunction","color":"gray"}]

# notify
function dimensionaldoors:packages/alerts/configurationloaded

# default values
scoreboard players set VERSION$datapack.current DimensionalDoors 10000

# load
function dimensionaldoors:config