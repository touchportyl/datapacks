tellraw @a[tag=debug] [{"text":"VC > tickupdates/functions/uninstall.mcfunction","color":"gray"}]

# stop loops
function villagerchat:tickupdates/functions/clearschedules


# kill entities
kill @e[type=!player,tag=VillagerChat]


# remove tags
tag @e remove DD_new


# wipe scoreboards
scoreboard objectives remove VillagerChat


# done
function villagerchat:tickupdates/functions/disablepack
