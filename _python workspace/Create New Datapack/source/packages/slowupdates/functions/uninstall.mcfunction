tellraw @a[tag=$datapackID_lower_debug] [{"text":"$datapackID","color":"$datapackColor"},{"text":" > packages/slowupdates/functions/uninstall.mcfunction","color":"gray"}]

# stop loops
function $datapackFullName_lower:packages/slowupdates/functions/clearschedules


# replace custom items
# clean up blocks

# kill entities
kill @e[type=!player,tag=$datapackFullName]


# remove tags
#tag @e remove $datapackID_tag


# wipe scoreboards
scoreboard objectives remove $datapackFullName


# done
function $datapackFullName_lower:packages/slowupdates/functions/disablepack