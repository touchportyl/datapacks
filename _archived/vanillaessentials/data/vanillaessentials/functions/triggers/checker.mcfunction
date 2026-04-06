#> -----------------------------------------------
#> Vanilla Essentials Datapack
#> This code is protected by the GNU GPLv3 License
#> © 2020 Portyl Studios
#> https://portylstudios.com
#> -----------------------------------------------


#> checker
# checks for triggers

execute as @a[tag=!VE_NoTrigger] run function vanillaessentials:triggers/enable

execute as @a[scores={stats=1..}] run function vanillaessentials:triggers/stats
execute as @a[scores={playtime=1..}] run function vanillaessentials:triggers/playtime
execute as @a[scores={uptime=1..}] run function vanillaessentials:triggers/uptime
execute as @a[scores={pathspeed=1..}] run function vanillaessentials:triggers/pathspeed


#> End of file
#> -----------
