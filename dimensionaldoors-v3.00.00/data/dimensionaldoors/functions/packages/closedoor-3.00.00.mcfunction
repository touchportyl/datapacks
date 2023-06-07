tellraw @a[tag=debug] [{"text":"DD > packages/closedoor-3.00.00.mcfunction","color":"gray"}]

# play teleport and closing door sound
execute as @s at @s run function dimensionaldoors:modules/effects/teleporteffects-3.00.00

# door closing mechanism
# INLINE VERSIONING
# Minecraft 1.14 - 1.15
execute if score VERSION$minecraft.current DatapackManager matches 14..15 as @s at @s run function dimensionaldoors:modules/door/closermechanism-1.00.00
# Minecraft 1.16 - 1.19
execute if score VERSION$minecraft.current DatapackManager matches 16..19 as @s at @s run function dimensionaldoors:modules/door/closermechanism-3.00.00

# cleanup
tag @s remove DD_close
