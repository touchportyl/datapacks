#> timeline for gold pressure plates


execute as @s[scores={TC_OutputTimer=10}] run scoreboard players remove @s TC_lGold 1
execute as @s[scores={TC_OutputTimer=30..}] run tag @s add TC_stoppour

execute as @s[tag=TC_stoppour] at @s run function tinkererscraft:root/casting/item/controller