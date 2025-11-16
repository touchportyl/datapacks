# enforce speed limits

execute if score @s ESF_vSpeed >= ESF$cabriolet.maxspeed ESF_vSpeed run scoreboard players operation @s ESF_vSpeed = ESF$cabriolet.maxspeed ESF_vSpeed
execute if score @s ESF_vSpeed <= ESF$cabriolet.maxspeed.backward ESF_vSpeed run scoreboard players operation @s ESF_vSpeed = ESF$cabriolet.maxspeed.backward ESF_vSpeed

# enforce turn limits
execute if score @s ESF_vTurnAngle <= ESF$cabriolet.turn.maxleft ESF_vTurnAngle run scoreboard players operation @s ESF_vTurnAngle = ESF$cabriolet.turn.maxleft ESF_vTurnAngle
execute if score @s ESF_vTurnAngle >= ESF$cabriolet.turn.maxright ESF_vTurnAngle run scoreboard players operation @s ESF_vTurnAngle = ESF$cabriolet.turn.maxright ESF_vTurnAngle