tellraw @a[tag=hv_debug] [{"text":"HV","color":"gold"},{"text":" > packages/slowupdates/functions/disablepack.mcfunction","color":"gray"}]

# notify
function datapackmanager-1.19:packages/alerts/datapackdisabled
scoreboard players reset FLAG$first DatapackManager

# disable pack
datapack disable "file/harvester-v3.01.13.zip"
datapack disable "file/harvester-v3.01.13"