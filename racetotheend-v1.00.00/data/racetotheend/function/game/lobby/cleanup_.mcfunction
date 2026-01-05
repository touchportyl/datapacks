function racetotheend:game/lobby/music/stop

schedule clear racetotheend:game/lobby/update

execute at @n[tag=RE_lobby_root] run fill ~-10 ~-1 ~-10 ~10 ~7 ~10 minecraft:air replace

tp @e[tag=RE_lobby] ~ -65 ~
kill @e[tag=RE_lobby]

tp @a[tag=RE_in_lobby] ~ ~ ~
spawnpoint @a[tag=RE_in_lobby] ~ ~ ~
tag @a[tag=RE_in_lobby] remove RE_in_lobby

tag @a[tag=RE_lobby_mannequin_retaliation_target] remove RE_lobby_mannequin_retaliation_target
scoreboard objectives remove RE_NPCAnger

scoreboard players operation GAME$lobby RaceToTheEnd = BOOL$false RaceToTheEnd