execute if score GAME$lobby RaceToTheEnd = BOOL$true RaceToTheEnd run function racetotheend:game/lobby/cleanup
#execute unless score GAME$stopped RaceToTheEnd = BOOL$true RaceToTheEnd run return fail

# reset advancements
advancement revoke @a everything

schedule function racetotheend:uninstall 5t
schedule function racetotheend:load 10t