#> timeline for obsidian blocks


execute as @s[scores={TC_OutputTimer=25}] run scoreboard players remove @s TC_lObsidian 1
execute as @s[scores={TC_OutputTimer=50..}] run tag @s add TC_stoppour

execute as @s[tag=TC_stoppour] at @s run function tinkererscraft:root/casting/item/controller