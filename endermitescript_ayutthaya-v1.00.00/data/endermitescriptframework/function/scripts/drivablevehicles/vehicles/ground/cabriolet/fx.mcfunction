# engine ambience
execute positioned ^ ^ ^1.5 run playsound minecraft:entity.minecart.riding block @a[distance=..64] ^0.55 ^0.1 ^2.0 0.01 0.7 0

# active engine sound
execute if entity @s[tag=vehicle_input_forward_backward] positioned ^ ^ ^1.5 run playsound minecraft:entity.minecart.riding block @a[distance=..64] ^0.55 ^0.1 ^2.0 0.03 1.0 0
execute if entity @s[tag=vehicle_input_forward_backward] positioned ^ ^ ^1.5 run playsound minecraft:entity.zombie_villager.converted block @a[distance=..64] ^0.55 ^0.1 ^2.0 0.01 0.8 0

# braking sound
execute if entity @s[tag=vehicle_input_jump] unless score @s ESF_vSpeed matches 0 run playsound minecraft:block.sand.break block @a[distance=..64] ^0.7 ^-0.8 ^-0.3 0.03 0.8 0

# exhaust smoke
execute unless score @s ESF_vSpeed matches ..-1 run particle minecraft:smoke ^1.12 ^-0.36 ^-3.0 0 0.01 0.01 0.001 1 normal
execute unless score @s ESF_vSpeed matches ..-1 run particle minecraft:smoke ^0.06 ^-0.36 ^-3.0 0 0.01 0.01 0.001 1 normal

# movement dust
execute unless score @s ESF_vSpeed matches 0 run particle minecraft:dust_plume ^1.58 ^-0.9 ^-1.8 0.03 0 0.03 0.001 1 normal
execute unless score @s ESF_vSpeed matches 0 run particle minecraft:dust_plume ^-0.44 ^-0.9 ^-1.8 0.03 0 0.03 0.001 1 normal

# debug root
#particle minecraft:flame ^-0.44 ^-0.9 ^-1.8 0 0 0 0 1 force
#particle minecraft:white_smoke ^0.55 ^-0.8 ^-0.3 0 0 0 0.1 2 force