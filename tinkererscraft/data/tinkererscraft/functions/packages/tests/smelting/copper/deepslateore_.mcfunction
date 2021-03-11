#> -----------------------------------------------
#> Tinkerer's Craft Datapack
#> This code is protected by the GNU GPLv3 License
#> © 2020 Portyl Studios
#> https://portylstudios.com
#> -----------------------------------------------


#> test


# config bypass: deepslate copper ore smelting
execute if score $tc.smelting.copper.deepslate TP_config matches 0 run tellraw @a [{"text":"","color":"gray"},{"text":"\n> Smelting deepslate copper ore is disabled in the config file. Skipping test..."}]

execute if score $tc.smelting.copper.deepslate TP_config matches 0 run scoreboard players add $tc.copper.skipped TC_temp_tests 1
execute if score $tc.smelting.copper.deepslate TP_config matches 0 run scoreboard players add $tc.copper.success TC_temp_tests 1


# config: deepslate ore doubler
execute if score $tc.smelting.double.deepslate TP_config matches 0 run scoreboard players set $tc.copper.output TC_temp_tests 1
execute if score $tc.smelting.double.deepslate TP_config matches 1 run scoreboard players set $tc.copper.output TC_temp_tests 2
execute unless score $tc.copper.skipped TC_temp_tests matches 1.. if score $tc.temp.doubler.deepslate.alert TC_temp_tests matches 0 run tellraw @a [{"text":"\n> Deepslate ore is set to produce ","color":"gray"},{"score":{"name":"$tc.copper.output","objective":"TC_temp_tests"}},{"text":" liquid metal in the config file."}]
execute unless score $tc.copper.skipped TC_temp_tests matches 1.. if score $tc.temp.doubler.deepslate.alert TC_temp_tests matches 0 run scoreboard players set $tc.temp.doubler.deepslate.alert TC_temp_tests 1


execute if score $tc.copper.skipped TC_temp_tests matches 0 unless score @e[tag=TC_temp_tests_smelting,sort=nearest,limit=1] TC_lCopper = $tc.copper.output TC_temp_tests run tellraw @a [{"text":""},{"text":"\n> Bug detected! ","color":"red"},{"text":"Smelting deepslate copper ore should produce "},{"score":{"name":"$tc.copper.output","objective":"TC_temp_tests"}},{"text":" liquid copper but it produces "},{"score":{"name":"@e[tag=TC_temp_tests_smelting,sort=nearest,limit=1]","objective":"TC_lCopper"}},{"text":" instead."}]

execute if score $tc.copper.skipped TC_temp_tests matches 0 if score @e[tag=TC_temp_tests_smelting,sort=nearest,limit=1] TC_lCopper = $tc.copper.output TC_temp_tests run scoreboard players add $tc.copper.success TC_temp_tests 1

scoreboard players set $tc.copper.output TC_temp_tests 0
scoreboard players set @e[tag=TC_temp_tests_smelting] TC_lCopper 0

# schedule next
schedule function tinkererscraft:packages/tests/smelting/copper/ingot 1s


#> End of file
#> -----------
