execute store result score VAR$lobby.music RaceToTheEnd run random value 1..5

# prevent same song from playing twice in a row
execute if score VAR$lobby.music RaceToTheEnd = VAR$lobby.music.previous RaceToTheEnd run return run function racetotheend:game/lobby/music/next

# arbitrary mapping of scores to tracks
execute if score VAR$lobby.music RaceToTheEnd matches 1 run function racetotheend:game/lobby/music/play {track:relic}
execute if score VAR$lobby.music RaceToTheEnd matches 2 run function racetotheend:game/lobby/music/play {track:pigstep}
execute if score VAR$lobby.music RaceToTheEnd matches 3 run function racetotheend:game/lobby/music/play {track:lava_chicken}
execute if score VAR$lobby.music RaceToTheEnd matches 4 run function racetotheend:game/lobby/music/play {track:creator}
execute if score VAR$lobby.music RaceToTheEnd matches 5 run function racetotheend:game/lobby/music/play {track:tears}

scoreboard players operation VAR$lobby.music.previous RaceToTheEnd = VAR$lobby.music RaceToTheEnd
scoreboard players operation VAR$lobby.music.playing RaceToTheEnd = BOOL$true RaceToTheEnd