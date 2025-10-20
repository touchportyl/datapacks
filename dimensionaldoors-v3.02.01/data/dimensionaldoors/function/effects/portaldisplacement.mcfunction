# effects
# compatibility for 1.21.9++
execute unless score VERSION$minecraft.current DatapackManager matches 12109.. if score CONFIG$disableparticles DimensionalDoors = BOOL$false DatapackManager run function dimensionaldoors:compatibility/flash
execute if score VERSION$minecraft.current DatapackManager matches 12109.. if score CONFIG$disableparticles DimensionalDoors = BOOL$false DatapackManager run function dimensionaldoors:compatibility/flash-1.21.9


spreadplayers ~ ~ 0 1 false @s