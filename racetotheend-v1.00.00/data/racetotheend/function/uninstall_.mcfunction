function racetotheend:stoploops

function racetotheend:commands/cleanup
function racetotheend:beddetection/cleanup
function racetotheend:death/cleanup
function racetotheend:dimensiontracker/cleanup
function racetotheend:goldradar/cleanup
function racetotheend:playerlock/cleanup
function racetotheend:splits/cleanup
function racetotheend:locator/cleanup

function racetotheend:_packages/healthdisplay/cleanup
function racetotheend:_packages/nocollision/cleanup
function racetotheend:_packages/gamerules/1.21.11

tag @a[tag=RE_assist] remove RE_assist
tag @a[tag=RE_winner] remove RE_winner

scoreboard objectives remove RaceToTheEnd

tellraw @a [{"text":" ","color":"gray"},{"text":"Race to the End","color":"light_purple"},{"text":" > "},{"text":"Datapack uninstalled!","color":"white"}]
execute as @a at @s run function racetotheend:_packages/effects/notification