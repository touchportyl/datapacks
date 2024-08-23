# reset every time to get the current version
scoreboard players operation VERSION$minecraft.current DatapackManager = VERSION$minecraft.backward DatapackManager
scoreboard players remove VERSION$minecraft.current DatapackManager 1

# check for all known versions
execute unless score VERSION$minecraft.current DatapackManager matches 21.. run function datapackmanager-1.21:packages/versioning/versions/1.21

# throw warnings/errors for unsupported versions
execute if score VERSION$minecraft.current DatapackManager < VERSION$minecraft.backward DatapackManager run function datapackmanager-1.21:packages/alerts/minecraftnotcompatible
execute if score VERSION$minecraft.current DatapackManager > VERSION$minecraft.forward DatapackManager run function datapackmanager-1.21:packages/alerts/minecraftunknownversion

# push state to all listening datapacks
# Datapack Manager supports 1.21 in the "function" folder
# 1.13 to 1.20 is supported in the "functions" folder
scoreboard players operation FLAG$isActive DatapackManager = BOOL$false DatapackManager
execute if score VERSION$minecraft.current DatapackManager >= VERSION$minecraft.backward DatapackManager if score VERSION$minecraft.current DatapackManager <= VERSION$minecraft.forward DatapackManager run scoreboard players operation FLAG$isActive DatapackManager = BOOL$true DatapackManager