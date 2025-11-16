scoreboard players add ESF$vehicleID.current ESF_vehicleID 1

# increment loop flag to avoid infinite loops
execute if score ESF$vehicleID.current ESF_vehicleID > ESF$vehicleID.max ESF_vehicleID run scoreboard players add ESF$vehicleID.loop ESF_vehicleID 1

# reset current ID if it exceeds max ID
execute if score ESF$vehicleID.current ESF_vehicleID > ESF$vehicleID.max ESF_vehicleID run scoreboard players set ESF$vehicleID.current ESF_vehicleID 0

# recursively get next available vehicle ID until an unused one is found
scoreboard players reset ESF$vehicleID.used ESF_vehicleID
execute unless score ESF$vehicleID.loop ESF_vehicleID matches 2.. as @e if score @s ESF_vehicleID = ESF$vehicleID.current ESF_vehicleID run scoreboard players set ESF$vehicleID.used ESF_vehicleID 1
execute if score ESF$vehicleID.used ESF_vehicleID matches 1 run function endermitescriptframework:scripts/drivablevehicles/uid/next

# return error
# vehicle limit reached
execute if score ESF$vehicleID.loop ESF_vehicleID matches 2.. run scoreboard players set ESF$vehicleID.current ESF_vehicleID -1

# clear loop flag
scoreboard players set ESF$vehicleID.loop ESF_vehicleID 0