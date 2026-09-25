# port the version number from the old v1.3/v2.0 system (TP_version) before any update runs
# only a real value is copied: reading an unset score would create it as 0
execute unless score VERSION$datapack.latest Harvester matches 10000.. if score $h.version TP_version matches 10000.. run scoreboard players operation VERSION$datapack.latest Harvester = $h.version TP_version

# set default
execute unless score VERSION$datapack.latest Harvester matches 10000.. run scoreboard players set VERSION$datapack.latest Harvester 10000
scoreboard players operation FLAG$isActive Harvester = BOOL$true DatapackManager

# update from latest to current version
execute unless score VERSION$datapack.latest Harvester matches 20000.. run function harvester:packages/versioning/updates/v2.00.00
execute unless score VERSION$datapack.latest Harvester matches 30100.. run function harvester:packages/versioning/updates/v3.01.00
execute unless score VERSION$datapack.latest Harvester matches 30301.. run function harvester:packages/versioning/updates/v3.03.01

# set minor version
execute unless score VERSION$datapack.latest Harvester matches 30302.. run scoreboard players set VERSION$datapack.latest Harvester 30302

# throw error for unsupported minecraft versions
# the alerts target DM_admin themselves, so each throw runs once rather than once per player
# (once per player also decremented the datapack counter once per player in root/core/disable)
execute if score VERSION$minecraft.current DatapackManager < VERSION$minecraft.backward Harvester if score VERSION$ignorecompatibility.backward Harvester = BOOL$false DatapackManager run function harvester:packages/versioning/throw/datapacknotcompatible
execute if score VERSION$minecraft.current DatapackManager > VERSION$minecraft.forward Harvester if score VERSION$ignorecompatibility.forward Harvester = BOOL$false DatapackManager run function harvester:packages/versioning/throw/datapacknotcompatible

# throw error for all versions newer than the currently supported version
execute if score VERSION$datapack.current Harvester < VERSION$datapack.latest Harvester run function harvester:packages/versioning/throw/datapackunknownversion
