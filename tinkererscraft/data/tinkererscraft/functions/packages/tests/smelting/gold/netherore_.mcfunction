#> -----------------------------------------------
#> Tinkerer's Craft Datapack
#> This code is protected by the GNU GPLv3 License
#> © 2020 Portyl Studios
#> https://portylstudios.com
#> -----------------------------------------------


#> test


# config bypass: deepslate gold ore smelting
execute if score $tc.smelting.gold.nether TP_config matches 0 run tellraw @a [{"text":"","color":"gray"},{"text":"\n> Smelting nether gold ore is disabled in the config file. Skipping test..."}]

execute if score $tc.smelting.gold.nether TP_config matches 0 run scoreboard players add $tc.gold.skipped TC_temp_tests 1
execute if score $tc.smelting.gold.nether TP_config matches 0 run scoreboard players add $tc.gold.success TC_temp_tests 1


# config: nether ore doubler
execute if score $tc.smelting.double.nethergold TP_config matches 0 run scoreboard players set $tc.gold.output TC_temp_tests 1
execute if score $tc.smelting.double.nethergold TP_config matches 1 run scoreboard players set $tc.gold.output TC_temp_tests 2
execute unless score $tc.gold.skipped TC_temp_tests matches 1.. if score $tc.temp.doubler.nethergold.alert TC_temp_tests matches 0 run tellraw @a [{"text":"\n> Nether gold ore is set to produce ","color":"gray"},{"score":{"name":"$tc.gold.output","objective":"TC_temp_tests"}},{"text":" liquid metal in the config file."}]
execute unless score $tc.gold.skipped TC_temp_tests matches 1.. if score $tc.temp.doubler.nethergold.alert TC_temp_tests matches 0 run scoreboard players set $tc.temp.doubler.nethergold.alert TC_temp_tests 1


execute unless score @e[tag=TC_temp_tests_smelting,sort=nearest,limit=1] TC_lGold = $tc.gold.output TC_temp_tests run tellraw @a [{"text":""},{"text":"\n> Bug detected! ","color":"red"},{"text":"Smelting nether gold ore should produce "},{"score":{"name":"$tc.gold.output","objective":"TC_temp_tests"}},{"text":" liquid gold but it produces "},{"score":{"name":"@e[tag=TC_temp_tests_smelting,sort=nearest,limit=1]","objective":"TC_lGold"}},{"text":" instead."}]

execute if score @e[tag=TC_temp_tests_smelting,sort=nearest,limit=1] TC_lGold = $tc.gold.output TC_temp_tests run scoreboard players add $tc.gold.success TC_temp_tests 1

scoreboard players set $tc.gold.output TC_temp_tests 0
scoreboard players set @e[tag=TC_temp_tests_smelting] TC_lGold 0

# schedule next
schedule function tinkererscraft:packages/tests/smelting/gold/ingot 1s


#> End of file
#> -----------
