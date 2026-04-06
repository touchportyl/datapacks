scoreboard players operation ESF$tmp ESF_vehicleID = @s ESF_vehicleID

# rotate the seat
execute as @e[tag=vehicle_seat,tag=has_uid] if score @s ESF_vehicleID = ESF$tmp ESF_vehicleID at @s run function endermitescriptframework:scripts/drivablevehicles/movement/ground/turn_left_step