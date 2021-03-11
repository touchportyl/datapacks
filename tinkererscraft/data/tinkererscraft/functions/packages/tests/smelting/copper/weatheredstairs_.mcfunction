#> -----------------------------------------------
#> Tinkerer's Craft Datapack
#> This code is protected by the GNU GPLv3 License
#> © 2020 Portyl Studios
#> https://portylstudios.com
#> -----------------------------------------------


#> test


execute unless score @e[tag=TC_temp_tests_smelting,sort=nearest,limit=1] TC_lCopper matches 0 run tellraw @a [{"text":""},{"text":"\n> Bug detected! ","color":"red"},{"text":"Smelting weathered cut copper stairs should produce 0 liquid copper but it produces "},{"score":{"name":"@e[tag=TC_temp_tests_smelting,sort=nearest,limit=1]","objective":"TC_lCopper"}},{"text":" instead."}]

execute if score @e[tag=TC_temp_tests_smelting,sort=nearest,limit=1] TC_lCopper matches 0 run scoreboard players add $tc.copper.success TC_temp_tests 1

scoreboard players set @e[tag=TC_temp_tests_smelting] TC_lCopper 0

# schedule next
schedule function tinkererscraft:packages/tests/smelting/copper/oxidizedstairs 1s


#> End of file
#> -----------
