# effects
particle minecraft:explosion_emitter ~ ~ ~ 0 0 0 0 1 normal
execute at @s run playsound minecraft:entity.generic.explode block @a[distance=..100] ~ ~ ~ 1 0.8 0

# break the door
execute if block ~ ~ ~ minecraft:oak_door run setblock ~ ~ ~ minecraft:air replace

# kill items nearby
kill @e[type=minecraft:item,distance=..2]
