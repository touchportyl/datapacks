#> -----------------------------------------------
#> Speedrun Tools Datapack
#> This code is protected by the GNU GPLv3 License
#> © 2020 Portyl Studios
#> https://portylstudios.com
#> -----------------------------------------------


#> split
# this places the player in split 5


tag @s remove ST_Split1
tag @s remove ST_Split2
tag @s remove ST_Split3
tag @s remove ST_Split4
tag @s remove ST_Split5
tag @s add ST_Split6

# create marker
execute as @s[team=blue] at @s run summon minecraft:area_effect_cloud ~ ~ ~ {Tags:["SpeedrunTools","ST_Marker","ST_Blue_Split_6"],Rotation:[0f,0f],Age:-2147483648,Duration:-1,WaitTime:-2147483648}
execute as @s[team=red] at @s run summon minecraft:area_effect_cloud ~ ~ ~ {Tags:["SpeedrunTools","ST_Marker","ST_Red_Split_6"],Rotation:[0f,0f],Age:-2147483648,Duration:-1,WaitTime:-2147483648}
execute as @s[team=green] at @s run summon minecraft:area_effect_cloud ~ ~ ~ {Tags:["SpeedrunTools","ST_Marker","ST_Green_Split_6"],Rotation:[0f,0f],Age:-2147483648,Duration:-1,WaitTime:-2147483648}
execute as @s[team=yellow] at @s run summon minecraft:area_effect_cloud ~ ~ ~ {Tags:["SpeedrunTools","ST_Marker","ST_Yellow_Split_6"],Rotation:[0f,0f],Age:-2147483648,Duration:-1,WaitTime:-2147483648}
execute as @s[team=purple] at @s run summon minecraft:area_effect_cloud ~ ~ ~ {Tags:["SpeedrunTools","ST_Marker","ST_Purple_Split_6"],Rotation:[0f,0f],Age:-2147483648,Duration:-1,WaitTime:-2147483648}
execute as @s[team=pink] at @s run summon minecraft:area_effect_cloud ~ ~ ~ {Tags:["SpeedrunTools","ST_Marker","ST_Pink_Split_6"],Rotation:[0f,0f],Age:-2147483648,Duration:-1,WaitTime:-2147483648}


#> End of file
#> -----------
