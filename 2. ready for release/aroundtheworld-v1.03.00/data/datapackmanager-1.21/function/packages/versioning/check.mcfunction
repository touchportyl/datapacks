# reset every time to get the current version
scoreboard players operation VERSION$minecraft.current DatapackManager = VERSION$minecraft.backward DatapackManager
scoreboard players remove VERSION$minecraft.current DatapackManager 1

# check for all supported versions
# every version requires some form of new block or change in command pattern in order for it to be "checked"
execute unless score VERSION$minecraft.current DatapackManager matches 11404.. run function datapackmanager-1.21:packages/versioning/versions/1.14.4
execute unless score VERSION$minecraft.current DatapackManager matches 11502.. run function datapackmanager-1.21:packages/versioning/versions/1.15.2
execute unless score VERSION$minecraft.current DatapackManager matches 11605.. run function datapackmanager-1.21:packages/versioning/versions/1.16.5
execute unless score VERSION$minecraft.current DatapackManager matches 11701.. run function datapackmanager-1.21:packages/versioning/versions/1.17.1
execute unless score VERSION$minecraft.current DatapackManager matches 11802.. run function datapackmanager-1.21:packages/versioning/versions/1.18.2
execute unless score VERSION$minecraft.current DatapackManager matches 11904.. run function datapackmanager-1.21:packages/versioning/versions/1.19.4
execute unless score VERSION$minecraft.current DatapackManager matches 12002.. run function datapackmanager-1.21:packages/versioning/versions/1.20.2
execute unless score VERSION$minecraft.current DatapackManager matches 12003.. run function datapackmanager-1.21:packages/versioning/versions/1.20.3
execute unless score VERSION$minecraft.current DatapackManager matches 12005.. run function datapackmanager-1.21:packages/versioning/versions/1.20.5
execute unless score VERSION$minecraft.current DatapackManager matches 12102.. run function datapackmanager-1.21:packages/versioning/versions/1.21.2
execute unless score VERSION$minecraft.current DatapackManager matches 12104.. run function datapackmanager-1.21:packages/versioning/versions/1.21.4
execute unless score VERSION$minecraft.current DatapackManager matches 12105.. run function datapackmanager-1.21:packages/versioning/versions/1.21.5
execute unless score VERSION$minecraft.current DatapackManager matches 12106.. run function datapackmanager-1.21:packages/versioning/versions/1.21.6
execute unless score VERSION$minecraft.current DatapackManager matches 12107.. run function datapackmanager-1.21:packages/versioning/versions/1.21.7
execute unless score VERSION$minecraft.current DatapackManager matches 12109.. run function datapackmanager-1.21:packages/versioning/versions/1.21.9

# patch version
# this is for updating minor changes that do not affect compatibility
execute if score VERSION$minecraft.current DatapackManager matches 12109.. run function datapackmanager-1.21:packages/versioning/versions/patch


# throw warnings/errors for unsupported versions
execute if score VERSION$minecraft.current DatapackManager < VERSION$minecraft.backward DatapackManager run function datapackmanager-1.21:packages/alerts/minecraftnotcompatible
execute if score VERSION$minecraft.current DatapackManager > VERSION$minecraft.forward DatapackManager run function datapackmanager-1.21:packages/alerts/minecraftunknownversion

# push state to all listening datapacks
# only activate if the version is not
scoreboard players operation FLAG$isActive DatapackManager = BOOL$false DatapackManager
execute if score VERSION$minecraft.current DatapackManager >= VERSION$minecraft.backward DatapackManager run scoreboard players operation FLAG$isActive DatapackManager = BOOL$true DatapackManager