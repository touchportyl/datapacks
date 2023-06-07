#> -----------------------------------------------
#> Vanilla Essentials Datapack
#> This code is protected by the GNU GPLv3 License
#> © 2020 Portyl Studios
#> https://portylstudios.com
#> -----------------------------------------------


#> path speed
# toggle path speed on and off for you


execute if entity @s[scores={VE_PathSpeed=1}] run function vanillaessentials:modules/pathspeed/disable
execute if entity @s[tag=!VE_localvar_hasPathSpeed] run function vanillaessentials:modules/pathspeed/enable

tag @s remove VE_localvar_hasPathSpeed
scoreboard players reset @s pathspeed


#> End of file
#> -----------
