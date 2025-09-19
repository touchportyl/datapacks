# swaps the display from irgol to obdiam


# empty, display next
execute as @s[tag=TC_outputirgol,scores={TC_lIrgol=0}] at @s if block ^ ^1 ^1 minecraft:black_stained_glass run tag @s add TC_outputobdiam

# set next tag
execute as @s[tag=TC_outputirgol] at @s unless block ^ ^1 ^1 minecraft:black_stained_glass run tag @s add TC_outputobdiam

# stop pouring upon changing display
execute as @s[scores={TC_OutputTimer=1..}] at @s unless block ^ ^1 ^1 minecraft:black_stained_glass run tag @s add TC_stoppour

# replace glass
execute as @s[tag=TC_outputirgol] at @s unless block ^ ^1 ^1 minecraft:black_stained_glass run setblock ^ ^1 ^1 minecraft:black_stained_glass replace

# remove old tag
execute as @s[tag=TC_outputobdiam] at @s if block ^ ^1 ^1 minecraft:black_stained_glass run tag @s remove TC_outputirgol