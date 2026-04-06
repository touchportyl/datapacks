#> -----------------------------------------------
#> Speedrun Tools Datapack
#> This code is protected by the GNU GPLv3 License
#> © 2020 Portyl Studios
#> https://portylstudios.com
#> -----------------------------------------------


#> trigger


scoreboard players enable @a start

execute as @a[scores={start=1}] run function speedruntools:start
execute as @a[scores={start=2}] run function speedruntools:modules/game/start

execute as @a[scores={start=1..}] run scoreboard players reset @s start


#> End of file
#> -----------
