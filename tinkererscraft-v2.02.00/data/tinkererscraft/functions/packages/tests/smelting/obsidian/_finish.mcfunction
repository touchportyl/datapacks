#> -----------------------------------------------
#> Tinkerer's Craft Datapack
#> This code is protected by the GNU GPLv3 License
#> © 2020 Portyl Studios
#> https://portylstudios.com
#> -----------------------------------------------


#> finish
# push obsidian test results


scoreboard players operation $tc.total TC_temp_tests += $tc.obsidian.total TC_temp_tests
scoreboard players operation $tc.success TC_temp_tests += $tc.obsidian.success TC_temp_tests
scoreboard players operation $tc.skipped TC_temp_tests += $tc.obsidian.skipped TC_temp_tests

tellraw @a [{"text":"\n> ","color":"green"},{"score":{"name":"$tc.obsidian.success","objective":"TC_temp_tests"}},{"text":" out of "},{"score":{"name":"$tc.obsidian.total","objective":"TC_temp_tests"}},{"text":" successful tests for obsidian"}]

execute if score $tc.obsidian.skipped TC_temp_tests matches 1 run tellraw @a [{"text":"> Skipped "},{"score":{"name":"$tc.obsidian.skipped","objective":"TC_temp_tests"}},{"text":" test"}]
execute if score $tc.obsidian.skipped TC_temp_tests matches 2.. run tellraw @a [{"text":"> Skipped "},{"score":{"name":"$tc.obsidian.skipped","objective":"TC_temp_tests"}},{"text":" tests"}]

# schedule next
schedule function tinkererscraft:packages/tests/smelting/finish 1s


#> End of file
#> -----------
