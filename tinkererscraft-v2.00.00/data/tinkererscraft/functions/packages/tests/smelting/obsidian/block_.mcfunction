#> -----------------------------------------------
#> Tinkerer's Craft Datapack
#> This code is protected by the GNU GPLv3 License
#> © 2020 Portyl Studios
#> https://portylstudios.com
#> -----------------------------------------------


#> test


execute unless score @e[tag=TC_temp_tests_smelting,sort=nearest,limit=1] TC_lObsidian matches 1 run tellraw @a [{"text":""},{"text":"\n> Bug detected! ","color":"red"},{"text":"Smelting obsidian block should produce 1 liquid obsidian but it produces "},{"score":{"name":"@e[tag=TC_temp_tests_smelting,sort=nearest,limit=1]","objective":"TC_lObsidian"}},{"text":" instead."}]

execute if score @e[tag=TC_temp_tests_smelting,sort=nearest,limit=1] TC_lObsidian matches 1 run scoreboard players add $tc.obsidian.success TC_temp_tests 1

scoreboard players set @e[tag=TC_temp_tests_smelting] TC_lObsidian 0

# schedule next
schedule function tinkererscraft:packages/tests/smelting/obsidian/_finish 2t


#> End of file
#> -----------
