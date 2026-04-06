tellraw @a[tag=aw_debug] [{"text":"AW","color":"blue"},{"text":" > packages/slowupdates/functions/uninstall.mcfunction","color":"gray"}]

# stop loops
function aroundtheworld:packages/slowupdates/functions/clearschedules


# replace custom items
# clean up blocks

# kill entities
kill @e[type=!player,tag=AroundTheWorld]


# remove tags
#tag @e remove AW_tag


# wipe scoreboards
scoreboard objectives remove AroundTheWorld


# done
function aroundtheworld:packages/slowupdates/functions/disablepack