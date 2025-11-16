scoreboard players set ESF$cabriolet.acceleration ESF_vSpeed 4

# slowing down when moving
scoreboard players set ESF$cabriolet.braking ESF_vSpeed 3

# moving backward
scoreboard players set ESF$cabriolet.acceleration.backward ESF_vSpeed 2

# turning speed
scoreboard players set ESF$cabriolet.turn.speed ESF_vTurnAngle 2

# decay if no input
# always 1
scoreboard players set ESF$cabriolet.drag ESF_vSpeed 1
scoreboard players set ESF$cabriolet.turn.align ESF_vTurnAngle 1

# set the speed limits
scoreboard players set ESF$cabriolet.maxspeed ESF_vSpeed 70
scoreboard players set ESF$cabriolet.maxspeed.backward ESF_vSpeed -40

# set the turn limits
scoreboard players set ESF$cabriolet.turn.maxleft ESF_vTurnAngle -8
scoreboard players set ESF$cabriolet.turn.maxright ESF_vTurnAngle 8