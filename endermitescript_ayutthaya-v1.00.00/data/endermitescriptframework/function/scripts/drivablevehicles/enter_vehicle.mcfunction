# 1) tag the nearest player to the interactable as driver
tag @s add vehicle_driver

# 2) copy the nearest seat's ESF_vehicleID into that player (so driver and seat share the same id)
scoreboard players operation @s ESF_vehicleID = @n[tag=vehicle_seat,tag=has_uid,distance=..5] ESF_vehicleID

# 3) mount the player onto the nearest seat
ride @s mount @n[tag=vehicle_seat,tag=has_uid,distance=..5]
  
# 4) set camera distance for the driver
attribute @s minecraft:camera_distance modifier add endermitescriptframework:vehicle_driver 3 add_value

# 5) play equip sound
execute at @s run playsound minecraft:item.armor.equip_generic block @a[distance=..64] ~ ~ ~ 1 0.9 0