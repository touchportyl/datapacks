#> -----------------------------------------------
#> Vanilla Essentials Datapack
#> This code is protected by the GNU GPLv3 License
#> © 2020 Portyl Studios
#> https://portylstudios.com
#> -----------------------------------------------


#> stats
# display stats


execute if entity @s[team=VE_Stats] run function vanillaessentials:modules/stats/disable
execute if entity @s[tag=!VE_localvar_hasStats] run function vanillaessentials:modules/stats/enable

tag @s remove VE_localvar_hasStats
scoreboard players reset @s stats


#> End of file
#> -----------
