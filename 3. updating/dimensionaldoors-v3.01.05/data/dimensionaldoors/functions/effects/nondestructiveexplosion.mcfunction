# effects
execute if score CONFIG$disableparticles DimensionalDoors = BOOL$false DatapackManager run particle minecraft:explosion_emitter ~ ~ ~ 0 0 0 0 1 normal
execute at @s run playsound minecraft:entity.generic.explode block @a[distance=..32] ~ ~ ~ 1 0.8 0

# break the door
execute if block ~ ~ ~ minecraft:oak_door run setblock ~ ~ ~ minecraft:air replace
execute if block ~ ~1 ~ minecraft:oak_door run setblock ~ ~1 ~ minecraft:air replace

# kill items nearby
kill @e[type=minecraft:item,distance=..2]