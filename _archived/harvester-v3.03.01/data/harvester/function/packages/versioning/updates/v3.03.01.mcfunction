tellraw @a[tag=hv_debug] [{"text":"HV","color":"gold"},{"text":" > packages/versioning/updates/v3.03.01.mcfunction","color":"gray"}]

function datapackmanager-1.21:packages/effects/ui_jingle

# update
scoreboard players set VERSION$datapack.latest Harvester 30301


# added config
scoreboard players operation CONFIG$harvestxp Harvester = BOOL$true DatapackManager
scoreboard players operation CONFIG$harvestxpbonus Harvester = BOOL$true DatapackManager
scoreboard players operation CONFIG$toolbreaking Harvester = BOOL$false DatapackManager

# create config triggers (if not already created)
function harvester:packages/configtriggers/create