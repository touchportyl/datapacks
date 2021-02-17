#> -----------------------------------------------
#> Vanilla Essentials Datapack
#> This code is protected by the GNU GPLv3 License
#> © 2020 Portyl Studios
#> https://portylstudios.com
#> -----------------------------------------------


#> increment

# track server time
scoreboard players add Server TP_Ticks 1

execute if score Server TP_Ticks matches 20.. run scoreboard players add Server TP_Seconds 1
execute if score Server TP_Ticks matches 20.. run scoreboard players remove Server TP_Ticks 20

execute if score Server TP_Seconds matches 60.. run scoreboard players add Server TP_Minutes 1
execute if score Server TP_Seconds matches 60.. run scoreboard players remove Server TP_Seconds 60

execute if score Server TP_Minutes matches 60.. run scoreboard players add Server TP_Hours 1
execute if score Server TP_Minutes matches 60.. run scoreboard players remove Server TP_Minutes 60

execute if score Server TP_Hours matches 24.. run scoreboard players add Server TP_Days 1
execute if score Server TP_Hours matches 24.. run scoreboard players remove Server TP_Hours 24

execute if score Server TP_Days matches 30.. run scoreboard players add Server TP_Months 1
execute if score Server TP_Days matches 30.. run scoreboard players remove Server TP_Days 30


# track individual play time
scoreboard players add @a TP_Ticks 1
execute as @a[scores={TP_Ticks=20..}] run function vanillaessentials:modules/playtime/increment/second
execute as @a[scores={TP_Seconds=60..}] run function vanillaessentials:modules/playtime/increment/minute
execute as @a[scores={TP_Minutes=60..}] run function vanillaessentials:modules/playtime/increment/hour
execute as @a[scores={TP_Hours=24..}] run function vanillaessentials:modules/playtime/increment/day
execute as @a[scores={TP_Days=30..}] run function vanillaessentials:modules/playtime/increment/month


#> End of file
#> -----------
