#> -----------------------------------------------
#> Speedrun Tools Datapack
#> This code is protected by the GNU GPLv3 License
#> © 2020 Portyl Studios
#> https://portylstudios.com
#> -----------------------------------------------


# triggers
execute as @a[gamemode=adventure] run function speedruntools:modules/trigger/start
execute as @a[tag=ST_tJoin] run function speedruntools:modules/trigger/join
execute as @a[tag=ST_tTeleport] run function speedruntools:modules/trigger/teleport

# adventure mode
execute unless entity @a[tag=ST_Speedrunner] run gamemode adventure @a
tag @a[gamemode=adventure] add ST_Godmode
tag @a[gamemode=!adventure] remove ST_Godmode

# count players
execute unless entity @a[tag=ST_Speedrunner] store result score $stat.player_count ST_Statistics run execute if entity @a

# speedrun timer
execute if entity @a[tag=ST_Speedrunner] run scoreboard players add $stat.timer ST_Statistics 1

# player states
execute as @a[tag=ST_Godmode] run function speedruntools:modules/effects/godmode
execute as @a[tag=ST_Lock] run function speedruntools:modules/effects/lock

execute as @a[tag=!ST_Dev,tag=!ST_Survival,tag=!ST_Spectator] run gamemode adventure @s
execute as @a[tag=!ST_Dev,tag=ST_Survival] run gamemode survival @s
execute as @a[tag=!ST_Dev,tag=ST_Spectator] run gamemode spectator @s

# split counter
execute as @a[tag=ST_Split1] run function speedruntools:modules/game/timer/split_1
execute as @a[tag=ST_Split2] run function speedruntools:modules/game/timer/split_2
execute as @a[tag=ST_Split3] run function speedruntools:modules/game/timer/split_3
execute as @a[tag=ST_Split4] run function speedruntools:modules/game/timer/split_4
execute as @a[tag=ST_Split5] run function speedruntools:modules/game/timer/split_5
execute as @a[tag=ST_Split6] run function speedruntools:modules/game/timer/split_6











# time calculator
#
# 1h = 60m = 360s = 7200t
#
#execute store result score Seconds ST_BlueSplit run scoreboard players operation @a[team=blue] ST_BlueSplit /= $20 ST_TimeArray
#execute store result score Minutes ST_BlueSplit
#execute store result score Hours ST_BlueSplit



#> distance to stronghold bossbar
#execute store result score @s xVillage run locate village


#> End of file
#> -----------
