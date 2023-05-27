#> -----------------------------------------------
#> Speedrun Tools Datapack
#> This code is protected by the GNU GPLv3 License
#> © 2020 Portyl Studios
#> https://portylstudios.com
#> -----------------------------------------------


#> uninstall
# this code actually uninstalls Speedrun Tools


# set version
scoreboard players reset $st.version TP_version
scoreboard players reset $st.api TP_version
scoreboard players reset $api.st.empty TP_version

# uninstall msg
tellraw @a [{"text":""},{"text":" -","color":"red"},{"text":" [Speedrun Tools] ","color":"aqua"},{"text":"uninstalled successfully","color":"gray"}]

# remove all persistent entities
kill @e[tag=SpeedrunTools]


# remove persistent tags
tag @a remove ST_Godmode
tag @a remove ST_Lock

tag @a remove ST_Survival
tag @a remove ST_Spectator
tag @a remove ST_Speedrunner

tag @a remove ST_Split1
tag @a remove ST_Split2
tag @a remove ST_Split3
tag @a remove ST_Split4
tag @a remove ST_Split5
tag @a remove ST_Split6

tag @a remove ST_tJoin
tag @a remove ST_tTeleport

tag @s remove ST_Winner

# reset world
gamerule doDaylightCycle true
gamerule sendCommandFeedback true
gamerule doImmediateRespawn false
gamerule spectatorsGenerateChunks true

# core variables
scoreboard objectives remove ST_GameStats

# stat tracker
scoreboard objectives remove ST_Statistics

# triggers
scoreboard objectives remove start
scoreboard objectives remove join
scoreboard objectives remove blue
scoreboard objectives remove red
scoreboard objectives remove green
scoreboard objectives remove yellow
scoreboard objectives remove purple
scoreboard objectives remove pink

# number array
scoreboard objectives remove ST_NumberArray

# time array
scoreboard objectives remove ST_TimeArray

# teams
team remove blue
scoreboard objectives remove ST_BlueSplit
bossbar remove speedruntools:stronghold_blue
team remove red
scoreboard objectives remove ST_RedSplit
bossbar remove speedruntools:stronghold_red
team remove green
scoreboard objectives remove ST_GreenSplit
bossbar remove speedruntools:stronghold_green
team remove yellow
scoreboard objectives remove ST_YellowSplit
bossbar remove speedruntools:stronghold_yellow
team remove purple
scoreboard objectives remove ST_PurpleSplit
bossbar remove speedruntools:stronghold_purple
team remove pink
scoreboard objectives remove ST_PinkSplit
bossbar remove speedruntools:stronghold_pink


# disable pack
datapack disable "file/speedruntools"


#> End of file
#> -----------
