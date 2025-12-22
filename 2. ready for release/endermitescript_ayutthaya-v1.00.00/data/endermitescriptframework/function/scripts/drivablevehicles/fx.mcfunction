# prevent 2 drivers in the same car
#execute if data entity @s interaction if entity @a[distance=..2,tag=vehicle_driver] run data remove entity @s interaction
scoreboard players operation ESF$tmp ESF_vehicleID = @s ESF_vehicleID

# register new vehicles here
execute as @e[tag=cabriolet_seat,tag=has_uid,distance=..1] if score @s ESF_vehicleID = ESF$tmp ESF_vehicleID at @s run function endermitescriptframework:scripts/drivablevehicles/vehicles/ground/cabriolet/fx
execute as @e[tag=cruzer_seat,tag=has_uid,distance=..1] if score @s ESF_vehicleID = ESF$tmp ESF_vehicleID at @s run function endermitescriptframework:scripts/drivablevehicles/vehicles/ground/cruzer/fx