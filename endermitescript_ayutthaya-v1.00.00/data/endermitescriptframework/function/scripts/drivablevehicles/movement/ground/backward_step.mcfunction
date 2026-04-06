execute at @s run tp ^ ^ ^-0.01
scoreboard players add @s ESF_vSpeed_ 1
execute unless score @s ESF_vSpeed_ matches 0 run function endermitescriptframework:scripts/drivablevehicles/movement/ground/backward_step