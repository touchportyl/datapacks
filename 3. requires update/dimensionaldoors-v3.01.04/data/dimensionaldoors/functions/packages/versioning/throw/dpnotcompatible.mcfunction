tellraw @a[tag=dd_debug] [{"text":"DD","color":"light_purple"},{"text":" > packages/versioning/throw/dpnotcompatible.mcfunction","color":"gray"}]

scoreboard players operation ALERT$dpbackcompatibility DimensionalDoors = BOOL$true DatapackManager
scoreboard players operation VERSION$datapack.latest DimensionalDoors = VERSION$datapack.current DimensionalDoors
scoreboard players operation FLAG$dirty DimensionalDoors = BOOL$true DatapackManager