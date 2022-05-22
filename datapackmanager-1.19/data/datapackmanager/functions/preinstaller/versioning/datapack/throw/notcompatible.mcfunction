tellraw @a[tag=debug] [{"text":"> preinstaller/versioning/datapack/throw/notcompatible.mcfunction","color":"gray"}]

scoreboard players operation ALERT$dpbackcompatibility DatapackManager = BOOL$true DatapackManager
scoreboard players operation VERSION$datapack.latest DatapackManager = VERSION$datapack.current DatapackManager
