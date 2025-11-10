# feedback for a successful harvest
playsound minecraft:entity.player.attack.sweep block @a ~ ~ ~ 0.1 0 0
playsound minecraft:entity.player.attack.sweep block @a ~ ~ ~ 0.4 1.6 0

execute if score VERSION$minecraft.current.minor DatapackManager matches ..15 as @s at @s positioned ~ ~1.62 ~ run particle minecraft:sweep_attack ^ ^-0.5 ^1 0 0 0 0.1 1
execute unless score VERSION$minecraft.current.minor DatapackManager matches ..15 as @s at @s run function harvester:compatibility/effects/sweep