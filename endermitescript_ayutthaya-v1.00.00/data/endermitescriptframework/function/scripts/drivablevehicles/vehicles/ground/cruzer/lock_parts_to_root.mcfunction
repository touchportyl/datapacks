# copy this root's vehicle id into a temp holder
scoreboard players operation ESF$tmp ESF_vehicleID = @s ESF_vehicleID

# for every part with a UID, if its ESF_vehicleID equals ESF$tmp, teleport it to this root's position with offsets
execute as @e[tag=cruzer,tag=has_uid] if score @s ESF_vehicleID = ESF$tmp ESF_vehicleID run tp @s ^ ^-1.0 ^-0.2 ~180 ~