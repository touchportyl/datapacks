#> game state setup

# set gamerules
function racetotheend:_packages/gamerules/active

# reset advancements
advancement revoke @a everything
advancement grant @a only racetotheend:root

# reset splits
function racetotheend:splits/resetall
scoreboard objectives setdisplay sidebar RE_SplitCount

#> player setup

# team assignment
team join RE_Overworld @a

# spreadplayers
# or not if only one player
function racetotheend:_packages/playercounter/count
execute if score VAR$playercount RaceToTheEnd matches 1 run tp @a ~ ~ ~
execute if score VAR$playercount RaceToTheEnd matches 2.. run spreadplayers ~ ~ 128 512 false @a

# set spawn point
execute as @a at @s run spawnpoint @s ~ ~ ~

# set gamemode
gamemode survival @a

# clear inventory and xp
clear @a
xp set @a 0 levels
xp set @a 0 points

# kill player to fully reset all hidden numbers
kill @a

# schedule next step
# allow a delay for kill to process
schedule function racetotheend:game/start__ 20t