#> -----------------------------------------------
#> Tinkerer's Craft Datapack
#> This code is protected by the GNU GPLv3 License
#> © 2020 Portyl Studios
#> https://portylstudios.com
#> -----------------------------------------------


#> finish
# show test end


# calculate stats
scoreboard players operation $tc.bugs TC_temp_tests = $tc.total TC_temp_tests
scoreboard players operation $tc.bugs TC_temp_tests -= $tc.success TC_temp_tests

tellraw @a [{"text":"\n\n> Casting test results:","color":"green"}]

tellraw @a [{"text":"> Completed "},{"score":{"name":"$tc.success","objective":"TC_temp_tests"}},{"text":" out of "},{"score":{"name":"$tc.total","objective":"TC_temp_tests"}},{"text":" tests"}]

execute unless score $tc.skipped TC_temp_tests matches 1.. run tellraw @a [{"text":"> 0 tests skipped","color":"gray"}]
execute if score $tc.skipped TC_temp_tests matches 1 run tellraw @a [{"text":"> Skipped "},{"score":{"name":"$tc.skipped","objective":"TC_temp_tests"}},{"text":" test"}]
execute if score $tc.skipped TC_temp_tests matches 2.. run tellraw @a [{"text":"> Skipped "},{"score":{"name":"$tc.skipped","objective":"TC_temp_tests"}},{"text":" tests"}]

execute unless score $tc.bugs TC_temp_tests matches 1.. run tellraw @a [{"text":"> ","color":"gray"},{"score":{"name":"$tc.bugs","objective":"TC_temp_tests"}},{"text":" bugs found\n\n"}]
execute if score $tc.bugs TC_temp_tests matches 1 run tellraw @a [{"text":"> Discovered ","color":"red"},{"score":{"name":"$tc.bugs","objective":"TC_temp_tests"}},{"text":" bug\n\n"}]
execute if score $tc.bugs TC_temp_tests matches 2.. run tellraw @a [{"text":"> Discovered ","color":"red"},{"score":{"name":"$tc.bugs","objective":"TC_temp_tests"}},{"text":" bugs\n\n"}]


execute at @e[tag=TC_temp_tests_smelting,sort=nearest,limit=1] as @e[type=item,distance=..3,sort=nearest,limit=1] if entity @s[nbt={Item:{tag:{TC_Casted:1b}}}] run kill @s
kill @e[tag=TC_temp_tests_item_frame]
execute at @e[tag=TC_temp_tests_smelting] align xyz run fill ~0 ~-1 ~0 ~0 ~ ~0 air replace
execute at @e[tag=TC_temp_tests_smelting] align xyz run setblock ~0 ~1 ~1 air replace
# remove lever and anvil/cauldron first
execute at @e[tag=TC_temp_tests_smelting] align xyz run fill ~0 ~ ~2 ~0 ~-1 ~2 air replace
execute at @e[tag=TC_temp_tests_smelting] align xyz run setblock ~0 ~ ~1 air replace
execute at @e[tag=TC_temp_tests_smelting] align xyz run setblock ~0 ~-2 ~2 air replace
kill @e[tag=TC_temp_tests_smelting]
tag @e remove TC_temp_tests_player
scoreboard objectives remove TC_temp_tests

reload


#> End of file
#> -----------
