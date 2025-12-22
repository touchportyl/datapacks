# active engine
execute if entity @s[tag=vehicle_input_forward_backward] positioned ^ ^ ^1.5 run playsound minecraft:entity.minecart.riding block @a[distance=..64] ^ ^0.4 ^-0.8 0.03 1.2 0
execute if entity @s[tag=vehicle_input_forward_backward] positioned ^ ^ ^1.5 run playsound minecraft:entity.zombie_villager.converted block @a[distance=..64] ^ ^0.4 ^-0.8 0.01 0.5 0
execute if entity @s[tag=vehicle_input_forward_backward] positioned ^ ^ ^1.5 run playsound minecraft:entity.boat.paddle_land block @a[distance=..64] ^ ^0.4 ^-0.8 0.1 2.0 0

# braking sound
execute if entity @s[tag=vehicle_input_jump] unless score @s ESF_vSpeed matches 0 run playsound minecraft:block.sand.break block @a[distance=..64] ^0.32 ^-0.55 ^-0.8 0.03 0.8 0

# exhaust smoke
execute unless score @s ESF_vSpeed matches ..-1 run particle minecraft:smoke ^-0.32 ^-0.55 ^-0.8 0 0.01 0.01 0.001 1 normal
execute unless score @s ESF_vSpeed matches ..-1 run particle minecraft:smoke ^0.32 ^-0.55 ^-0.8 0 0.01 0.01 0.001 1 normal

# movement dust
execute if score @s ESF_vSpeed matches 1.. run particle minecraft:dust_plume ^ ^-0.9 ^-0.6 0.01 0 0.01 0.001 1 normal
execute if score @s ESF_vSpeed matches ..-1 run particle minecraft:dust_plume ^ ^-0.9 ^-0.6 0.01 0 0.01 0.001 1 normal

# debug root
#particle minecraft:flame ^0.32 ^-0.5 ^-0.75 0 0 0 0 1 force
#particle minecraft:white_smoke ^ ^0.4 ^-0.8 0 0 0 0.1 2 force