execute if score VAR$lobby.music.playing RaceToTheEnd = BOOL$true RaceToTheEnd at @n[tag=RE_lobby_root] positioned ~ ~ ~4 run particle minecraft:note ~ ~1.3 ~ 0.1 0 0.1 0 1 force @a[tag=RE_in_lobby]

schedule function racetotheend:game/lobby/music/particles 10t