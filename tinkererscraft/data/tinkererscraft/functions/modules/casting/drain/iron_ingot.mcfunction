#> -----------------------------------------------
#> Tinkerer's Craft Datapack
#> This code is protected by the GNU GPLv3 License
#> © 2020 Portyl Studios
#> https://portylstudios.com
#> -----------------------------------------------


#> iron_ingot (references: ../modules/casting/drain)
# this is the timeline for iron ingots


execute as @s[scores={TC_OutputTimer=10}] run scoreboard players remove @s TC_lIron 1
execute as @s[scores={TC_OutputTimer=20..}] run tag @s add TC_stoppour

execute as @s[tag=TC_stoppour] at @s run function tinkererscraft:modules/casting/give_item


#> End of file
#> -----------
