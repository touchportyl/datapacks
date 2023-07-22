#sfx:hiss
playsound minecraft:entity.generic.extinguish_fire block @a[distance=..16] ~ ~ ~ 1 1 0

#pfx:barrier
# technically the execute if isn't needed but I'm adding it to maintain coding practices
execute if score VERSION$minecraft.current DatapackManager matches 16..19 run function tinkererscraft:compatibility/effects/smeltery/capacity/limit-mc1.16-1.19
execute if score VERSION$minecraft.current DatapackManager matches 20.. run function tinkererscraft:compatibility/effects/smeltery/capacity/limit-mc1.20