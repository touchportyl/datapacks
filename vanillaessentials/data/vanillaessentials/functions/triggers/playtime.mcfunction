#> -----------------------------------------------
#> Vanilla Essentials Datapack
#> This code is protected by the GNU GPLv3 License
#> © 2020 Portyl Studios
#> https://portylstudios.com
#> -----------------------------------------------


#> playtime
# display play time


tellraw @s [{"text":""},{"text":"\nTotal playtime:\n"}]

execute if score @s TP_Months matches 1 run tellraw @s [{"text":""},{"score":{"name":"@s","objective":"TP_Months"}},{"text":" month"}]
execute if score @s TP_Months matches 2.. run tellraw @s [{"text":""},{"score":{"name":"@s","objective":"TP_Months"}},{"text":" months"}]

execute if score @s TP_Days matches 1 run tellraw @s [{"text":""},{"score":{"name":"@s","objective":"TP_Days"}},{"text":" day"}]
execute if score @s TP_Days matches 2.. run tellraw @s [{"text":""},{"score":{"name":"@s","objective":"TP_Days"}},{"text":" days"}]

execute if score @s TP_Hours matches 1 run tellraw @s [{"text":""},{"score":{"name":"@s","objective":"TP_Hours"}},{"text":" hour"}]
execute if score @s TP_Hours matches 2.. run tellraw @s [{"text":""},{"score":{"name":"@s","objective":"TP_Hours"}},{"text":" hours"}]

execute if score @s TP_Minutes matches 1 run tellraw @s [{"text":""},{"score":{"name":"@s","objective":"TP_Minutes"}},{"text":" minute"}]
execute if score @s TP_Minutes matches 2.. run tellraw @s [{"text":""},{"score":{"name":"@s","objective":"TP_Minutes"}},{"text":" minutes"}]

execute if score @s TP_Seconds matches 1 run tellraw @s [{"text":""},{"score":{"name":"@s","objective":"TP_Seconds"}},{"text":" second\n"}]
execute if score @s TP_Seconds matches 2.. run tellraw @s [{"text":""},{"score":{"name":"@s","objective":"TP_Seconds"}},{"text":" seconds\n"}]


scoreboard players reset @s playtime


#> End of file
#> -----------