#> -----------------------------------------------
#> Speedrun Tools Datapack
#> This code is protected by the GNU GPLv3 License
#> © 2020 Portyl Studios
#> https://portylstudios.com
#> -----------------------------------------------


#> install
# this code installs all the required components for Speedrun Tools
#
# how to read $st.api hashes:
# 210 = v2.1 (disabled)
# 351 = v3.5 (enabled)


# set api version
execute unless score $st.api TP_version matches 100.. run scoreboard players set $st.api TP_version 100

# install msg
tellraw @a [{"text":""},{"text":" +","color":"green"},{"text":" [Speedrun Tools] ","color":"aqua","hoverEvent":{"action":"show_text","value":"Streamlining the speedrun process."}},{"text":"v1.0.0"},{"text":" installed successfully","color":"gray"}]


# core variables
scoreboard objectives add ST_GameStats dummy [{"text":"GAME OVER!","color":"red"}]

# stat tracker
scoreboard objectives add ST_Statistics dummy [{"text":"Statistics Tracker","color":"aqua"}]
scoreboard players set $stat.timer ST_Statistics 0
scoreboard players set $stat.player_count ST_Statistics 0

# triggers
scoreboard objectives add start trigger [{"text":"Trigger: Start game","color":"aqua"}]
scoreboard objectives add join trigger [{"text":"Trigger: Join team","color":"aqua"}]
scoreboard objectives add blue trigger [{"text":"Trigger: Teleport to blue splits","color":"aqua"}]
scoreboard objectives add red trigger [{"text":"Trigger: Teleport to red splits","color":"aqua"}]
scoreboard objectives add green trigger [{"text":"Trigger: Teleport to green splits","color":"aqua"}]
scoreboard objectives add yellow trigger [{"text":"Trigger: Teleport to yellow splits","color":"aqua"}]
scoreboard objectives add purple trigger [{"text":"Trigger: Teleport to purple splits","color":"aqua"}]
scoreboard objectives add pink trigger [{"text":"Trigger: Teleport to pink splits","color":"aqua"}]

# number array
scoreboard objectives add ST_NumberArray dummy [{"text":"Number Array for Speedrun Tools","color":"aqua"}]
scoreboard players set $20 ST_NumberArray 20

# time array
scoreboard objectives add ST_TimeArray dummy [{"text":"Time Array for Speedrun Tools","color":"aqua"}]
scoreboard players set $20 ST_TimeArray 20
scoreboard players set $60 ST_TimeArray 60


#> End of file
#> -----------
