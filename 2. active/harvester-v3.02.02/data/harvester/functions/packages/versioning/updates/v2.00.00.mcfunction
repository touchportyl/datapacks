tellraw @a[tag=hv_debug] [{"text":"HV","color":"gold"},{"text":" > packages/versioning/updates/v2.00.00.mcfunction","color":"gray"}]

# notify
tellraw @a [{"text":"","color":"gold","hoverEvent":{"action":"show_text","value":"Alert from Harvester"}},{"text":" +"},{"text":" Harvester ","color":"gold","bold":true,"hoverEvent":{"action":"show_text","value":"Harvest and replant crops efficiently with a hoe!"}},{"text":"v3.02.02","color":"gray"},{"text":" > ","color":"white"},{"text":"Harvester updated from v1.3 to v2.0"}]

function datapackmanager-1.20:packages/effects/ui_jingle

# update
scoreboard players set VERSION$datapack.latest Harvester 20000


# cleanup
scoreboard objectives remove H_init
scoreboard objectives remove H_api
scoreboard objectives remove H_rand_2
scoreboard objectives remove H_sneak_time
tag @a remove H_harvesting
tag @a remove H_harvested