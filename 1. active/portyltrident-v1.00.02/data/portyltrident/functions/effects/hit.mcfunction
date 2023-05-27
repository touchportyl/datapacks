particle explosion_emitter ~ ~ ~ 0 0 0 0 1 force
particle flash ~ ~ ~ 0 0 0 0 1 force

particle firework ~ ~1 ~ 1 1 1 0.5 100 force
particle electric_spark ~ ~1 ~ 3 3 3 1 100 force

summon lightning_bolt ~ ~ ~

playsound minecraft:entity.firework_rocket.large_blast_far master @a ~ ~ ~ 1 1 0

kill @e[type=#portyltrident:tridentkill,distance=..16,limit=1,sort=nearest]