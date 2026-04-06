#> -----------------------------------------------
#> Speedrun Tools Datapack
#> This code is protected by the GNU GPLv3 License
#> © 2020 Portyl Studios
#> https://portylstudios.com
#> -----------------------------------------------


#> stop
# this ends the speedrun


# enable teleport triggers
tag @a add ST_tTeleport

# create marker
execute as @a[team=blue] at @s run summon minecraft:area_effect_cloud ~ ~ ~ {Tags:["SpeedrunTools","ST_Marker","ST_Blue_Split_7"],Rotation:[0f,0f],Age:-2147483648,Duration:-1,WaitTime:-2147483648}
execute as @a[team=red] at @s run summon minecraft:area_effect_cloud ~ ~ ~ {Tags:["SpeedrunTools","ST_Marker","ST_Red_Split_7"],Rotation:[0f,0f],Age:-2147483648,Duration:-1,WaitTime:-2147483648}
execute as @a[team=green] at @s run summon minecraft:area_effect_cloud ~ ~ ~ {Tags:["SpeedrunTools","ST_Marker","ST_Green_Split_7"],Rotation:[0f,0f],Age:-2147483648,Duration:-1,WaitTime:-2147483648}
execute as @a[team=yellow] at @s run summon minecraft:area_effect_cloud ~ ~ ~ {Tags:["SpeedrunTools","ST_Marker","ST_Yellow_Split_7"],Rotation:[0f,0f],Age:-2147483648,Duration:-1,WaitTime:-2147483648}
execute as @a[team=purple] at @s run summon minecraft:area_effect_cloud ~ ~ ~ {Tags:["SpeedrunTools","ST_Marker","ST_Purple_Split_7"],Rotation:[0f,0f],Age:-2147483648,Duration:-1,WaitTime:-2147483648}
execute as @a[team=pink] at @s run summon minecraft:area_effect_cloud ~ ~ ~ {Tags:["SpeedrunTools","ST_Marker","ST_Pink_Split_7"],Rotation:[0f,0f],Age:-2147483648,Duration:-1,WaitTime:-2147483648}

# set final time
execute as @a[tag=ST_Split6] run function speedruntools:modules/game/timer/split_6

# remove tag
tag @a remove ST_Speedrunner



#> End of file
#> -----------
