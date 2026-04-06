scoreboard players set ESF$cruzer.acceleration ESF_vSpeed 4

# slowing down when moving
scoreboard players set ESF$cruzer.braking ESF_vSpeed 3

# moving backward
scoreboard players set ESF$cruzer.acceleration.backward ESF_vSpeed 2

# turning speed
scoreboard players set ESF$cruzer.turn.speed ESF_vTurnAngle 3

# decay if no input
# always 1
scoreboard players set ESF$cruzer.drag ESF_vSpeed 1
scoreboard players set ESF$cruzer.turn.align ESF_vTurnAngle 1

# set the speed limits
scoreboard players set ESF$cruzer.maxspeed ESF_vSpeed 60
scoreboard players set ESF$cruzer.maxspeed.backward ESF_vSpeed -20

# set the turn limits
scoreboard players set ESF$cruzer.turn.maxleft ESF_vTurnAngle -15
scoreboard players set ESF$cruzer.turn.maxright ESF_vTurnAngle 15