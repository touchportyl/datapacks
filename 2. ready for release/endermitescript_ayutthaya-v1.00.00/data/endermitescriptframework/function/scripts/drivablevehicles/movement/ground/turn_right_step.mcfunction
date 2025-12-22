execute if score @s ESF_vSpeed matches 1.. at @s run tp @s ~ ~ ~ ~0.5 ~
execute if score @s ESF_vSpeed matches ..-1 at @s run tp @s ~ ~ ~ ~-0.5 ~
scoreboard players remove @s ESF_vTurnAngle_ 1
execute unless score @s ESF_vTurnAngle_ matches 0 run function endermitescriptframework:scripts/drivablevehicles/movement/ground/turn_right_step