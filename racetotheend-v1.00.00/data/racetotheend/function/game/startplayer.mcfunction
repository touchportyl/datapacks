# setup advancements
gamerule minecraft:show_advancement_messages false
advancement revoke @s everything
advancement grant @s everything
advancement revoke @s from racetotheend:splits/start
gamerule minecraft:show_advancement_messages true
advancement grant @s only racetotheend:splits/start

# setup scoreboards
function racetotheend:splits/reset
scoreboard objectives setdisplay sidebar RE_SplitCount

# clear inventory
clear @s

# kill player
kill @s

# this starts the game for each player
scoreboard players set @s RE_SplitCount 1