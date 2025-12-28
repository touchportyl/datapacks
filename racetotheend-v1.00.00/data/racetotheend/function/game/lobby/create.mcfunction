execute if score GAME$lobby RaceToTheEnd = BOOL$true RaceToTheEnd run return fail
execute if score GAME$active RaceToTheEnd = BOOL$true RaceToTheEnd run return fail
execute if score GAME$stopped RaceToTheEnd = BOOL$true RaceToTheEnd run return fail

# doing this forces create to execute at the world's spawn point
schedule function racetotheend:game/lobby/create_ 1t