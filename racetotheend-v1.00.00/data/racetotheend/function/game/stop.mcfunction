execute if score GAME$lobby RaceToTheEnd = BOOL$true RaceToTheEnd run return fail
execute if score GAME$active RaceToTheEnd = BOOL$false RaceToTheEnd run return fail

# this stops the game for all players

schedule clear racetotheend:game/start___

function racetotheend:playerlock/unlockall
title @a clear

scoreboard players operation GAME$active RaceToTheEnd = BOOL$false RaceToTheEnd
scoreboard players operation GAME$stopped RaceToTheEnd = BOOL$true RaceToTheEnd

function racetotheend:stoploops

function racetotheend:goldradar/cleanup
function racetotheend:locator/cleanup
function racetotheend:dimensiontracker/cleanup

function racetotheend:_packages/gamerules/lobby

function racetotheend:startloops