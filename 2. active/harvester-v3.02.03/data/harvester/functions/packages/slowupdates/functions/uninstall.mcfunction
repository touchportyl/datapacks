tellraw @a[tag=hv_debug] [{"text":"HV","color":"gold"},{"text":" > packages/slowupdates/functions/uninstall.mcfunction","color":"gray"}]

# stop loops
function harvester:packages/slowupdates/functions/clearschedules


# replace custom items
# clean up blocks

# kill entities
kill @e[type=!player,tag=Harvester]


# remove tags
#tag @e remove HV_tag


# wipe scoreboards
scoreboard objectives remove Harvester


# done
function harvester:packages/slowupdates/functions/disablepack