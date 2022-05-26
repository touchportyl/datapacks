#> -----------------------------------------------
#> Tinkerer's Craft Datapack
#> This code is protected by the GNU GPLv3 License
#> © 2020 Portyl Studios
#> https://portylstudios.com
#> -----------------------------------------------


#> test


# config: deepslate ore doubler
execute if score $tc.smelting.double.deepslate TP_config matches 0 run scoreboard players set $tc.gold.output TC_temp_tests 1
execute if score $tc.smelting.double.deepslate TP_config matches 1 run scoreboard players set $tc.gold.output TC_temp_tests 2
execute if score $tc.doubler.deepslate.alert TC_temp_tests matches 0 run tellraw @a [{"text":"\n> Deepslate ore is set to produce ","color":"gray"},{"score":{"name":"$tc.gold.output","objective":"TC_temp_tests"}},{"text":" liquid metal in the config file."}]
execute if score $tc.doubler.deepslate.alert TC_temp_tests matches 0 run scoreboard players set $tc.doubler.deepslate.alert TC_temp_tests 1


execute unless score @e[tag=TC_temp_tests_smelting,sort=nearest,limit=1] TC_lGold = $tc.gold.output TC_temp_tests run tellraw @a [{"text":""},{"text":"\n> Bug detected! ","color":"red"},{"text":"Smelting deepslate gold ore should produce "},{"score":{"name":"$tc.gold.output","objective":"TC_temp_tests"}},{"text":" liquid gold but it produces "},{"score":{"name":"@e[tag=TC_temp_tests_smelting,sort=nearest,limit=1]","objective":"TC_lGold"}},{"text":" instead."}]

execute if score @e[tag=TC_temp_tests_smelting,sort=nearest,limit=1] TC_lGold = $tc.gold.output TC_temp_tests run scoreboard players add $tc.gold.success TC_temp_tests 1

scoreboard players set $tc.gold.output TC_temp_tests 0
scoreboard players set @e[tag=TC_temp_tests_smelting] TC_lGold 0

# schedule next
schedule function tinkererscraft:packages/tests/smelting/gold/netherore 2t


#> End of file
#> -----------
