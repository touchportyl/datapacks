# feedback for tool breaking
playsound minecraft:entity.item.break block @a[distance=..16] ~ ~ ~ 0.7 1 0

# break particles
# particle options use SNBT from 1.20.5, so toolbreak-1.20 covers 1.20.5 and later
execute if score VERSION$minecraft.current DatapackManager matches 11904..12004 as @s at @s run function harvester:compatibility/effects/toolbreak-1.19
execute if score VERSION$minecraft.current DatapackManager matches 12005.. as @s at @s run function harvester:compatibility/effects/toolbreak-1.20

# remove tool
item replace entity @s weapon.mainhand with minecraft:air

# clear tags
execute as @s at @s run function harvester:root/garbage_collection
