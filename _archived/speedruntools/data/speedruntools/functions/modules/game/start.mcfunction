#> -----------------------------------------------
#> Speedrun Tools Datapack
#> This code is protected by the GNU GPLv3 License
#> © 2020 Portyl Studios
#> https://portylstudios.com
#> -----------------------------------------------


#> start
# this starts the speedrun proper


function speedruntools:modules/effects/ui/click


# disable trigger
tag @a remove ST_tJoin
scoreboard players reset @s start
scoreboard players reset @s join

# reset world
difficulty normal
weather clear 24000
gamerule doDaylightCycle true

# tag speedrunners
tag @a[team=blue] add ST_Speedrunner
tag @a[team=red] add ST_Speedrunner
tag @a[team=green] add ST_Speedrunner
tag @a[team=yellow] add ST_Speedrunner
tag @a[team=purple] add ST_Speedrunner
tag @a[team=pink] add ST_Speedrunner

# tag spectators
tag @a[tag=!ST_Speedrunner] add ST_Spectator

# spreadplayers
execute as @e[tag=ST_WorldCenter] at @s align xyz positioned ~0.5 ~ ~0.5 run spreadplayers ~ ~ 80 300 true @a[tag=ST_Speedrunner]

# set spawn
execute as @e[tag=ST_WorldCenter] at @s run setworldspawn ~ ~ ~
execute as @a[tag=ST_Speedrunner] at @s run spawnpoint @s

# reset players
tag @a add ST_Survival
tag @a remove ST_Godmode
tag @a remove ST_Lock
tag @a remove ST_Spectator
advancement revoke @a everything
clear @a
xp set @a 0 levels
effect clear @a
gamerule doImmediateRespawn true
kill @a[tag=ST_Speedrunner]
gamerule doImmediateRespawn false

# root advancement
advancement grant @a only speedruntools:root

# create marker
execute as @a[team=blue] at @s run summon minecraft:area_effect_cloud ~ ~ ~ {Tags:["SpeedrunTools","ST_Marker","ST_Blue_Split_1"],Rotation:[0f,0f],Age:-2147483648,Duration:-1,WaitTime:-2147483648}
execute as @a[team=red] at @s run summon minecraft:area_effect_cloud ~ ~ ~ {Tags:["SpeedrunTools","ST_Marker","ST_Red_Split_1"],Rotation:[0f,0f],Age:-2147483648,Duration:-1,WaitTime:-2147483648}
execute as @a[team=green] at @s run summon minecraft:area_effect_cloud ~ ~ ~ {Tags:["SpeedrunTools","ST_Marker","ST_Green_Split_1"],Rotation:[0f,0f],Age:-2147483648,Duration:-1,WaitTime:-2147483648}
execute as @a[team=yellow] at @s run summon minecraft:area_effect_cloud ~ ~ ~ {Tags:["SpeedrunTools","ST_Marker","ST_Yellow_Split_1"],Rotation:[0f,0f],Age:-2147483648,Duration:-1,WaitTime:-2147483648}
execute as @a[team=purple] at @s run summon minecraft:area_effect_cloud ~ ~ ~ {Tags:["SpeedrunTools","ST_Marker","ST_Purple_Split_1"],Rotation:[0f,0f],Age:-2147483648,Duration:-1,WaitTime:-2147483648}
execute as @a[team=pink] at @s run summon minecraft:area_effect_cloud ~ ~ ~ {Tags:["SpeedrunTools","ST_Marker","ST_Pink_Split_1"],Rotation:[0f,0f],Age:-2147483648,Duration:-1,WaitTime:-2147483648}

# reset timer
scoreboard players set $stat.timer ST_Statistics 0

# start message
tellraw @a [{"text":""},{"text":"\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n"},{"text":"   The speedrun has started with "},{"score":{"name":"$stat.player_count","objective":"ST_Statistics"},"color":"red"},{"text":" players!"},{"text":"\n\n"}]

# start run
tag @a[tag=ST_Speedrunner] add ST_Split1


#> End of file
#> -----------
