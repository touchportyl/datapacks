#> timeline for iron axes


execute as @s[scores={TC_OutputTimer=10}] run scoreboard players remove @s TC_lIron 1
execute as @s[scores={TC_OutputTimer=30}] run scoreboard players remove @s TC_lIron 1
execute as @s[scores={TC_OutputTimer=50}] run scoreboard players remove @s TC_lIron 1
execute as @s[scores={TC_OutputTimer=60..}] run tag @s add TC_stoppour

execute as @s[tag=TC_stoppour] at @s run function tinkererscraft:root/casting/item/controller