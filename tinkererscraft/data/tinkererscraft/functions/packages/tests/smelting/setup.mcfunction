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

execute at @e[tag=TC_temp_tests_smelting] align xyz run setblock ~0.5 ~-1 ~0.5 gilded_blackstone replace

# set up config alerts
scoreboard players set $tc.temp.doubler.ore.alert TC_temp_tests 0
scoreboard players set $tc.temp.doubler.deepslate.alert TC_temp_tests 0
scoreboard players set $tc.temp.doubler.nethergold.alert TC_temp_tests 0

# progress notification
tellraw @a [{"text":""},{"text":"\n> Setup complete. Running tests...","color":"gray"}]


# start tests
schedule function tinkererscraft:packages/tests/smelting/copper/ore 1s


#> End of file
#> -----------
