# apply drag

execute if score @s ESF_vSpeed matches 1.. run scoreboard players operation @s ESF_vSpeed -= ESF$cruzer.drag ESF_vSpeed
execute if score @s ESF_vSpeed matches ..-1 run scoreboard players operation @s ESF_vSpeed += ESF$cruzer.drag ESF_vSpeed

# realign wheel

execute if score @s ESF_vTurnAngle matches 1.. run scoreboard players operation @s ESF_vTurnAngle -= ESF$cruzer.turn.align ESF_vTurnAngle
execute if score @s ESF_vTurnAngle matches ..-1 run scoreboard players operation @s ESF_vTurnAngle += ESF$cruzer.turn.align ESF_vTurnAngle