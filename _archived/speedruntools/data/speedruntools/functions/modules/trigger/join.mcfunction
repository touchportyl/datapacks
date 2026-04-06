#> -----------------------------------------------
#> Speedrun Tools Datapack
#> This code is protected by the GNU GPLv3 License
#> © 2020 Portyl Studios
#> https://portylstudios.com
#> -----------------------------------------------


#> trigger


scoreboard players enable @a join

execute as @a[scores={join=1}] run function speedruntools:modules/initialize/teams/join_blue
execute as @a[scores={join=2}] run function speedruntools:modules/initialize/teams/join_red
execute as @a[scores={join=3}] run function speedruntools:modules/initialize/teams/join_green
execute as @a[scores={join=4}] run function speedruntools:modules/initialize/teams/join_yellow
execute as @a[scores={join=5}] run function speedruntools:modules/initialize/teams/join_purple
execute as @a[scores={join=6}] run function speedruntools:modules/initialize/teams/join_pink
execute as @a[scores={join=7}] run function speedruntools:modules/initialize/teams/leave

execute as @a[scores={join=1..}] run scoreboard players reset @s join


#> End of file
#> -----------
