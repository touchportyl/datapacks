tellraw @a[tag=debug] [{"text":"VC > config.mcfunction","color":"gray"}]

# toggle player locking when in a conversation
scoreboard players operation CONFIG$immersivechat VillagerChat = BOOL$true DatapackManager


# WARNING: ONLY CHANGE THESE CONFIGURATION OPTIONS IF YOU KNOW WHAT YOU'RE DOING
# CHANGING THESE SETTINGS COULD FORCE THE DATAPACK TO RUN COMMANDS THAT IT SHOULDN'T

# set the datapack's current version
scoreboard players set VERSION$datapack.current DatapackManager 10000
