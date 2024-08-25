# notify
tellraw @a [{"text":"","color":"gray"},{"text":" + ","color":"green"},{"text":"Dimensional Doors","color":"white"},{"text":" >","color":"white"},{"text":" Updated from v3.01.04 to v3.02.00."}]

function datapackmanager-1.21:packages/effects/ui/jingle

# update
scoreboard players set VERSION$datapack.latest DimensionalDoors 30200

# add new tags to existing oak doors
tag @e[tag=DD_portal,tag=DD_oak] add DD_particle_C

# cleanup