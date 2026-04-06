# effects

# main flash effect
# compatibility for 1.21.9++
execute unless score VERSION$minecraft.current DatapackManager matches 12109.. if score CONFIG$disableparticles DimensionalDoors = BOOL$false DatapackManager run function dimensionaldoors:compatibility/flash
execute if score VERSION$minecraft.current DatapackManager matches 12109.. if score CONFIG$disableparticles DimensionalDoors = BOOL$false DatapackManager run function dimensionaldoors:compatibility/flash-1.21.9

# sonic_boom effect for 1.19++
# fallback to explosion effect for older versions
execute if score VERSION$minecraft.current.minor DatapackManager matches 19.. if score CONFIG$disableparticles DimensionalDoors = BOOL$false DatapackManager run function dimensionaldoors:compatibility/sonic_boom
execute unless score VERSION$minecraft.current.minor DatapackManager matches 19.. if score CONFIG$disableparticles DimensionalDoors = BOOL$false DatapackManager run particle minecraft:explosion ~ ~1 ~ 0 0 0 0 1 normal


playsound minecraft:block.conduit.activate block @a[distance=..32] ~ ~ ~ 1 2 0