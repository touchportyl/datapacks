tellraw @a[tag=debug] [{"text":"DM > config.mcfunction","color":"gray"}]

# WARNING: ONLY CHANGE THESE CONFIGURATION OPTIONS IF YOU KNOW WHAT YOU'RE DOING
# CHANGING THESE SETTINGS COULD FORCE THE DATAPACK TO RUN COMMANDS THAT IT SHOULDN'T

# set the backward and forward compatible minecraft versions
scoreboard players set VERSION$minecraft.backward DatapackManager 13
scoreboard players set VERSION$minecraft.forward DatapackManager 19

# set the datapack's current version
scoreboard players set VERSION$datapack.current DatapackManager 10000
