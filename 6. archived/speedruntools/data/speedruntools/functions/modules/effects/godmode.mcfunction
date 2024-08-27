#> -----------------------------------------------
#> Speedrun Tools Datapack
#> This code is protected by the GNU GPLv3 License
#> © 2020 Portyl Studios
#> https://portylstudios.com
#> -----------------------------------------------


effect give @s minecraft:instant_health 2 0 true

# useless but good to know this is possible
scoreboard objectives add ST_TempBuffer dummy
execute store result score @s ST_TempBuffer run data get entity @s foodLevel 1
execute if score @s ST_TempBuffer < $20 ST_NumberArray run effect give @s minecraft:saturation 1 0 true
scoreboard objectives remove ST_TempBuffer


#> End of file
#> -----------
