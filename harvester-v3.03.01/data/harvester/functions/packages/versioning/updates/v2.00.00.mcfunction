tellraw @a[tag=hv_debug] [{"text":"HV","color":"gold"},{"text":" > packages/versioning/updates/v2.00.00.mcfunction","color":"gray"}]

function datapackmanager-1.21:packages/effects/ui_jingle

# update
scoreboard players set VERSION$datapack.latest Harvester 20000


# cleanup
scoreboard objectives remove H_init
scoreboard objectives remove H_api
scoreboard objectives remove H_rand_2
scoreboard objectives remove H_sneak_time
tag @a remove H_harvesting
tag @a remove H_harvested