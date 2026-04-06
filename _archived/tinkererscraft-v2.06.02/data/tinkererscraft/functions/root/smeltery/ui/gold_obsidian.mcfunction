# swaps the display from gold to obsidian


# empty, display next
execute as @s[tag=TC_outputgold,scores={TC_lGold=0}] at @s if block ^ ^1 ^1 minecraft:black_stained_glass run tag @s add TC_outputobsidian

# set next tag
execute as @s[tag=TC_outputgold] at @s unless block ^ ^1 ^1 minecraft:black_stained_glass run tag @s add TC_outputobsidian

# stop pouring upon changing display
execute as @s[scores={TC_OutputTimer=1..}] at @s unless block ^ ^1 ^1 minecraft:black_stained_glass run tag @s add TC_stoppour

# replace glass
execute as @s[tag=TC_outputgold] at @s unless block ^ ^1 ^1 minecraft:black_stained_glass run setblock ^ ^1 ^1 minecraft:black_stained_glass replace

# remove old tag
execute as @s[tag=TC_outputobsidian] at @s if block ^ ^1 ^1 minecraft:black_stained_glass run tag @s remove TC_outputgold