tellraw @a[tag=debug] [{"text":"DM > preinstaller/versioning/minecraft/throw/notcompatible.mcfunction","color":"gray"}]

scoreboard players operation ALERT$mcnotcompatible DatapackManager = BOOL$true DatapackManager
scoreboard players operation FUNCTION$disablepack DatapackManager = BOOL$true DatapackManager
scoreboard players operation DM$dirty DatapackManager = BOOL$true DatapackManager
