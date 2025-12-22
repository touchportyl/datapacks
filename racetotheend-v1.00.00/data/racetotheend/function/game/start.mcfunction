# this starts the game for all players

execute if score GAME$active RaceToTheEnd matches 1 run function racetotheend:game/stop

# set gamerules
function racetotheend:_packages/gamerules/active

# reset splits
function racetotheend:splits/resetall

# restart timer
function racetotheend:timer/reset

# spreadplayers
execute as @a at @s run spreadplayers 0 0 100 200 false @s

# player setup
execute as @a run function racetotheend:game/startplayer

# set game active
scoreboard players set GAME$active RaceToTheEnd 1

# lock all players
execute as @a run function racetotheend:playerlock/lock

# set game start countdown
function racetotheend:countdown/game/start {t:"10"}

# 