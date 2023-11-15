tellraw @a[tag=dd_debug] [{"text":"DD","color":"light_purple"},{"text":" > packages/versioning/updates/v3.01.00.mcfunction","color":"gray"}]

# notify
tellraw @a [{"text":"","color":"green","hoverEvent":{"action":"show_text","value":"Alert from Dimensional Doors"}},{"text":" +"},{"text":" Dimensional Doors ","color":"light_purple","bold":true,"hoverEvent":{"action":"show_text","value":"Survival friendly method to transport players and animals over long distances and across dimensions!"}},{"text":"v3.01.05","color":"gray"},{"text":" > ","color":"white"},{"text":"Dimensional Doors updated from v3.00.00 to v3.01.00"}]

function datapackmanager-1.20:packages/effects/ui_jingle

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