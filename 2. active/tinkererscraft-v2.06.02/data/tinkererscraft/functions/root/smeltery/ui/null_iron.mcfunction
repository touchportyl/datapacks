# swaps the display from the tutorial display to iron


# set next tag
execute as @s[tag=TC_outputnull] at @s unless block ^ ^1 ^1 minecraft:black_stained_glass run tag @s add TC_outputiron

# replace glass
execute as @s[tag=TC_outputnull] at @s unless block ^ ^1 ^1 minecraft:black_stained_glass run setblock ^ ^1 ^1 minecraft:black_stained_glass replace

# remove old tag
execute as @s[tag=TC_outputiron] at @s if block ^ ^1 ^1 minecraft:black_stained_glass run tag @s remove TC_outputnull