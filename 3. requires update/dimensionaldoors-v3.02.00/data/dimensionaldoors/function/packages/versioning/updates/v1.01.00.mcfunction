tellraw @a[tag=dd_debug] [{"text":"DD","color":"white"},{"text":" > packages/versioning/updates/v1.01.00.mcfunction","color":"gray"}]

function datapackmanager-1.21:packages/effects/ui/jingle

# update
scoreboard players set VERSION$datapack.latest DimensionalDoors 10100


# change color (light_purple) of "DimensionalDoors"
scoreboard objectives modify DimensionalDoors displayname [{"text":"Dimensional Doors","color":"light_purple"}]


# cleanup