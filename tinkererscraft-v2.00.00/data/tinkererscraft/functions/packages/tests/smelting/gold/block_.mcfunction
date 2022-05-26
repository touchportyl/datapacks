#> -----------------------------------------------
#> Tinkerer's Craft Datapack
#> This code is protected by the GNU GPLv3 License
#> © 2020 Portyl Studios
#> https://portylstudios.com
#> -----------------------------------------------


#> test


execute unless score @e[tag=TC_temp_tests_smelting,sort=nearest,limit=1] TC_lGold matches 9 run tellraw @a [{"text":""},{"text":"\n> Bug detected! ","color":"red"},{"text":"Smelting gold block should produce 9 liquid gold but it produces "},{"score":{"name":"@e[tag=TC_temp_tests_smelting,sort=nearest,limit=1]","objective":"TC_lGold"}},{"text":" instead."}]

execute if score @e[tag=TC_temp_tests_smelting,sort=nearest,limit=1] TC_lGold matches 9 run scoreboard players add $tc.gold.success TC_temp_tests 1

scoreboard players set @e[tag=TC_temp_tests_smelting] TC_lGold 0

# schedule next
schedule function tinkererscraft:packages/tests/smelting/gold/_finish 2t


#> End of file
#> -----------
