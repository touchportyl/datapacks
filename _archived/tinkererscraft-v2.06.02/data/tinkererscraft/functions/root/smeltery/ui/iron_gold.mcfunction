# swaps the display from iron to gold


# empty, display next
execute as @s[tag=TC_outputiron,scores={TC_lIron=0}] at @s if block ^ ^1 ^1 minecraft:black_stained_glass run tag @s add TC_outputgold

# set next tag
execute as @s[tag=TC_outputiron] at @s unless block ^ ^1 ^1 minecraft:black_stained_glass run tag @s add TC_outputgold

# stop pouring upon changing display
execute as @s[scores={TC_OutputTimer=1..}] at @s unless block ^ ^1 ^1 minecraft:black_stained_glass run tag @s add TC_stoppour

# replace glass
execute as @s[tag=TC_outputiron] at @s unless block ^ ^1 ^1 minecraft:black_stained_glass run setblock ^ ^1 ^1 minecraft:black_stained_glass replace

# remove old tag
execute as @s[tag=TC_outputgold] at @s if block ^ ^1 ^1 minecraft:black_stained_glass run tag @s remove TC_outputiron