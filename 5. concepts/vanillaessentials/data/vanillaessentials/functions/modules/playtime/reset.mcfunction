#> -----------------------------------------------
#> Vanilla Essentials Datapack
#> This code is protected by the GNU GPLv3 License
#> © 2020 Portyl Studios
#> https://portylstudios.com
#> -----------------------------------------------


#> reset
# wipe all playtime stats


scoreboard objectives remove TP_Ticks
scoreboard objectives remove TP_Seconds
scoreboard objectives remove TP_Minutes
scoreboard objectives remove TP_Hours
scoreboard objectives remove TP_Days
scoreboard objectives remove TP_Months

scoreboard objectives add TP_Ticks dummy [{"text":"Global Time - Ticks","color":"white"}]
scoreboard objectives add TP_Seconds dummy [{"text":"Global Time - Seconds","color":"white"}]
scoreboard objectives add TP_Minutes dummy [{"text":"Global Time - Minutes","color":"white"}]
scoreboard objectives add TP_Hours dummy [{"text":"Global Time - Hours","color":"white"}]
scoreboard objectives add TP_Days dummy [{"text":"Global Time - Days","color":"white"}]
scoreboard objectives add TP_Months dummy [{"text":"Global Time - Months","color":"white"}]


#> End of file
#> -----------
