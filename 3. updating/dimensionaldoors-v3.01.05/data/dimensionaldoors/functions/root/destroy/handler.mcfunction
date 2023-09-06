# blow up all with same ID
# CONFIG: can be disabled
execute if score CONFIG$destroyexplosively DimensionalDoors = BOOL$true DatapackManager align xyz positioned ~0.5 ~0.5 ~0.5 run function dimensionaldoors:effects/destructiveexplosion
# non-damaging variant (fallback)
execute unless score CONFIG$destroyexplosively DimensionalDoors = BOOL$true DatapackManager align xyz positioned ~0.5 ~0.5 ~0.5 run function dimensionaldoors:effects/nondestructiveexplosion

# remove loaders
forceload remove ~ ~

# hard check if it's supposed to be loaded
execute at @e[tag=DD_portal,tag=!DD_destroy,distance=..32] run forceload add ~ ~


# kill tag
kill @s