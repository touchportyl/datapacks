# this starts the game for all players

execute if score GAME$lobby RaceToTheEnd = BOOL$true RaceToTheEnd run function racetotheend:game/lobby/cleanup
execute if score GAME$active RaceToTheEnd = BOOL$true RaceToTheEnd run return fail
execute if score GAME$stopped RaceToTheEnd = BOOL$true RaceToTheEnd run return fail

# doing this forces create to execute at the world's spawn point
schedule function racetotheend:game/start_ 10t