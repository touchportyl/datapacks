# apply unique inputs
# jump to brake (disables accelerator)
# ws to accelerate and decelerate
# ad to turn left and right
scoreboard players operation ESF$tmp ESF_vehicleID = @s ESF_vehicleID

execute if predicate input:jump as @e[tag=cruzer_seat,tag=has_uid] if score @s ESF_vehicleID = ESF$tmp ESF_vehicleID if score @s ESF_vSpeed matches ..-1 run scoreboard players operation @s ESF_vSpeed += ESF$cruzer.braking ESF_vSpeed
execute if predicate input:jump as @e[tag=cruzer_seat,tag=has_uid] if score @s ESF_vehicleID = ESF$tmp ESF_vehicleID if score @s ESF_vSpeed matches 1.. run scoreboard players operation @s ESF_vSpeed -= ESF$cruzer.braking ESF_vSpeed

execute unless predicate input:jump if predicate input:forward as @e[tag=cruzer_seat,tag=has_uid] if score @s ESF_vehicleID = ESF$tmp ESF_vehicleID if score @s ESF_vSpeed matches ..-1 run scoreboard players operation @s ESF_vSpeed += ESF$cruzer.braking ESF_vSpeed
execute unless predicate input:jump if predicate input:forward as @e[tag=cruzer_seat,tag=has_uid] if score @s ESF_vehicleID = ESF$tmp ESF_vehicleID unless score @s ESF_vSpeed matches ..-1 run scoreboard players operation @s ESF_vSpeed += ESF$cruzer.acceleration ESF_vSpeed
execute unless predicate input:jump if predicate input:backward as @e[tag=cruzer_seat,tag=has_uid] if score @s ESF_vehicleID = ESF$tmp ESF_vehicleID if score @s ESF_vSpeed matches 1.. run scoreboard players operation @s ESF_vSpeed -= ESF$cruzer.braking ESF_vSpeed
execute unless predicate input:jump if predicate input:backward as @e[tag=cruzer_seat,tag=has_uid] if score @s ESF_vehicleID = ESF$tmp ESF_vehicleID unless score @s ESF_vSpeed matches 1.. run scoreboard players operation @s ESF_vSpeed -= ESF$cruzer.acceleration.backward ESF_vSpeed
  
execute if predicate input:left as @e[tag=cruzer_seat,tag=has_uid] if score @s ESF_vehicleID = ESF$tmp ESF_vehicleID run scoreboard players operation @s ESF_vTurnAngle -= ESF$cruzer.turn.speed ESF_vTurnAngle
execute if predicate input:right as @e[tag=cruzer_seat,tag=has_uid] if score @s ESF_vehicleID = ESF$tmp ESF_vehicleID run scoreboard players operation @s ESF_vTurnAngle += ESF$cruzer.turn.speed ESF_vTurnAngle