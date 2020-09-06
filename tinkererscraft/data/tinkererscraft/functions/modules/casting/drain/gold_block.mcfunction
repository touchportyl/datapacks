#> -----------------------------------------------
#> Tinkerer's Craft Datapack
#> This code is protected by the GNU GPLv3 License
#> © 2020 Portyl Studios
#> https://portylstudios.com
#> -----------------------------------------------


#> gold_block (references: ../modules/casting/drain)
# this is the timeline for gold blocks


execute as @s[scores={TC_OutputTimer=9}] run scoreboard players remove @s TC_lGold 1
execute as @s[scores={TC_OutputTimer=18}] run scoreboard players remove @s TC_lGold 1
execute as @s[scores={TC_OutputTimer=27}] run scoreboard players remove @s TC_lGold 1
execute as @s[scores={TC_OutputTimer=36}] run scoreboard players remove @s TC_lGold 1
execute as @s[scores={TC_OutputTimer=45}] run scoreboard players remove @s TC_lGold 1
execute as @s[scores={TC_OutputTimer=54}] run scoreboard players remove @s TC_lGold 1
execute as @s[scores={TC_OutputTimer=63}] run scoreboard players remove @s TC_lGold 1
execute as @s[scores={TC_OutputTimer=72}] run scoreboard players remove @s TC_lGold 1
execute as @s[scores={TC_OutputTimer=81}] run scoreboard players remove @s TC_lGold 1
execute as @s[scores={TC_OutputTimer=90..}] run tag @s add TC_stoppour

execute as @s[tag=TC_stoppour] at @s run function tinkererscraft:modules/casting/give_item


#> End of file
#> -----------
