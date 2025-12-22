# set gamemode
tag @s[gamemode=survival] add RE_locator_old_gamemode_survival
tag @s[gamemode=creative] add RE_locator_old_gamemode_creative
tag @s[gamemode=spectator] add RE_locator_old_gamemode_spectator
tag @s[gamemode=adventure] add RE_locator_old_gamemode_adventure
gamemode spectator @s

schedule function racetotheend:locator/stronghold/range/process 3s
schedule function racetotheend:locator/stronghold/range/tick 1t