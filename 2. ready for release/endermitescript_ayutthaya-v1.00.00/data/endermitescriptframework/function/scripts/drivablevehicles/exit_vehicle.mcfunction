execute at @n[tag=vehicle_seat,tag=has_uid] run tp @s ^-1 ^ ^
attribute @s minecraft:camera_distance modifier remove endermitescriptframework:vehicle_driver
scoreboard players reset @s ESF_vehicleID
tag @s remove vehicle_driver
playsound minecraft:item.armor.equip_generic block @a[distance=..64] ~ ~ ~ 1 0.8 0