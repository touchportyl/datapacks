
# bounds
# min.x  -6400
# max.x   2400
# min.z  -1900
# max.z   2900

# x distance 8800
# x steps 137.5
# z distance 4800
# z steps 75

# reset delay
scoreboard players reset @s AroundTheWorld

# success
execute if score TRACKER$generate.step.x AroundTheWorld matches 138 if score TRACKER$generate.step.z AroundTheWorld matches 75 run return run tag @s remove AW_generate

# if at border, go back to the top and step across (138 steps)
execute if score TRACKER$generate.step.x AroundTheWorld matches 138 run tp @s -6400 150 ~64 0 90
execute if score TRACKER$generate.step.x AroundTheWorld matches 138 run scoreboard players add TRACKER$generate.step.z AroundTheWorld 1
# pause for an extra 10s
execute if score TRACKER$generate.step.x AroundTheWorld matches 138 run scoreboard players set @s AroundTheWorld -200
execute if score TRACKER$generate.step.x AroundTheWorld matches 138 run return run scoreboard players set TRACKER$generate.step.x AroundTheWorld 0

# if end, snap to the end (137 steps)
execute if score TRACKER$generate.step.x AroundTheWorld matches 137 run tp @s 2400 150 ~ 0 90
execute if score TRACKER$generate.step.x AroundTheWorld matches 137 run scoreboard players add TRACKER$generate.step.x AroundTheWorld 1

# else move 1 step across x
execute if score TRACKER$generate.step.x AroundTheWorld matches ..136 run tp @s ~64 150 ~ 0 90
execute if score TRACKER$generate.step.x AroundTheWorld matches ..136 run scoreboard players add TRACKER$generate.step.x AroundTheWorld 1
