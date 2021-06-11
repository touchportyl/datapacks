#> -----------------------------------------------
#> Tinkerer's Craft Datapack
#> This code is protected by the GNU GPLv3 License
#> © 2020 Portyl Studios
#> https://portylstudios.com
#> -----------------------------------------------


#> setup
# set up the environment to test

# config
scoreboard objectives add TC_temp_tests dummy


# set up smeltery
execute as @a[tag=TC_temp_tests_player] at @s align xyz run summon minecraft:area_effect_cloud ~0.5 255 ~0.5 {Tags:["TinkerersCraft","TC_smeltery","TC_north","TC_outputnull","TC_protect","TC_noeffects","TC_temp_tests_smelting"],Rotation:[0f,0f],Age:-2147483648,Duration:-1,WaitTime:-2147483648}

execute at @e[tag=TC_temp_tests_smelting] align xyz run setblock ~0 ~-1 ~0 gilded_blackstone replace
execute at @e[tag=TC_temp_tests_smelting] align xyz run setblock ~0 ~ ~1 chiseled_polished_blackstone replace
execute at @e[tag=TC_temp_tests_smelting] align xyz run setblock ~0 ~ ~2 lever[facing=south] replace
execute at @e[tag=TC_temp_tests_smelting] align xyz run setblock ~0 ~-2 ~2 glass replace
execute at @e[tag=TC_temp_tests_smelting] align xyz run setblock ~0 ~-1 ~2 anvil replace
execute at @e[tag=TC_temp_tests_smelting] align xyz run summon minecraft:item_frame ~0.5 ~ ~2.5 {Facing:7b,Tags:["TC_temp_tests_item_frame"]}

# set up config alerts
scoreboard players set $tc.check.item TC_temp_tests 0
scoreboard players set $tc.check.smeltery TC_temp_tests 0
scoreboard players set $tc.check.pour TC_temp_tests 0

# progress notification
tellraw @a [{"text":""},{"text":"\n> Setup complete. Running tests...","color":"gray"}]


# start tests
schedule function tinkererscraft:packages/tests/casting/iron/pickaxe 1s
#schedule function tinkererscraft:packages/tests/casting/finish 5s


#> End of file
#> -----------
