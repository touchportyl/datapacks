#> -----------------------------------------------
#> Tinkerer's Craft Datapack
#> This code is protected by the GNU GPLv3 License
#> © 2020 Portyl Studios
#> https://portylstudios.com
#> -----------------------------------------------


#> ------------
#> global timer

scoreboard players add $global.timer TP_Timer 1

#
# tick 01 = broadcast api
execute if score $global.timer TP_Timer matches 1 run schedule function tinkererscraft:api 1t append
#
# tick 02 = pre-load
execute if score $global.timer TP_Timer matches 2 run schedule function tinkererscraft:preload 1t append
#
# tick 03 = load
#execute if score $global.timer TP_Timer matches 3 run schedule function tinkererscraft: 1t append
#
# tick 04 = tick
#execute if score $global.timer TP_Timer matches 4 run schedule function tinkererscraft: 1t append
#
# tick 05 =
#execute if score $global.timer TP_Timer matches 5 run schedule function tinkererscraft: 1t append
#
# tick 06 =
#execute if score $global.timer TP_Timer matches 6 run schedule function tinkererscraft: 1t append
#
# tick 07 =
#execute if score $global.timer TP_Timer matches 7 run schedule function tinkererscraft: 1t append
#
# tick 08 =
#execute if score $global.timer TP_Timer matches 8 run schedule function tinkererscraft: 1t append
#
# tick 09 =
#execute if score $global.timer TP_Timer matches 9 run schedule function tinkererscraft: 1t append
#
# tick 10 =
#execute if score $global.timer TP_Timer matches 10 run schedule function tinkererscraft: 1t append
#
# tick 11 =
#execute if score $global.timer TP_Timer matches 11 run schedule function tinkererscraft: 1t append
#
# tick 12 =
#execute if score $global.timer TP_Timer matches 12 run schedule function tinkererscraft: 1t append
#
# tick 13 =
#execute if score $global.timer TP_Timer matches 13 run schedule function tinkererscraft: 1t append
#
# tick 14 =
#execute if score $global.timer TP_Timer matches 14 run schedule function tinkererscraft: 1t append
#
# tick 15 =
#execute if score $global.timer TP_Timer matches 15 run schedule function tinkererscraft: 1t append
#
# tick 16 = load test
#execute if score $global.timer TP_Timer matches 16 run schedule function tinkererscraft: 1t append
#
# tick 17 = code testing
#execute if score $global.timer TP_Timer matches 17 run schedule function tinkererscraft: 1t append
#
# tick 18 = garbage collection for code testing (so that it doesn't linger and cause errors)
#execute if score $global.timer TP_Timer matches 18 run schedule function tinkererscraft: 1t append
#
# tick 19 = garbage collection
#execute if score $global.timer TP_Timer matches 19 run schedule function tinkererscraft: 1t append
#
# tick 20 = reset timer
execute if score $global.timer TP_Timer matches 20.. run scoreboard players reset $global.timer TP_Timer
#
# tick ∞  = tick checks
function tinkererscraft:main


#> End of file
#> -----------
