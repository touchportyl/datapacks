tellraw @a[tag=debug] [{"text":"DD > config.mcfunction","color":"gray"}]

# toggle door explosion on destroy
scoreboard players operation CONFIG$destroyexplosively DimensionalDoors = BOOL$false DatapackManager


# WARNING: ONLY CHANGE THESE CONFIGURATION OPTIONS IF YOU KNOW WHAT YOU'RE DOING
# CHANGING THESE SETTINGS COULD FORCE THE DATAPACK TO RUN COMMANDS THAT IT SHOULDN'T

# set the datapack's current version
scoreboard players set VERSION$datapack.current DatapackManager 30000
