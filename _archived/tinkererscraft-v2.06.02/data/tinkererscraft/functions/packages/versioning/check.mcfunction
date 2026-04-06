tellraw @a[tag=tc_debug] [{"text":"TC","color":"gold"},{"text":" > packages/versioning/check.mcfunction","color":"gray"}]

# set default
# upon first install, there will be no VERSION$datapack.latest TinkerersCraft
# so we set latest to equal the current value, preventing any unnecessary updates
execute unless score VERSION$datapack.latest TinkerersCraft matches 10000..99999 run scoreboard players operation VERSION$datapack.latest TinkerersCraft = VERSION$datapack.current TinkerersCraft

# update from latest to current version

# legacy updater
execute if score $tc.version TP_version matches ..19999 run function tinkererscraft:packages/versioning/updates/v2.0.0

# updater
execute unless score VERSION$datapack.latest TinkerersCraft matches 20600.. run function tinkererscraft:packages/versioning/updates/v2.06.00
#execute unless score VERSION$datapack.latest TinkerersCraft matches 30000.. run function tinkererscraft:packages/versioning/updates/v3.00.00

#execute unless score VERSION$datapack.latest TinkerersCraft matches 30001.. run scoreboard players set VERSION$datapack.latest TinkerersCraft 30001


# throw error for unsupported minecraft versions
execute if score VERSION$minecraft.current DatapackManager < VERSION$minecraft.backward TinkerersCraft if score VERSION$ignorecompatibility.backward TinkerersCraft = BOOL$false DatapackManager run function tinkererscraft:packages/versioning/throw/mcnotcompatible

execute if score VERSION$minecraft.current DatapackManager > VERSION$minecraft.forward TinkerersCraft if score VERSION$ignorecompatibility.forward TinkerersCraft = BOOL$false DatapackManager run function tinkererscraft:packages/versioning/throw/mcnotcompatible


# throw error for all versions newer than the currently supported version
execute if score VERSION$datapack.current TinkerersCraft < VERSION$datapack.latest TinkerersCraft run function tinkererscraft:packages/versioning/throw/dpnotcompatible