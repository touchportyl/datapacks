tellraw @a[tag=tc_debug] [{"text":"TC","color":"gold"},{"text":" > packages/slowupdates/functions/uninstall.mcfunction","color":"gray"}]

# stop loops
function tinkererscraft:packages/slowupdates/functions/clearschedules


# replace custom items
# clean up blocks

# kill entities
kill @e[type=!player,tag=TinkerersCraft]


# remove tags
#tag @e remove TC_tag


# wipe scoreboards
scoreboard objectives remove TinkerersCraft

# timers
scoreboard objectives remove TC_OutputTimer
scoreboard objectives remove TC_SmeltingTimer
scoreboard objectives remove TC_FlamingTimer
scoreboard objectives remove TC_ShinyTimer
scoreboard objectives remove TC_LungeTimer
scoreboard objectives remove TC_RiptideTimer

# calculation buffers
scoreboard objectives remove TC_bIronOre
scoreboard objectives remove TC_bGoldOre
scoreboard objectives remove TC_bIron
scoreboard objectives remove TC_bGold
scoreboard objectives remove TC_bIronBlock
scoreboard objectives remove TC_bGoldBlock
scoreboard objectives remove TC_bObsidian

# storage
scoreboard objectives remove TC_lCapacity
scoreboard objectives remove TC_lIron
scoreboard objectives remove TC_lGold
scoreboard objectives remove TC_lObsidian
scoreboard objectives remove TC_lIrgol
scoreboard objectives remove TC_lObdiam


# done
function tinkererscraft:packages/slowupdates/functions/disablepack