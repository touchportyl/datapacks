tellraw @a[tag=debug] [{"text":"> config.mcfunction","color":"gray"}]

# toggle door explosion on destroy
scoreboard players operation CONFIG$destroyexplosively DimensionalDoors = BOOL$false DatapackManager
