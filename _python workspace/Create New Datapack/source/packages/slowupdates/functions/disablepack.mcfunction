tellraw @a[tag=$datapackID_lower_debug] [{"text":"$datapackID","color":"$datapackColor"},{"text":" > packages/slowupdates/functions/disablepack.mcfunction","color":"gray"}]

# notify
function datapackmanager-1.19:packages/alerts/datapackdisabled

# disable pack
datapack disable "file/$datapackFullName_lower-$datapackDisplayVersion.zip"
datapack disable "file/$datapackFullName_lower-$datapackDisplayVersion"