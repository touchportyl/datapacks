tellraw @a[tag=debug] [{"text":"DM > preinstaller/versioning/minecraft/throw/notcompatible.mcfunction","color":"gray"}]

scoreboard players operation ALERT$mcnotcompatible DatapackManager = BOOL$true DatapackManager
scoreboard players operation FUNCTION$disablepack DimensionalDoors = BOOL$true DatapackManager
scoreboard players operation DD$dirty DimensionalDoors = BOOL$true DatapackManager
