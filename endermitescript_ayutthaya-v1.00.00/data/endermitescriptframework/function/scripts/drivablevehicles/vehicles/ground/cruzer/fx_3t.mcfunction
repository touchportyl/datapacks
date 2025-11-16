# idle engine
execute if entity @s[tag=!vehicle_input_forward_backward] positioned ^ ^ ^1.5 run playsound minecraft:entity.minecart.riding block @a[distance=..64] ^ ^-0.2 ^0.8 0.02 0.2 0
execute if entity @s[tag=!vehicle_input_forward_backward] positioned ^ ^ ^1.5 run playsound minecraft:entity.zombie_villager.converted block @a[distance=..64] ^ ^-0.2 ^0.8 0.01 0.5 0
execute if entity @s[tag=!vehicle_input_forward_backward] positioned ^ ^ ^1.5 run playsound minecraft:entity.boat.paddle_land block @a[distance=..64] ^ ^0.4 ^-0.8 0.05 0.6 0

# active engine