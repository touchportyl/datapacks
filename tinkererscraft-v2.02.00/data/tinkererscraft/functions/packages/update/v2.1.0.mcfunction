#> -----------------------------------------------
#> Tinkerer's Craft Datapack
#> This code is protected by the GNU GPLv3 License
#> © 2020 Portyl Studios
#> https://portylstudios.com
#> -----------------------------------------------


#> v2.1.0
# this code updates v2.0 to v2.1


# update version
execute if score $tc.version.override TP_config matches 0 run scoreboard players set $tc.version TP_version 20100

# update
# ------

# update old smelteries to support copper
execute as @e[tag=TC_smeltery] run scoreboard players set @s TC_lCopper 0


# cleanup
# -------

# remove objectives
scoreboard objectives remove TC_rand_6
scoreboard objectives remove TC_rand_20

# remove tags
tag @e[tag=TC_setzero] remove TC_setzero


#> End of file
#> -----------
