tp @s @n[tag=RE_lobby_root]
execute as @s at @s run tp @s ~ ~ ~ 180 -10
tag @s add RE_in_lobby
spawnpoint @s ~ ~ ~
gamemode adventure @s
function racetotheend:_packages/effects/teleport