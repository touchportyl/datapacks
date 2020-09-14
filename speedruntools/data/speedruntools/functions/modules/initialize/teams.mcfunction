#> -----------------------------------------------
#> Speedrun Tools Datapack
#> This code is protected by the GNU GPLv3 License
#> © 2020 Portyl Studios
#> https://portylstudios.com
#> -----------------------------------------------


#> teams
# this creates and assigns teams to players in the speedrun


team remove blue
scoreboard objectives remove ST_BlueSplit
bossbar remove speedruntools:stronghold_blue
team add blue [{"text":"Team Blue"}]
team modify blue collisionRule always
team modify blue color blue
team modify blue deathMessageVisibility always
team modify blue friendlyFire false
team modify blue nametagVisibility always
scoreboard objectives add ST_BlueSplit dummy [{"text":"Speedrun Splits","color":"blue"}]
scoreboard objectives setdisplay sidebar.team.blue ST_BlueSplit
bossbar add speedruntools:stronghold_blue [{"text":"Team Blue"}]
bossbar set speedruntools:stronghold_blue color blue
bossbar set speedruntools:stronghold_blue max 6
bossbar set speedruntools:stronghold_blue style notched_6
bossbar set speedruntools:stronghold_blue value 1
bossbar set speedruntools:stronghold_blue visible true

team remove red
scoreboard objectives remove ST_RedSplit
bossbar remove speedruntools:stronghold_red
team add red [{"text":"Team Red"}]
team modify red collisionRule always
team modify red color red
team modify red deathMessageVisibility always
team modify red friendlyFire false
team modify red nametagVisibility always
scoreboard objectives add ST_RedSplit dummy [{"text":"Speedrun Splits","color":"red"}]
scoreboard objectives setdisplay sidebar.team.red ST_RedSplit
bossbar add speedruntools:stronghold_red [{"text":"Team Red"}]
bossbar set speedruntools:stronghold_red color red
bossbar set speedruntools:stronghold_red max 6
bossbar set speedruntools:stronghold_red style notched_6
bossbar set speedruntools:stronghold_red value 2
bossbar set speedruntools:stronghold_red visible true

team remove green
scoreboard objectives remove ST_GreenSplit
bossbar remove speedruntools:stronghold_green
team add green [{"text":"Team Green"}]
team modify green collisionRule always
team modify green color green
team modify green deathMessageVisibility always
team modify green friendlyFire false
team modify green nametagVisibility always
scoreboard objectives add ST_GreenSplit dummy [{"text":"Speedrun Splits","color":"green"}]
scoreboard objectives setdisplay sidebar.team.green ST_GreenSplit
bossbar add speedruntools:stronghold_green [{"text":"Team Green"}]
bossbar set speedruntools:stronghold_green color green
bossbar set speedruntools:stronghold_green max 6
bossbar set speedruntools:stronghold_green style notched_6
bossbar set speedruntools:stronghold_green value 3
bossbar set speedruntools:stronghold_green visible true

team remove yellow
scoreboard objectives remove ST_YellowSplit
bossbar remove speedruntools:stronghold_yellow
team add yellow [{"text":"Team Yellow"}]
team modify yellow collisionRule always
team modify yellow color yellow
team modify yellow deathMessageVisibility always
team modify yellow friendlyFire false
team modify yellow nametagVisibility always
scoreboard objectives add ST_YellowSplit dummy [{"text":"Speedrun Splits","color":"yellow"}]
scoreboard objectives setdisplay sidebar.team.yellow ST_YellowSplit
bossbar add speedruntools:stronghold_yellow [{"text":"Team Yellow"}]
bossbar set speedruntools:stronghold_yellow color yellow
bossbar set speedruntools:stronghold_yellow max 6
bossbar set speedruntools:stronghold_yellow style notched_6
bossbar set speedruntools:stronghold_yellow value 4
bossbar set speedruntools:stronghold_yellow visible true

team remove purple
scoreboard objectives remove ST_PurpleSplit
bossbar remove speedruntools:stronghold_purple
team add purple [{"text":"Team Purple"}]
team modify purple collisionRule always
team modify purple color dark_purple
team modify purple deathMessageVisibility always
team modify purple friendlyFire false
team modify purple nametagVisibility always
scoreboard objectives add ST_PurpleSplit dummy [{"text":"Speedrun Splits","color":"dark_purple"}]
scoreboard objectives setdisplay sidebar.team.dark_purple ST_PurpleSplit
bossbar add speedruntools:stronghold_purple [{"text":"Team Purple"}]
bossbar set speedruntools:stronghold_purple color purple
bossbar set speedruntools:stronghold_purple max 6
bossbar set speedruntools:stronghold_purple style notched_6
bossbar set speedruntools:stronghold_purple value 5
bossbar set speedruntools:stronghold_purple visible true

team remove pink
scoreboard objectives remove ST_PinkSplit
bossbar remove speedruntools:stronghold_pink
team add pink [{"text":"Team Pink"}]
team modify pink collisionRule always
team modify pink color light_purple
team modify pink deathMessageVisibility always
team modify pink friendlyFire false
team modify pink nametagVisibility always
scoreboard objectives add ST_PinkSplit dummy [{"text":"Speedrun Splits","color":"light_purple"}]
scoreboard objectives setdisplay sidebar.team.light_purple ST_PinkSplit
bossbar add speedruntools:stronghold_pink [{"text":"Team Pink"}]
bossbar set speedruntools:stronghold_pink color pink
bossbar set speedruntools:stronghold_pink max 6
bossbar set speedruntools:stronghold_pink style notched_6
bossbar set speedruntools:stronghold_pink value 6
bossbar set speedruntools:stronghold_pink visible true

#> splits
function speedruntools:modules/initialize/splits

# trigger
tag @a add ST_tJoin

# team join menu for everyone
tellraw @a [{"text":""},{"text":"\n\n\n ALERT","color":"dark_red","bold":"true","hoverEvent":{"action":"show_text","value":"Alert generated by Speedrun Tools"}},{"text":"\n The game will be starting soon.\n Pick your teams now!\n\n   ","color":"red","hoverEvent":{"action":"show_text","value":"Alert generated by Speedrun Tools"}},{"text":"Team Blue","color":"blue","clickEvent":{"action":"run_command","value":"/trigger join set 1"}},{"text":"         "},{"text":"Team Red","color":"red","clickEvent":{"action":"run_command","value":"/trigger join set 2"}},{"text":"           "},{"text":"Team Green","color":"green","clickEvent":{"action":"run_command","value":"/trigger join set 3"}},{"text":"\n\n   "},{"text":"Team Yellow","color":"yellow","clickEvent":{"action":"run_command","value":"/trigger join set 4"}},{"text":"       "},{"text":"Team Purple","color":"dark_purple","clickEvent":{"action":"run_command","value":"/trigger join set 5"}},{"text":"       "},{"text":"Team Pink","color":"light_purple","clickEvent":{"action":"run_command","value":"/trigger join set 6"}},{"text":"\n\n        "},{"text":"Spectator (removes you from a team)","color":"gray","italic":"true","clickEvent":{"action":"run_command","value":"/trigger join set 7"}},{"text":"\n"}]

# start button for the host
tellraw @s [{"text":""},{"text":"                       "},{"text":"[Start Game]","color":"red","clickEvent":{"action":"run_command","value":"/trigger start set 2"}},{"text":"\n"}]


#> End of file
#> -----------
