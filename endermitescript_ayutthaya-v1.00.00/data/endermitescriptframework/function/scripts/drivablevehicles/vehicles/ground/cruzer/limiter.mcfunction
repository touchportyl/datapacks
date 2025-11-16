# enforce speed limits

execute if score @s ESF_vSpeed >= ESF$cruzer.maxspeed ESF_vSpeed run scoreboard players operation @s ESF_vSpeed = ESF$cruzer.maxspeed ESF_vSpeed
execute if score @s ESF_vSpeed <= ESF$cruzer.maxspeed.backward ESF_vSpeed run scoreboard players operation @s ESF_vSpeed = ESF$cruzer.maxspeed.backward ESF_vSpeed

# enforce turn limits
execute if score @s ESF_vTurnAngle <= ESF$cruzer.turn.maxleft ESF_vTurnAngle run scoreboard players operation @s ESF_vTurnAngle = ESF$cruzer.turn.maxleft ESF_vTurnAngle
execute if score @s ESF_vTurnAngle >= ESF$cruzer.turn.maxright ESF_vTurnAngle run scoreboard players operation @s ESF_vTurnAngle = ESF$cruzer.turn.maxright ESF_vTurnAngle