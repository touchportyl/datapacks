# unlocks a player
tag @s remove RE_locked

# remove marker
kill @n[type=minecraft:marker,tag=RE_playerlock_marker,distance=..2]

# remove effect
effect clear @s minecraft:blindness
effect give @s minecraft:blindness 1 0 true

# change gamemode
gamemode survival @s[tag=RE_old_gamemode_survival]
gamemode creative @s[tag=RE_old_gamemode_creative]
gamemode adventure @s[tag=RE_old_gamemode_adventure]
gamemode spectator @s[tag=RE_old_gamemode_spectator]
# remove old gamemode tags
tag @s remove RE_old_gamemode_survival
tag @s remove RE_old_gamemode_creative
tag @s remove RE_old_gamemode_adventure
tag @s remove RE_old_gamemode_spectator

# playsound
function racetotheend:_packages/effects/notification