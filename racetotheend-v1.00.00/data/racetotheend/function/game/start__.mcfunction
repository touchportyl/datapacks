# this starts the game for all players

#> player setup

# this starts the game for each player
scoreboard players set @a RE_SplitCount 1

# lock player and wait for game start
execute as @a at @s run function racetotheend:playerlock/lock

#> start game

function racetotheend:countdown/game/start {t:10}
schedule function racetotheend:game/start___ 10s