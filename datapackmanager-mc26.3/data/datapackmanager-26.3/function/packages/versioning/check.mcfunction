# reset every time to get the current version
scoreboard players operation VERSION$minecraft.current DatapackManager = VERSION$minecraft.backward DatapackManager
scoreboard players remove VERSION$minecraft.current DatapackManager 1

# check for all supported versions, oldest first
# every version file leads with a probe that only parses on that version or newer, so an older client drops the whole file and the score is never set
# versions are encoded as major*10000 + minor*100 + patch; the year.drop releases (26.1 and later) are stored as 1.<year>.<drop>, so 26.3 is 12603
execute unless score VERSION$minecraft.current DatapackManager matches 11404.. run function datapackmanager-26.3:packages/versioning/versions/1.14.4
execute unless score VERSION$minecraft.current DatapackManager matches 11502.. run function datapackmanager-26.3:packages/versioning/versions/1.15.2
execute unless score VERSION$minecraft.current DatapackManager matches 11605.. run function datapackmanager-26.3:packages/versioning/versions/1.16.5
execute unless score VERSION$minecraft.current DatapackManager matches 11701.. run function datapackmanager-26.3:packages/versioning/versions/1.17.1
execute unless score VERSION$minecraft.current DatapackManager matches 11802.. run function datapackmanager-26.3:packages/versioning/versions/1.18.2
execute unless score VERSION$minecraft.current DatapackManager matches 11904.. run function datapackmanager-26.3:packages/versioning/versions/1.19.4
execute unless score VERSION$minecraft.current DatapackManager matches 12002.. run function datapackmanager-26.3:packages/versioning/versions/1.20.2
execute unless score VERSION$minecraft.current DatapackManager matches 12003.. run function datapackmanager-26.3:packages/versioning/versions/1.20.3
execute unless score VERSION$minecraft.current DatapackManager matches 12005.. run function datapackmanager-26.3:packages/versioning/versions/1.20.5
execute unless score VERSION$minecraft.current DatapackManager matches 12102.. run function datapackmanager-26.3:packages/versioning/versions/1.21.2
execute unless score VERSION$minecraft.current DatapackManager matches 12104.. run function datapackmanager-26.3:packages/versioning/versions/1.21.4
execute unless score VERSION$minecraft.current DatapackManager matches 12105.. run function datapackmanager-26.3:packages/versioning/versions/1.21.5
execute unless score VERSION$minecraft.current DatapackManager matches 12106.. run function datapackmanager-26.3:packages/versioning/versions/1.21.6
execute unless score VERSION$minecraft.current DatapackManager matches 12107.. run function datapackmanager-26.3:packages/versioning/versions/1.21.7
execute unless score VERSION$minecraft.current DatapackManager matches 12109.. run function datapackmanager-26.3:packages/versioning/versions/1.21.9
execute unless score VERSION$minecraft.current DatapackManager matches 12111.. run function datapackmanager-26.3:packages/versioning/versions/1.21.11
execute unless score VERSION$minecraft.current DatapackManager matches 12601.. run function datapackmanager-26.3:packages/versioning/versions/26.1
execute unless score VERSION$minecraft.current DatapackManager matches 12602.. run function datapackmanager-26.3:packages/versioning/versions/26.2
execute unless score VERSION$minecraft.current DatapackManager matches 12603.. run function datapackmanager-26.3:packages/versioning/versions/26.3

# throw warnings/errors for unsupported versions
execute if score VERSION$minecraft.current DatapackManager < VERSION$minecraft.backward DatapackManager run function datapackmanager-26.3:packages/alerts/minecraftnotcompatible
execute if score VERSION$minecraft.current DatapackManager > VERSION$minecraft.forward DatapackManager run function datapackmanager-26.3:packages/alerts/minecraftunknownversion

# push state to all listening datapacks
# only activate if the version is supported
scoreboard players operation FLAG$isActive DatapackManager = BOOL$false DatapackManager
execute if score VERSION$minecraft.current DatapackManager >= VERSION$minecraft.backward DatapackManager run scoreboard players operation FLAG$isActive DatapackManager = BOOL$true DatapackManager
