# feedback for tool breaking
playsound minecraft:entity.item.break block @a[distance=..16] ~ ~ ~ 0.7 1 0

# break particles
execute if score VERSION$minecraft.current.minor DatapackManager matches ..19 as @s at @s run function harvester:compatibility/effects/toolbreak-1.19
execute if score VERSION$minecraft.current.minor DatapackManager matches 20.. as @s at @s run function harvester:compatibility/effects/toolbreak-1.20

# remove tool
item replace entity @s weapon.mainhand with minecraft:air

# clear tags
execute as @s at @s run function harvester:root/garbage_collection