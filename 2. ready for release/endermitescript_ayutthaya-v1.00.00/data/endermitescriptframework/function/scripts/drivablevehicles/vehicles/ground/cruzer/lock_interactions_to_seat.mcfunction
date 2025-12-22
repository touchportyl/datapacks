# copy this seat's vehicle id into temporary holder
scoreboard players operation ESF$tmp ESF_vehicleID = @s ESF_vehicleID

# teleport interactables that match this seat's vehicle id to the seat position with offset
execute as @e[tag=cruzer_interactable,tag=has_uid] if score @s ESF_vehicleID = ESF$tmp ESF_vehicleID run tp @s ^ ^ ^-0.2 ~ ~