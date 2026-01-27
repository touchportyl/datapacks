execute if score GAME$lobby RaceToTheEnd matches 1 run function racetotheend:game/lobby/cleanup
execute if score GAME$active RaceToTheEnd matches 1 run function racetotheend:game/stop

# deferred uninstall to allow ongoing functions to end cleanly
schedule function racetotheend:uninstall_ 2t