#> -----------------------------------------------
#> Vanilla Essentials Datapack
#> This code is protected by the GNU GPLv3 License
#> © 2020 Portyl Studios
#> https://portylstudios.com
#> -----------------------------------------------


#> install
# this code installs all the required components for vanillaessentials
#
# how to read $ve.api hashes:
# 210 = v2.1 (disabled)
# 351 = v3.5 (enabled)


# set api version
execute unless score $ve.api TP_version matches 100.. run scoreboard players set $ve.api TP_version 100

# install msg
tellraw @a [{"text":""},{"text":" +","color":"green"},{"text":" [Vanilla Essentials] ","color":"aqua","hoverEvent":{"action":"show_text","value":"The Essentials of Vanilla."}},{"text":"v1.0.0"},{"text":" installed successfully","color":"gray"}]


# core variables
scoreboard objectives add TP_Config dummy [{"text":"Global Config","color":"white"}]
scoreboard objectives add TP_Ticks dummy [{"text":"Global Time - Ticks","color":"white"}]
scoreboard objectives add TP_Seconds dummy [{"text":"Global Time - Seconds","color":"white"}]
scoreboard objectives add TP_Minutes dummy [{"text":"Global Time - Minutes","color":"white"}]
scoreboard objectives add TP_Hours dummy [{"text":"Global Time - Hours","color":"white"}]
scoreboard objectives add TP_Days dummy [{"text":"Global Time - Days","color":"white"}]
scoreboard objectives add TP_Months dummy [{"text":"Global Time - Months","color":"white"}]

# hooks
scoreboard objectives add uninstall trigger [{"text":"Global Trigger - Uninstall","color":"white"}]

# triggers
scoreboard objectives add stats trigger [{"text":"Global Trigger - Stats","color":"white"}]
scoreboard objectives add playtime trigger [{"text":"Global Trigger - PlayTime","color":"white"}]
scoreboard objectives add uptime trigger [{"text":"Global Trigger - UpTime","color":"white"}]
scoreboard objectives add pathspeed trigger [{"text":"Global Trigger - PathSpeed","color":"white"}]

# health
scoreboard objectives add VE_Health health [{"text":"❤","color":"red"}]
scoreboard objectives setdisplay list VE_Health

# death count
scoreboard objectives add VE_DeathCount deathCount [{"text":"☠","color":"white"}]
scoreboard objectives setdisplay belowName VE_DeathCount

# others
scoreboard objectives add VE_PathSpeed dummy [{"text":"PathSpeed","color":"gray"}]
#scoreboard objectives add VE_Air air [{"text":"Air","color":"gray"}]
#scoreboard objectives add VE_Food food [{"text":"Food","color":"gray"}]
#scoreboard objectives add VE_Armor armor [{"text":"Armor","color":"gray"}]
#scoreboard objectives add VE_Exp xp [{"text":"Exp","color":"gray"}]
#scoreboard objectives add VE_Level level [{"text":"Level","color":"gray"}]

# sleep skip
#scoreboard objectives add VE_SleepInBed minecraft.custom:minecraft.sleep_in_bed [{"text":"SleepInBed","color":"gray"}]
gamerule playersSleepingPercentage 50

# stats
scoreboard objectives add VE_Stats dummy [{"text":" Vanilla Essentials ","color":"light_purple","bold":"true"}]
team add VE_Stats
team modify VE_Stats color white
scoreboard objectives setdisplay sidebar.team.white VE_Stats
scoreboard players set Players VE_Stats 0


#> End of file
#> -----------
