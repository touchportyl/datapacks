tellraw @a[tag=tc_debug] [{"text":"TC","color":"gold"},{"text":" > packages/slowupdates/functions/loadconfig.mcfunction","color":"gray"}]

# notify
function tinkererscraft:packages/alerts/configurationloaded

# default values
scoreboard players set VERSION$datapack.current TinkerersCraft 10000

# load
function tinkererscraft:config