# reset every time to get the current version
scoreboard players operation VERSION$minecraft.current DatapackManager = VERSION$minecraft.backward DatapackManager
scoreboard players remove VERSION$minecraft.current DatapackManager 1

# check for all known versions
execute unless score VERSION$minecraft.current DatapackManager matches 13.. run function datapackmanager-1.21:packages/versioning/versions/1.13
execute unless score VERSION$minecraft.current DatapackManager matches 14.. run function datapackmanager-1.21:packages/versioning/versions/1.14
execute unless score VERSION$minecraft.current DatapackManager matches 15.. run function datapackmanager-1.21:packages/versioning/versions/1.15
execute unless score VERSION$minecraft.current DatapackManager matches 16.. run function datapackmanager-1.21:packages/versioning/versions/1.16
execute unless score VERSION$minecraft.current DatapackManager matches 17.. run function datapackmanager-1.21:packages/versioning/versions/1.17
execute unless score VERSION$minecraft.current DatapackManager matches 18.. run function datapackmanager-1.21:packages/versioning/versions/1.18
execute unless score VERSION$minecraft.current DatapackManager matches 19.. run function datapackmanager-1.21:packages/versioning/versions/1.19
execute unless score VERSION$minecraft.current DatapackManager matches 20.. run function datapackmanager-1.21:packages/versioning/versions/1.20

# throw warnings/errors for unsupported versions
execute if score VERSION$minecraft.current DatapackManager < VERSION$minecraft.backward DatapackManager run function datapackmanager-1.21:packages/alerts/minecraftnotcompatible
execute if score VERSION$minecraft.current DatapackManager > VERSION$minecraft.forward DatapackManager run function datapackmanager-1.21:packages/alerts/minecraftunknownversion

# push state to all listening datapacks
# Datapack Manager supports 1.13 to 1.20 in the "functions" folder
# 1.21 is supported in the "function" folder
scoreboard players operation FLAG$isActive DatapackManager = BOOL$false DatapackManager
execute if score VERSION$minecraft.current DatapackManager >= VERSION$minecraft.backward DatapackManager if score VERSION$minecraft.current DatapackManager <= VERSION$minecraft.forward DatapackManager run scoreboard players operation FLAG$isActive DatapackManager = BOOL$true DatapackManager