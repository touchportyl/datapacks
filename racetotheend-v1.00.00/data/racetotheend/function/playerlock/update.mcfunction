# tp all players to their lock markers
execute as @a[tag=RE_locked] at @s run tp @s @n[type=minecraft:marker,tag=RE_playerlock_marker]

schedule function racetotheend:playerlock/update 1t