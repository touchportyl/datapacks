#> -----------------------------------------------
#> Tinkerer's Craft Datapack
#> This code is protected by the GNU GPLv3 License
#> © 2020 Portyl Studios
#> https://portylstudios.com
#> -----------------------------------------------


#> test


# config: regular ore doubler
execute if score $tc.smelting.double.ore TP_config matches 0 run scoreboard players set $tc.copper.output TC_temp_tests 1
execute if score $tc.smelting.double.ore TP_config matches 1 run scoreboard players set $tc.copper.output TC_temp_tests 2
execute if score $tc.temp.doubler.ore.alert TC_temp_tests matches 0 run tellraw @a [{"text":"\n> Regular ore is set to produce ","color":"gray"},{"score":{"name":"$tc.copper.output","objective":"TC_temp_tests"}},{"text":" liquid metal in the config file."}]
execute if score $tc.temp.doubler.ore.alert TC_temp_tests matches 0 run scoreboard players set $tc.temp.doubler.ore.alert TC_temp_tests 1


execute unless score @e[tag=TC_temp_tests_smelting,sort=nearest,limit=1] TC_lCopper = $tc.copper.output TC_temp_tests run tellraw @a [{"text":""},{"text":"\n> Bug detected! ","color":"red"},{"text":"Smelting copper ore should produce "},{"score":{"name":"$tc.copper.output","objective":"TC_temp_tests"}},{"text":" liquid copper but it produces "},{"score":{"name":"@e[tag=TC_temp_tests_smelting,sort=nearest,limit=1]","objective":"TC_lCopper"}},{"text":" instead."}]

execute if score @e[tag=TC_temp_tests_smelting,sort=nearest,limit=1] TC_lCopper = $tc.copper.output TC_temp_tests run scoreboard players add $tc.copper.success TC_temp_tests 1

scoreboard players set $tc.copper.output TC_temp_tests 0
scoreboard players set @e[tag=TC_temp_tests_smelting] TC_lCopper 0

# schedule next
schedule function tinkererscraft:packages/tests/smelting/copper/deepslateore 1s


#> End of file
#> -----------
