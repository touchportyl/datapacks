# first lobby music
scoreboard players operation VAR$lobby.music.playing RaceToTheEnd = BOOL$true RaceToTheEnd
scoreboard players set VAR$lobby.music RaceToTheEnd 1
scoreboard players set VAR$lobby.music.previous RaceToTheEnd 1
function racetotheend:game/lobby/music/play {track:relic}