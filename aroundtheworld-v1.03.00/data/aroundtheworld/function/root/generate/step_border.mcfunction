#> Hardcoded border generation for Around The World
# Generates only the top, bottom, left, and right borders of the map
# bounds: x [-6400, 2400], z [-1900, 2900]

# bounds
# min.x  -6400
# max.x   2400
# min.z  -1900
# max.z   2900

# reset delay
scoreboard players reset @s AroundTheWorld

#> Top border (z = -1900, x from -6400 to 2400, 138 steps)
execute if score TRACKER$borders.section AroundTheWorld matches 0 if score TRACKER$borders.step AroundTheWorld matches ..137 run tp @s -6400 150 -1900 0 90
execute if score TRACKER$borders.section AroundTheWorld matches 0 if score TRACKER$borders.step AroundTheWorld matches ..136 run tp @s ~64 150 -1900 0 90
execute if score TRACKER$borders.section AroundTheWorld matches 0 if score TRACKER$borders.step AroundTheWorld matches ..137 run scoreboard players add TRACKER$borders.step AroundTheWorld 1

# transition to right border
execute if score TRACKER$borders.section AroundTheWorld matches 0 if score TRACKER$borders.step AroundTheWorld matches 138 run scoreboard players set TRACKER$borders.section AroundTheWorld 1
execute if score TRACKER$borders.section AroundTheWorld matches 1 if score TRACKER$borders.step AroundTheWorld matches 0 run scoreboard players set TRACKER$borders.step AroundTheWorld 0
execute if score TRACKER$borders.section AroundTheWorld matches 1 if score TRACKER$borders.step AroundTheWorld matches 0 run scoreboard players set @s AroundTheWorld -20

#> Right border (x = 2400, z from -1900 to 2900, 75 steps)
execute if score TRACKER$borders.section AroundTheWorld matches 1 if score TRACKER$borders.step AroundTheWorld matches ..74 run tp @s 2400 150 -1900 0 90
execute if score TRACKER$borders.section AroundTheWorld matches 1 if score TRACKER$borders.step AroundTheWorld matches ..73 run tp @s 2400 150 ~64 0 90
execute if score TRACKER$borders.section AroundTheWorld matches 1 if score TRACKER$borders.step AroundTheWorld matches ..74 run scoreboard players add TRACKER$borders.step AroundTheWorld 1

# transition to bottom border
execute if score TRACKER$borders.section AroundTheWorld matches 1 if score TRACKER$borders.step AroundTheWorld matches 75 run scoreboard players set TRACKER$borders.section AroundTheWorld 2
execute if score TRACKER$borders.section AroundTheWorld matches 2 if score TRACKER$borders.step AroundTheWorld matches 0 run scoreboard players set TRACKER$borders.step AroundTheWorld 0
execute if score TRACKER$borders.section AroundTheWorld matches 2 if score TRACKER$borders.step AroundTheWorld matches 0 run scoreboard players set @s AroundTheWorld -20

#> Bottom border (z = 2900, x from 2400 to -6400, 138 steps, reversed)
execute if score TRACKER$borders.section AroundTheWorld matches 2 if score TRACKER$borders.step AroundTheWorld matches ..137 run tp @s 2400 150 2900 0 90
execute if score TRACKER$borders.section AroundTheWorld matches 2 if score TRACKER$borders.step AroundTheWorld matches ..136 run tp @s ~-64 150 2900 0 90
execute if score TRACKER$borders.section AroundTheWorld matches 2 if score TRACKER$borders.step AroundTheWorld matches ..137 run scoreboard players add TRACKER$borders.step AroundTheWorld 1

# transition to left border
execute if score TRACKER$borders.section AroundTheWorld matches 2 if score TRACKER$borders.step AroundTheWorld matches 138 run scoreboard players set TRACKER$borders.section AroundTheWorld 3
execute if score TRACKER$borders.section AroundTheWorld matches 3 if score TRACKER$borders.step AroundTheWorld matches 0 run scoreboard players set TRACKER$borders.step AroundTheWorld 0
execute if score TRACKER$borders.section AroundTheWorld matches 3 if score TRACKER$borders.step AroundTheWorld matches 0 run scoreboard players set @s AroundTheWorld -20

#> Left border (x = -6400, z from 2900 to -1900, 75 steps, reversed)
execute if score TRACKER$borders.section AroundTheWorld matches 3 if score TRACKER$borders.step AroundTheWorld matches ..74 run tp @s -6400 150 2900 0 90
execute if score TRACKER$borders.section AroundTheWorld matches 3 if score TRACKER$borders.step AroundTheWorld matches ..73 run tp @s -6400 150 ~-64 0 90
execute if score TRACKER$borders.section AroundTheWorld matches 3 if score TRACKER$borders.step AroundTheWorld matches ..74 run scoreboard players add TRACKER$borders.step AroundTheWorld 1

# complete
execute if score TRACKER$borders.section AroundTheWorld matches 3 if score TRACKER$borders.step AroundTheWorld matches 75 run return run tag @s remove AW_generate_border

#> End of file
