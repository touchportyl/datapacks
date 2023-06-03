tellraw @a[tag=aw_debug] [{"text":"AW","color":"blue"},{"text":" > packages/slowupdates/functions/disablepack.mcfunction","color":"gray"}]

# notify
function datapackmanager-1.19:packages/alerts/datapackdisabled
scoreboard players reset FLAG$first DatapackManager

# disable pack
datapack disable "file/aroundtheworld-v1.00.10.zip"
datapack disable "file/aroundtheworld-v1.00.10"