#> -----------------------------------------------
#> Tinkerer's Craft Datapack
#> This code is protected by the GNU GPLv3 License
#> © 2020 Portyl Studios
#> https://portylstudios.com
#> -----------------------------------------------


#> gold_sword (references: ../modules/casting/drain)
# this is the timeline for gold swords


execute as @s[scores={TC_OutputTimer=20}] run scoreboard players remove @s TC_lGold 1
execute as @s[scores={TC_OutputTimer=40}] run scoreboard players remove @s TC_lGold 1
execute as @s[scores={TC_OutputTimer=60..}] run tag @s add TC_stoppour

execute as @s[tag=TC_stoppour] at @s run function tinkererscraft:modules/casting/custom_items


#> End of file
#> -----------
