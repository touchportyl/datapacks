tellraw @a[tag=hv_debug] [{"text":"HV","color":"gold"},{"text":" > packages/slowupdates/functions/loadconfig.mcfunction","color":"gray"}]

# notify
function harvester:packages/alerts/configurationloaded

# default values
scoreboard players set VERSION$datapack.current Harvester 10000

# load
function harvester:config