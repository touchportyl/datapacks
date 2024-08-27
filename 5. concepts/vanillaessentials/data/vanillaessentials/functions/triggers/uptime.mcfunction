#> -----------------------------------------------
#> Vanilla Essentials Datapack
#> This code is protected by the GNU GPLv3 License
#> © 2020 Portyl Studios
#> https://portylstudios.com
#> -----------------------------------------------


#> playtime
# display play time


tellraw @s [{"text":""},{"text":"\nServer uptime:\n"}]

execute if score Server TP_Months matches 1 run tellraw @s [{"text":""},{"score":{"name":"Server","objective":"TP_Months"}},{"text":" month"}]
execute if score Server TP_Months matches 2.. run tellraw @s [{"text":""},{"score":{"name":"Server","objective":"TP_Months"}},{"text":" months"}]

execute if score Server TP_Days matches 1 run tellraw @s [{"text":""},{"score":{"name":"Server","objective":"TP_Days"}},{"text":" day"}]
execute if score Server TP_Days matches 2.. run tellraw @s [{"text":""},{"score":{"name":"Server","objective":"TP_Days"}},{"text":" days"}]

execute if score Server TP_Hours matches 1 run tellraw @s [{"text":""},{"score":{"name":"Server","objective":"TP_Hours"}},{"text":" hour"}]
execute if score Server TP_Hours matches 2.. run tellraw @s [{"text":""},{"score":{"name":"Server","objective":"TP_Hours"}},{"text":" hours"}]

execute if score Server TP_Minutes matches 1 run tellraw @s [{"text":""},{"score":{"name":"Server","objective":"TP_Minutes"}},{"text":" minute"}]
execute if score Server TP_Minutes matches 2.. run tellraw @s [{"text":""},{"score":{"name":"Server","objective":"TP_Minutes"}},{"text":" minutes"}]

execute if score Server TP_Seconds matches 1 run tellraw @s [{"text":""},{"score":{"name":"Server","objective":"TP_Seconds"}},{"text":" second\n"}]
execute if score Server TP_Seconds matches 2.. run tellraw @s [{"text":""},{"score":{"name":"Server","objective":"TP_Seconds"}},{"text":" seconds\n"}]


scoreboard players reset @s uptime


#> End of file
#> -----------
