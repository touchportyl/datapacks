# WARNING: ONLY CHANGE THESE CONFIGURATION OPTIONS IF YOU KNOW WHAT YOU'RE DOING
# CHANGING THESE SETTINGS COULD FORCE THE DATAPACK TO RUN COMMANDS THAT IT SHOULDN'T

# set the backward and forward compatible minecraft versions
scoreboard players set VERSION$minecraft.backward DatapackManager 14
scoreboard players set VERSION$minecraft.forward DatapackManager 20

scoreboard players operation VERSION$ignorecompatibility.backward DatapackManager = BOOL$false DatapackManager
scoreboard players operation VERSION$ignorecompatibility.forward DatapackManager = BOOL$true DatapackManager

# safe to assume until proven otherwise
scoreboard players operation FLAG$noschedulecommand DatapackManager = BOOL$true DatapackManager