tellraw @a[tag=debug] [{"text":"> preinstaller/versioning/minecraft/throw/notcompatible.mcfunction","color":"gray"}]

scoreboard players operation ALERT$version.mc.notcompatible DatapackManager = BOOL$true DatapackManager
scoreboard players operation FUNCTION$disablepack DatapackManager = BOOL$true DatapackManager
