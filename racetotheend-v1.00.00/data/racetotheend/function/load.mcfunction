scoreboard objectives add RaceToTheEnd dummy [{"text":"Race To The End","color":"light_purple"}]

# default game states
execute unless score GAME$lobby RaceToTheEnd matches 0..1 run scoreboard players operation GAME$lobby RaceToTheEnd = BOOL$false RaceToTheEnd
execute unless score GAME$active RaceToTheEnd matches 0..1 run scoreboard players operation GAME$active RaceToTheEnd = BOOL$false RaceToTheEnd
execute unless score GAME$stopped RaceToTheEnd matches 0..1 run scoreboard players operation GAME$stopped RaceToTheEnd = BOOL$false RaceToTheEnd

# feedback
tellraw @a [{"text":" ","color":"gray"},{"text":"Race to the End","color":"light_purple"},{"text":" > "},{"text":"Datapack loaded!","color":"white"}]
execute as @a at @s run function racetotheend:_packages/effects/notification

# special case for handling game
execute if score GAME$active RaceToTheEnd = BOOL$true RaceToTheEnd run return run tellraw @a [{"text":" ","color":"gray"},{"text":"Race to the End","color":"light_purple"},{"text":" > "},{"text":"Game is active! /reload may break things.","color":"white"}]

# load common constants
function racetotheend:constants

# setup packages
function racetotheend:_packages/healthdisplay/setup
function racetotheend:_packages/nocollision/setup

# setup modules
function racetotheend:commands/setup
function racetotheend:beddetection/setup
function racetotheend:death/setup
function racetotheend:dimensiontracker/setup
#function racetotheend:goldradar/setup
function racetotheend:playerlock/setup
function racetotheend:ranking/setup
function racetotheend:splits/setup
function racetotheend:locator/setup

# restart loops
function racetotheend:stoploops
function racetotheend:startloops

# special case for handling lobby
execute if score GAME$lobby RaceToTheEnd = BOOL$true RaceToTheEnd run function racetotheend:game/lobby/cleanup
execute if score GAME$lobby RaceToTheEnd = BOOL$true RaceToTheEnd run schedule function racetotheend:game/lobby/create 1t