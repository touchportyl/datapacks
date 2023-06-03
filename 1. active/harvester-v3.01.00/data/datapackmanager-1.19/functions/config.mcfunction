tellraw @a[tag=dm_debug] [{"text":"DM","color":"white"},{"text":" > config.mcfunction","color":"gray"}]

# WARNING: ONLY CHANGE THESE CONFIGURATION OPTIONS IF YOU KNOW WHAT YOU'RE DOING
# CHANGING THESE SETTINGS COULD FORCE THE DATAPACK TO RUN COMMANDS THAT IT SHOULDN'T

# set the backward and forward compatible minecraft versions
scoreboard players set VERSION$minecraft.backward DatapackManager 14
scoreboard players set VERSION$minecraft.forward DatapackManager 19

scoreboard players operation VERSION$ignorecompatibility.backward DatapackManager = BOOL$false DatapackManager
scoreboard players operation VERSION$ignorecompatibility.forward DatapackManager = BOOL$true DatapackManager