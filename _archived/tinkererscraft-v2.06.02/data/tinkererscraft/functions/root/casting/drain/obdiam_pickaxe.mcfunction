#> timeline for obdiam pickaxes


execute as @s[scores={TC_OutputTimer=10}] run scoreboard players remove @s TC_lObdiam 1
execute as @s[scores={TC_OutputTimer=40}] run scoreboard players remove @s TC_lObdiam 1
execute as @s[scores={TC_OutputTimer=70}] run scoreboard players remove @s TC_lObdiam 1
execute as @s[scores={TC_OutputTimer=100..}] run tag @s add TC_stoppour

execute as @s[tag=TC_stoppour] at @s run function tinkererscraft:root/casting/item/controller