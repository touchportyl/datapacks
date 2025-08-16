# notify
tellraw @a [{"text":"","color":"gray"},{"text":" + ","color":"green"},{"text":"Dimensional Doors","color":"white"},{"text":" >","color":"white"},{"text":" Updated from v3.00.00 to v3.01.00."}]

function datapackmanager-1.21:packages/effects/ui/jingle

# update
scoreboard players set VERSION$datapack.latest DimensionalDoors 30100


# change color (light_purple) of "DimensionalDoors"
scoreboard objectives modify DimensionalDoors displayname [{"text":"Dimensional Doors","color":"light_purple"}]

# move DD$secret DimensionalDoors to FLAG$secret DimensionalDoors
scoreboard players operation FLAG$secret DimensionalDoors = DD$secret DimensionalDoors
scoreboard players reset DD$secret DimensionalDoors

# change color (light_purple) and name (Door ID) of "DD_doorID"
scoreboard objectives modify DD_doorID displayname [{"text":"Door ID","color":"light_purple"}]

# cleanup