execute as @e[tag=looktarget,distance=..10] at @s run particle barrier ~ ~1.5 ~ 0 0 0 0 1 force
execute as @e[tag=looktarget,distance=..10] at @s run particle firework ~ ~1.5 ~ 0 0 0 0.2 100
execute as @e[tag=looktarget,distance=..10] at @s run playsound entity.experience_orb.pickup master @a[distance=..10] ~ ~1.5 ~ 1 1 0