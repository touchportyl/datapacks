# swaps the display from obsidian to irgol


# empty, display next
execute as @s[tag=TC_outputobsidian,scores={TC_lObsidian=0}] at @s if block ^ ^1 ^1 minecraft:black_stained_glass run tag @s add TC_outputirgol

# set next tag
execute as @s[tag=TC_outputobsidian] at @s unless block ^ ^1 ^1 minecraft:black_stained_glass run tag @s add TC_outputirgol

# stop pouring upon changing display
execute as @s[scores={TC_OutputTimer=1..}] at @s unless block ^ ^1 ^1 minecraft:black_stained_glass run tag @s add TC_stoppour

# replace glass
execute as @s[tag=TC_outputobsidian] at @s unless block ^ ^1 ^1 minecraft:black_stained_glass run setblock ^ ^1 ^1 minecraft:black_stained_glass replace

# remove old tag
execute as @s[tag=TC_outputirgol] at @s if block ^ ^1 ^1 minecraft:black_stained_glass run tag @s remove TC_outputobsidian