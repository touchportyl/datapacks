tellraw @a[tag=dd_debug] [{"text":"DD","color":"light_purple"},{"text":" > root/closermechanism/main.mcfunction","color":"gray"}]

# play teleport and closing door sound
execute as @s at @s run function dimensionaldoors:effects/teleporteffects


# door closing mechanism
# INLINE VERSIONING
# Minecraft 1.14 - 1.15
execute if score VERSION$minecraft.current DatapackManager matches 14..15 as @s at @s run function dimensionaldoors:root/closermechanism/v1/oakdoor
# Minecraft 1.16 - 1.20
execute if score VERSION$minecraft.current DatapackManager matches 16..20 as @s at @s run function dimensionaldoors:root/closermechanism/v2/oakdoor
# no fallback



# cleanup
tag @s remove DD_close
scoreboard players reset @s DimensionalDoors