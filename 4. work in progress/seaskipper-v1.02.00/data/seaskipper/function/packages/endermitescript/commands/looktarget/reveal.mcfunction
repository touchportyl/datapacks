function seaskipper:packages/endermitescript/root/success

execute as @e[tag=SS_looktarget,distance=..10] at @s run particle minecraft:block_marker{block_state:{Name:medium_amethyst_bud}} ~ ~1.5 ~ 0 0 0 0 1 force
execute as @e[tag=SS_looktarget,distance=..10] at @s run particle minecraft:firework ~ ~1.5 ~ 0 0 0 0.2 100
execute as @e[tag=SS_looktarget,distance=..10] at @s run playsound minecraft:entity.experience_orb.pickup master @a[distance=..10] ~ ~1.5 ~ 1 1 0