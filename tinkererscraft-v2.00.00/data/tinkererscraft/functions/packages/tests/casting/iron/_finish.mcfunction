#> -----------------------------------------------
#> Tinkerer's Craft Datapack
#> This code is protected by the GNU GPLv3 License
#> © 2020 Portyl Studios
#> https://portylstudios.com
#> -----------------------------------------------


#> finish
# push iron test results


scoreboard players operation $tc.total TC_temp_tests += $tc.iron.total TC_temp_tests
scoreboard players operation $tc.success TC_temp_tests += $tc.iron.success TC_temp_tests
scoreboard players operation $tc.skipped TC_temp_tests += $tc.iron.skipped TC_temp_tests

tellraw @a [{"text":"\n> ","color":"green"},{"score":{"name":"$tc.iron.success","objective":"TC_temp_tests"}},{"text":" out of "},{"score":{"name":"$tc.iron.total","objective":"TC_temp_tests"}},{"text":" successful tests for iron"}]

execute if score $tc.iron.skipped TC_temp_tests matches 1 run tellraw @a [{"text":"> Skipped "},{"score":{"name":"$tc.iron.skipped","objective":"TC_temp_tests"}},{"text":" test"}]
execute if score $tc.iron.skipped TC_temp_tests matches 2.. run tellraw @a [{"text":"> Skipped "},{"score":{"name":"$tc.iron.skipped","objective":"TC_temp_tests"}},{"text":" tests"}]

# schedule next
schedule function tinkererscraft:packages/tests/casting/finish 2t


#> End of file
#> -----------
