#> timeline for irgol swords


execute as @s[scores={TC_OutputTimer=20}] run scoreboard players remove @s TC_lIrgol 1
execute as @s[scores={TC_OutputTimer=50}] run scoreboard players remove @s TC_lIrgol 1
execute as @s[scores={TC_OutputTimer=80..}] run tag @s add TC_stoppour

execute as @s[tag=TC_stoppour] at @s run function tinkererscraft:root/casting/item/controller