# prevent 2 drivers in the same car
#execute if data entity @s interaction if entity @a[distance=..2,tag=vehicle_driver] run data remove entity @s interaction
scoreboard players operation ESF$tmp ESF_vehicleID = @s ESF_vehicleID
execute if data entity @s interaction as @a[tag=vehicle_driver] if score @s ESF_vehicleID = ESF$tmp ESF_vehicleID run scoreboard players set ESF$tmp ESF_vehicleID -1


# interaction to get in car
# - no existing driver for this vehicle
# - not already a driver
execute unless score ESF$tmp ESF_vehicleID matches -1 if data entity @s interaction on target if entity @s[tag=!vehicle_driver] run function endermitescriptframework:scripts/drivablevehicles/enter_vehicle


# clear interaction (handled regardless to avoid stuck state)
data remove entity @s interaction