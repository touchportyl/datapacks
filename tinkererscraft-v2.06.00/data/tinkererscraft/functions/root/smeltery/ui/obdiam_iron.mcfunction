# swaps the display from obdiam to iron


# empty, display next
execute as @s[tag=TC_outputobdiam,scores={TC_lObdiam=0}] at @s if block ^ ^1 ^1 minecraft:black_stained_glass run tag @s add TC_outputiron

# set next tag
execute as @s[tag=TC_outputobdiam] at @s unless block ^ ^1 ^1 minecraft:black_stained_glass run tag @s add TC_outputiron

# stop pouring upon changing display
execute as @s[scores={TC_OutputTimer=1..}] at @s unless block ^ ^1 ^1 minecraft:black_stained_glass run tag @s add TC_stoppour

# replace glass
execute as @s[tag=TC_outputobdiam] at @s unless block ^ ^1 ^1 minecraft:black_stained_glass run setblock ^ ^1 ^1 minecraft:black_stained_glass replace

# remove old tag
execute as @s[tag=TC_outputiron] at @s if block ^ ^1 ^1 minecraft:black_stained_glass run tag @s remove TC_outputobdiam