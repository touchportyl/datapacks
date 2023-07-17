playsound minecraft:entity.lightning_bolt.impact master @a ~ ~ ~ 0.4 2 0
playsound minecraft:entity.firework_rocket.twinkle_far master @a ~ ~ ~ 0.2 1.8 0
playsound minecraft:ui.toast.out master @a ~ ~ ~ 1 1 0

execute as touchportyl at @s positioned ~ ~1.6 ~ positioned ^ ^ ^3 run function portyltrident:effects/throwcircle
tag @s remove PT_thrown