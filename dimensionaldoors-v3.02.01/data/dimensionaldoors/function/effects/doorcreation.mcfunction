# effects
execute if score CONFIG$disableparticles DimensionalDoors = BOOL$false DatapackManager run particle minecraft:flash ~ ~1 ~ 0 0 0 0 1 normal


# compatibility
# 1.19++
execute if score VERSION$minecraft.current.minor DatapackManager matches 19.. if score CONFIG$disableparticles DimensionalDoors = BOOL$false DatapackManager run function dimensionaldoors:compatibility/sonic_boom

# fallback
execute unless score VERSION$minecraft.current.minor DatapackManager matches 19.. if score CONFIG$disableparticles DimensionalDoors = BOOL$false DatapackManager run particle minecraft:explosion ~ ~1 ~ 0 0 0 0 1 normal


playsound minecraft:block.conduit.activate block @a[distance=..32] ~ ~ ~ 1 2 0