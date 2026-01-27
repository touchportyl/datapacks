# locks a player
tag @s add RE_locked

# save old gamemode
tag @s[gamemode=survival] add RE_old_gamemode_survival
tag @s[gamemode=creative] add RE_old_gamemode_creative
tag @s[gamemode=adventure] add RE_old_gamemode_adventure
tag @s[gamemode=spectator] add RE_old_gamemode_spectator

# change gamemode
gamemode spectator @s

# create lock marker
execute as @s at @s run function racetotheend:playerlock/createlock

# effects
effect give @s minecraft:blindness infinite 0 true