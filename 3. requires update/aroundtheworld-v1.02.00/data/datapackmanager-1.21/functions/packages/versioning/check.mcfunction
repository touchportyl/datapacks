# reset every time to get the current version
scoreboard players operation VERSION$minecraft.current DatapackManager = VERSION$minecraft.backward DatapackManager
scoreboard players remove VERSION$minecraft.current DatapackManager 1

# special case to differentiate [1.20 to 1.20.2] and [1.20.3 to 1.20.5]
# check for nbt changes in 1.20.3
scoreboard players operation FLAG$nbt.version.old DatapackManager = BOOL$true DatapackManager
scoreboard players operation FLAG$nbt.version.1.20.3 DatapackManager = BOOL$false DatapackManager


# check for all supported versions
execute unless score VERSION$minecraft.current DatapackManager matches 11404.. run function datapackmanager-1.21:packages/versioning/versions/1.14.4
execute unless score VERSION$minecraft.current DatapackManager matches 11502.. run function datapackmanager-1.21:packages/versioning/versions/1.15.2
execute unless score VERSION$minecraft.current DatapackManager matches 11605.. run function datapackmanager-1.21:packages/versioning/versions/1.16.5
execute unless score VERSION$minecraft.current DatapackManager matches 11701.. run function datapackmanager-1.21:packages/versioning/versions/1.17.1
execute unless score VERSION$minecraft.current DatapackManager matches 11802.. run function datapackmanager-1.21:packages/versioning/versions/1.18.2
execute unless score VERSION$minecraft.current DatapackManager matches 11904.. run function datapackmanager-1.21:packages/versioning/versions/1.19.4
execute unless score VERSION$minecraft.current DatapackManager matches 12002.. run function datapackmanager-1.21:packages/versioning/versions/1.20.2
execute unless score VERSION$minecraft.current DatapackManager matches 12003.. run function datapackmanager-1.21:packages/versioning/versions/1.20.3
execute unless score VERSION$minecraft.current DatapackManager matches 12104.. run function datapackmanager-1.21:packages/versioning/versions/1.21.4
execute unless score VERSION$minecraft.current DatapackManager matches 12105.. run function datapackmanager-1.21:packages/versioning/versions/1.21.5
execute unless score VERSION$minecraft.current DatapackManager matches 12106.. run function datapackmanager-1.21:packages/versioning/versions/1.21.6


# throw warnings/errors for unsupported versions
execute if score VERSION$minecraft.current DatapackManager < VERSION$minecraft.backward DatapackManager run function datapackmanager-1.21:packages/alerts/minecraftnotcompatible
execute if score VERSION$minecraft.current DatapackManager > VERSION$minecraft.forward DatapackManager run function datapackmanager-1.21:packages/alerts/minecraftunknownversion

# push state to all listening datapacks
scoreboard players operation FLAG$isActive DatapackManager = BOOL$false DatapackManager
execute if score VERSION$minecraft.current DatapackManager >= VERSION$minecraft.backward DatapackManager if score VERSION$minecraft.current DatapackManager <= VERSION$minecraft.forward DatapackManager run scoreboard players operation FLAG$isActive DatapackManager = BOOL$true DatapackManager