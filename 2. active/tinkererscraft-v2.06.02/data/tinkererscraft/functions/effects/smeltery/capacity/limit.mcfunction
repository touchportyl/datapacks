#sfx:hiss
playsound minecraft:entity.generic.extinguish_fire block @a[distance=..16] ~ ~ ~ 1 1 0

#pfx:barrier
# technically the execute if isn't needed but I'm adding it to maintain coding practices
execute if score VERSION$minecraft.current DatapackManager matches 16..17 run function tinkererscraft:compatibility/effects/smeltery/capacity/limit-mc1.16-1.17
execute if score VERSION$minecraft.current DatapackManager matches 18.. run function tinkererscraft:compatibility/effects/smeltery/capacity/limit-mc1.18