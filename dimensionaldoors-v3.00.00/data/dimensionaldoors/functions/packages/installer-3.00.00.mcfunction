tellraw @a[tag=debug] [{"text":"DD > packages/installer-3.00.00.mcfunction","color":"gray"}]

# set secret
scoreboard players operation DD$secret DimensionalDoors = DM$secret DatapackManager


# create door id
scoreboard objectives add DD_doorID dummy [{"text":"Dimensional Doors - ID","color":"purple"}]
