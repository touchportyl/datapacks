#> -----------------------------------------------
#> Speedrun Tools Datapack
#> This code is protected by the GNU GPLv3 License
#> © 2020 Portyl Studios
#> https://portylstudios.com
#> -----------------------------------------------


execute if entity @s[team=blue] store result score Dragon ST_BlueSplit run scoreboard players get $stat.timer ST_Statistics
execute if entity @s[team=red] store result score Dragon ST_RedSplit run scoreboard players get $stat.timer ST_Statistics
execute if entity @s[team=green] store result score Dragon ST_GreenSplit run scoreboard players get $stat.timer ST_Statistics
execute if entity @s[team=yellow] store result score Dragon ST_YellowSplit run scoreboard players get $stat.timer ST_Statistics
execute if entity @s[team=purple] store result score Dragon ST_PurpleSplit run scoreboard players get $stat.timer ST_Statistics
execute if entity @s[team=pink] store result score Dragon ST_PinkSplit run scoreboard players get $stat.timer ST_Statistics


#> End of file
#> -----------
