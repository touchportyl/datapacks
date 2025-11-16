# copy this root's vehicle id into a temp holder
scoreboard players operation ESF$tmp ESF_vehicleID = @s ESF_vehicleID

# for every part with a UID, if its ESF_vehicleID equals ESF$tmp, teleport it to this root's position with offsets
execute as @e[tag=cabriolet,tag=has_uid] if score @s ESF_vehicleID = ESF$tmp ESF_vehicleID run tp @s ^-0.4 ^-0.9 ^2.3 ~180 ~