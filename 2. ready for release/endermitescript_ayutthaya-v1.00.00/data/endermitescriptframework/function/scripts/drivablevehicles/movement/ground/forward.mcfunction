# copy this seat's vehicle id into temporary holder (harmless if already set)
scoreboard players operation ESF$tmp ESF_vehicleID = @s ESF_vehicleID

# if this seat has movement queued, run the lightweight step function (runs as the seat)
execute as @e[tag=vehicle_seat,tag=has_uid] if score @s ESF_vehicleID = ESF$tmp ESF_vehicleID at @s if score @s ESF_vSpeed_ matches 1.. run function endermitescriptframework:scripts/drivablevehicles/movement/ground/forward_step