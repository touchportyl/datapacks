# copy this seat's vehicle id into temporary holder
scoreboard players operation ESF$tmp ESF_vehicleID = @s ESF_vehicleID

# teleport root(s) that match this seat's vehicle id to the seat position
execute as @e[tag=cabriolet_root,tag=has_uid] if score @s ESF_vehicleID = ESF$tmp ESF_vehicleID run tp @s ^ ^ ^ ~ ~