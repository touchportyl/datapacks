tellraw @a[tag=dm_debug] [{"text":"DM","color":"white"},{"text":" > packages/versioning/check.mcfunction","color":"gray"}]

# reset every time to get the current version
scoreboard players set VERSION$minecraft.current DatapackManager 12

# check for all known versions
execute unless score VERSION$minecraft.current DatapackManager matches 13.. run function datapackmanager-1.19:packages/versioning/versions/1.13
execute unless score VERSION$minecraft.current DatapackManager matches 14.. run function datapackmanager-1.19:packages/versioning/versions/1.14
execute unless score VERSION$minecraft.current DatapackManager matches 15.. run function datapackmanager-1.19:packages/versioning/versions/1.15
execute unless score VERSION$minecraft.current DatapackManager matches 16.. run function datapackmanager-1.19:packages/versioning/versions/1.16
execute unless score VERSION$minecraft.current DatapackManager matches 17.. run function datapackmanager-1.19:packages/versioning/versions/1.17
execute unless score VERSION$minecraft.current DatapackManager matches 18.. run function datapackmanager-1.19:packages/versioning/versions/1.18
execute unless score VERSION$minecraft.current DatapackManager matches 19.. run function datapackmanager-1.19:packages/versioning/versions/1.19

# throw error for unsupported versions
execute if score VERSION$minecraft.current DatapackManager < VERSION$minecraft.backward DatapackManager if score VERSION$ignorecompatibility.backward DatapackManager = BOOL$false DatapackManager run function datapackmanager-1.19:packages/versioning/throw/notcompatible
execute if score VERSION$minecraft.current DatapackManager > VERSION$minecraft.forward DatapackManager if score VERSION$ignorecompatibility.forward DatapackManager = BOOL$false DatapackManager run function datapackmanager-1.19:packages/versioning/throw/notcompatible
