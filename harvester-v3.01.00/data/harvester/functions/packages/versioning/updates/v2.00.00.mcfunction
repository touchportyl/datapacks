tellraw @a[tag=hv_debug] [{"text":"HV","color":"gold"},{"text":" > packages/versioning/updates/v2.00.00.mcfunction","color":"gray"}]

# notify
tellraw @a [{"text":"","color":"red","hoverEvent":{"action":"show_text","value":"Error from Harvester"}},{"text":" +"},{"text":" Harvester ","color":"gold","bold":true,"hoverEvent":{"action":"show_text","value":"Harvest and replant crops efficiently with a hoe!"}},{"text":"v3.01.00","color":"gray"},{"text":" > ","color":"white"},{"text":"Harvester updated from v1.3 to v2.0"}]

function datapackmanager-1.19:packages/effects/ui_jingle

# update
scoreboard players set VERSION$datapack.latest Harvester 20000


# cleanup
scoreboard objectives remove H_init
scoreboard objectives remove H_api
scoreboard objectives remove H_rand_2
scoreboard objectives remove H_sneak_time
tag @a remove H_harvesting
tag @a remove H_harvested