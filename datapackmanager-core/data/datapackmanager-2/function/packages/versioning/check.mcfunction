# Minecraft version oracle.
#
# Minecraft rejects an ENTIRE .mcfunction file if any single line fails to parse. Each leaf
# below leads with a probe command naming a block/entity/particle/item that first exists in that
# version, so on an older client the leaf silently vanishes and never sets its score. Priming to
# one below the floor and walking the leaves in ascending order therefore ratchets `current` up
# to the true running version. Adding a version = one leaf file + one dispatch line here.
#
# The ratchet answers "at least version N". It cannot answer "newer than anything I know",
# because a version that does not exist yet cannot fail to parse a probe: on any client at or
# above the newest leaf every leaf parses and `current` saturates at that newest value. The
# 26.3 sentinel leaf below exists solely so `current > forward` can fire for an unsupported
# version; pack.mcmeta's max_format is the real guard for versions that do not exist yet.
scoreboard players operation VERSION$minecraft.current DatapackManager = VERSION$minecraft.backward DatapackManager
scoreboard players remove VERSION$minecraft.current DatapackManager 1

execute unless score VERSION$minecraft.current DatapackManager matches 11404.. run function datapackmanager-2:packages/versioning/versions/1.14.4
execute unless score VERSION$minecraft.current DatapackManager matches 11502.. run function datapackmanager-2:packages/versioning/versions/1.15.2
execute unless score VERSION$minecraft.current DatapackManager matches 11605.. run function datapackmanager-2:packages/versioning/versions/1.16.5
execute unless score VERSION$minecraft.current DatapackManager matches 11701.. run function datapackmanager-2:packages/versioning/versions/1.17.1
execute unless score VERSION$minecraft.current DatapackManager matches 11802.. run function datapackmanager-2:packages/versioning/versions/1.18.2
execute unless score VERSION$minecraft.current DatapackManager matches 11904.. run function datapackmanager-2:packages/versioning/versions/1.19.4
execute unless score VERSION$minecraft.current DatapackManager matches 12002.. run function datapackmanager-2:packages/versioning/versions/1.20.2
execute unless score VERSION$minecraft.current DatapackManager matches 12003.. run function datapackmanager-2:packages/versioning/versions/1.20.3
execute unless score VERSION$minecraft.current DatapackManager matches 12005.. run function datapackmanager-2:packages/versioning/versions/1.20.5
execute unless score VERSION$minecraft.current DatapackManager matches 12102.. run function datapackmanager-2:packages/versioning/versions/1.21.2
execute unless score VERSION$minecraft.current DatapackManager matches 12104.. run function datapackmanager-2:packages/versioning/versions/1.21.4
execute unless score VERSION$minecraft.current DatapackManager matches 12105.. run function datapackmanager-2:packages/versioning/versions/1.21.5
execute unless score VERSION$minecraft.current DatapackManager matches 12106.. run function datapackmanager-2:packages/versioning/versions/1.21.6
execute unless score VERSION$minecraft.current DatapackManager matches 12107.. run function datapackmanager-2:packages/versioning/versions/1.21.7
execute unless score VERSION$minecraft.current DatapackManager matches 12109.. run function datapackmanager-2:packages/versioning/versions/1.21.9
execute unless score VERSION$minecraft.current DatapackManager matches 12111.. run function datapackmanager-2:packages/versioning/versions/1.21.11
execute unless score VERSION$minecraft.current DatapackManager matches 260100.. run function datapackmanager-2:packages/versioning/versions/26.1
execute unless score VERSION$minecraft.current DatapackManager matches 260200.. run function datapackmanager-2:packages/versioning/versions/26.2
execute unless score VERSION$minecraft.current DatapackManager matches 260300.. run function datapackmanager-2:packages/versioning/versions/26.3

execute if score VERSION$minecraft.current DatapackManager > VERSION$minecraft.forward DatapackManager as @a run function datapackmanager-2:packages/alerts/minecraft_too_new
