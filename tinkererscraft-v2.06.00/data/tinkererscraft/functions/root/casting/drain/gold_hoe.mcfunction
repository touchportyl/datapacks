#> timeline for gold hoes


execute as @s[scores={TC_OutputTimer=20}] run scoreboard players remove @s TC_lGold 1
execute as @s[scores={TC_OutputTimer=40}] run scoreboard players remove @s TC_lGold 1
execute as @s[scores={TC_OutputTimer=60..}] run tag @s add TC_stoppour

execute as @s[tag=TC_stoppour] at @s run function tinkererscraft:root/casting/item/controller