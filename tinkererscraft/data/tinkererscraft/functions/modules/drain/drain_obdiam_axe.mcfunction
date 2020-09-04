#> -----------------------------------------------
#> Tinkerer's Craft Datapack
#> This code is protected by the GNU GPLv3 License
#> © 2020 Portyl Studios
#> https://portylstudios.com
#> -----------------------------------------------


#> drain_obdiam_axe
# this is the timeline for obdiam axes


execute as @s[scores={TC_OutputTimer=10}] run scoreboard players remove @s TC_lObdiam 1
execute as @s[scores={TC_OutputTimer=40}] run scoreboard players remove @s TC_lObdiam 1
execute as @s[scores={TC_OutputTimer=70}] run scoreboard players remove @s TC_lObdiam 1
execute as @s[scores={TC_OutputTimer=100..}] run tag @s add TC_stoppour

execute as @s[tag=TC_stoppour] at @s run function tinkererscraft:modules/casting_item


#> End of file
#> -----------