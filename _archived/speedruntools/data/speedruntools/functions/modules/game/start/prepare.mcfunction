#> -----------------------------------------------
#> Speedrun Tools Datapack
#> This code is protected by the GNU GPLv3 License
#> © 2020 Portyl Studios
#> https://portylstudios.com
#> -----------------------------------------------


#> prepare
# this prepares the world and the players for the speedrun


# remove tags
tag @a remove ST_Godmode
tag @a remove ST_Lock
tag @a remove ST_Speedrunner
tag @a remove ST_Split1
tag @a remove ST_Split2
tag @a remove ST_Split3
tag @a remove ST_Split4
tag @a remove ST_Split5
tag @a remove ST_Split6

# kill existing
kill @e[tag=SpeedrunTools]

# create marker
execute as @s at @s run summon minecraft:area_effect_cloud ~ ~ ~ {Tags:["SpeedrunTools","ST_Marker","ST_WorldCenter"],Rotation:[0f,0f],Age:-2147483648,Duration:-1,WaitTime:-2147483648}

# lock world
gamerule doDaylightCycle false
time set 0

# lock players
tag @a add ST_Godmode
tag @a add ST_Lock

#> teams
function speedruntools:modules/initialize/teams


#> End of file
#> -----------
