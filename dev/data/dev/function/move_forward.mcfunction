execute at @s run tp @s ^ ^ ^0.01
scoreboard players remove @s dev_speed_ 1
execute unless score @s dev_speed_ matches 0 run function dev:move_forward